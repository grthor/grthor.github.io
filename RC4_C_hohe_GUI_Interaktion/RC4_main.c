#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>

// Include the RC4 Method used in the WebAssembly RC4 Example
#include "RC4C_ohne_include.c"

void printToGUI(int currentValue);

// Array for the key
int* key;
// Length of the key
int keylength;

// Array for the plaintext
int* plaintext;
// Length of the plaintext
int plaintexlength;

// Array for the ciphertext
int* ciphertext;

// Counter used to store the ciphertext
int counter = 0;

int main(int argc, char* argv[]) {
	// Erste Zeitmessung
	clock_t time1 = clock();

	// Check if the user entered a custom key and plaintextlength
	if (argc == 1) {
		// Set the default keylength 5.
		keylength = 5;

		// Allocate memory for the key
		key = malloc(keylength * sizeof(int));
		for (int i = 0; i < 5; i++) {
			key[i] = i + 1;
		}

		// No key or plaintext entered
		// Set plaintextlength to default 128MB.
		plaintexlength = 134217728;
	}
	// If the user entered a key and plaintext use it.
	else if (argc == 3) {
		// The user entered a plaintextlength. Use it.
		plaintexlength = (int)strtol(argv[1], NULL, 10);

		// Zähle die Anzahl an Bytes im Schlüssel
		size_t inputlength = strlen(argv[2]);
		int spaceCounter = 0;
		for (unsigned int i = 0; i < inputlength; i++) {
			if (isspace(argv[2][i])) {
				spaceCounter++;
			}
		}
		keylength = spaceCounter + 1;

		// Allocate memory for the key
		key = malloc(keylength * sizeof(int));

		// Zerlege den eingegebenen Key in seine Bytes und konvertiere sie von hex zu dec.
		// Fill key array with entered values
#pragma warning(suppress : 4996)
		char* token = strtok(argv[2], " ");
		int counter = 0;
		while (token != NULL) {
			key[counter] = (int) strtol(token, NULL, 16);
			counter++;
#pragma warning(suppress : 4996)
			token = strtok(NULL, " ");
		}
	}

	// Print key to conosle.
	printf("%s\n", "Input");
	printf("%s", "Key (hex):\t\t");
	for (int i = 0; i < keylength; i++) {
		printf("%02X ", key[i]);
	}
	// Print plaintexlength to concole
	printf("\n%s", "Plaintextlength:\t");
	printf("%d Byte\n", plaintexlength);


	clock_t time2 = clock();

	// Erzeuge einen zufälligen Klartext
	plaintext = malloc(plaintexlength * sizeof(int));

	// Create a random plaintext.
	srand(time(0));
	for (int i = 0; i < plaintexlength; i++) {
		plaintext[i] = rand() % (255 + 1);
	}

	clock_t time3 = clock();

	// Allocate memory for the ciphertext.
	ciphertext = malloc(plaintexlength * sizeof(int));

	// encrypt
	rc4(key, keylength, plaintext, plaintexlength);

	clock_t time4 = clock();

	// Print the first bytes to the GUI.
	int minimum = 16;
	if (plaintexlength < 16) {
		minimum = plaintexlength;
	}
	printf("\n%s\n", "Output");
	printf("%s\t", "First bytes of the ciphertext:");
	for (int i = 0; i < minimum; i++) {
		printf("%02X ", ciphertext[i]);
	}

	clock_t time5 = clock();

	printf("%s", "\n\nSchluessel einlesen und konvertieren:\t");
	printf("%d ms", time2 - time1);
	printf("%s", "\nZufaelligen Klartext erzeugen:\t\t");
	printf("%d ms", time3 - time2);
	printf("%s", "\nText verschluesseln:\t\t\t");
	printf("%d ms", time4 - time3);
	printf("%s", "\nErgebnis in GUI ausgeben:\t\t");
	printf("%d ms\n", time5 - time4);

	return 0;
}

/*
Saves the given value at the position of counter to the ciphertext
*/
void printToGUI(int currentValue) {
	ciphertext[counter] = currentValue;
	counter++;
}