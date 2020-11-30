/*
 * RC4 symmetric cipher encryption/decryption
 *
 * @license Public Domain
 * @param string key - secret key for encryption/decryption
 * @param string str - string to be encrypted/decrypted
 * @return string
 */
function rc4(key, plaintext) {
	var s = [];
	var i = 0;
	var j = 0;
	var x;
	var keylength = key.length;
	var strlength = plaintext.length;
	
	for (var i = 0; i < 256; i++) {
		s[i] = i;
	}
	
	for (i = 0; i < 256; i++) {
		j = (j + s[i] + key[i % keylength]) % 256;
		x = s[i];
		s[i] = s[j];
		s[j] = x;
	}
	
	i = 0;
	j = 0;
	ciphertext = [];
	vector = [];
	var temp;
	
	for (var y = 0; y < strlength; y++) {
		i = (i + 1) % 256;
		j = (j + s[i]) % 256;
		x = s[i];
		s[i] = s[j];
		s[j] = x;
		temp = s[(s[i] + s[j]) % 256];
		vector.push(temp);
		ciphertext.push(plaintext[y] ^ temp);
	}
	
	return ciphertext;
}