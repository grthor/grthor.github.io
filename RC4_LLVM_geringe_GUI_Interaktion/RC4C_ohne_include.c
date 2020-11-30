void rc4(int *key, int key_length, int *plaintext, int plaintext_length,
		int *ciphertext);

/**
 * Führt eine herkömmliche RC4 Stromverschlüsselung durch.
 * Argumente für die Methode sind ein Array mit dem Schlüssel
 * int *key
 */
void rc4(int *key, int key_length, int *plaintext, int plaintext_length,
		int *ciphertext) {

	// Anlegen der benötigten Variablen
	int s[256];
	int i = 0;
	int j = 0;
	int x;
	
	// Füllen des Byte-Vektors (S-Box) mit initialen Werten
	for (int i = 0; i < 256; i++) {
		s[i] = i;
	}
	for (int i = 0; i < 256; i++) {
		j = (j + s[i] + key[i % key_length]) % 256;
		x = s[i];
		s[i] = s[j];
		s[j] = x;
	}

	// Generieren des Bitstroms und verschlüsseln.
	i = 0;
	j = 0;
	for (int y = 0; y < plaintext_length; y++) {
		i = (i + 1) % 256;
		j = (j + s[i]) % 256;
		x = s[i];
		s[i] = s[j];
		s[j] = x;
		// Speichert des Vektor anstatt des Schlüsseltextes um die korrekte Funktion
		// des Algorithmus sicherzustellen.
		// ciphertext[y] = s[(s[i] + s[j]) % 256];
		// Speichern des Schlüsseltexts
		ciphertext[y] = plaintext[y] ^ s[(s[i] + s[j]) % 256];
	}
}

