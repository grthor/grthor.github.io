#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>

// Include the RC4 Method used in the WebAssembly RC4 Example
 #include "RC4C_ohne_include.c"

void printToGUI(int currentValue);

int main(int argc, char* argv[]) {

	clock_t time1 = clock();
	int plaintexlength = (int)strtol(argv[1], NULL, 10);

	// Zähle die Anzahl an Bytes im Schlüssel
	size_t inputlength = strlen(argv[2]);
	int spaceCounter = 0;
	for (unsigned int i = 0; i < inputlength; i++) {
		if (isspace(argv[2][i])) {
			spaceCounter++;
		}
	}
	int keylength = spaceCounter + 1;


	// Zerlege den eingegebenen Key in seine Bytes und konvertiere sie von hex zu dec.
	int* key = malloc(keylength * sizeof(int));
	// Prüfen, ob Speicher reserviert wurde.
	if (key == NULL) {
		return -1;
	}
#pragma warning(suppress : 4996)
	char* token = strtok(argv[2], " ");
	int counter = 0;
	while (token != NULL) {
		key[counter] = (int)strtol(token, NULL, 16);
		counter++;
#pragma warning(suppress : 4996)
		token = strtok(NULL, " ");

	}

	clock_t time2 = clock();

	// Erzeuge einen zufälligen Klartext
	int* plaintext = malloc(plaintexlength * sizeof(int));
	// Prüfen, ob Speicher für den Klartext reserviert wurde.
	if (plaintext == NULL) {
		return -1;
	}
	for (int i = 0; i < plaintexlength; i++) {
		plaintext[i] = rand() % (255 + 1);
	}

	clock_t time3 = clock();

	// Verschlüsseln
	rc4(key, keylength, plaintext, plaintexlength);

	clock_t time4 = clock();

	// Ausgeben der ersten 16 Byte
	/*int minimum = 16;
	if (plaintexlength < 16) {
		minimum = plaintexlength;
	}
	for (int i = 0; i < minimum; i++) {
		printf("%X ", ciphertext[i]);
	}*/

	clock_t time5 = clock();

	printf("%s", "\nSchluessel einlesen und konvertieren\t");
	printf("%d ms", time2 - time1);
	printf("%s", "\nZufaelligen Klartext erzeugen\t\t");
	printf("%d ms", time3 - time2);
	printf("%s", "\nText verschluesseln\t\t\t");
	printf("%d ms", time4 - time3);
	printf("%s", "\nErgebnis in GUI ausgeben\t\t");
	printf("%d ms", time5 - time4);


	return 0;
}

void printToGUI(int currentValue) {
	printf("%X ", currentValue);
}