emsdk activate latest
emsdk_env.ps1

emcc RC4C_ohne_include.c -s EXPORTED_FUNCTIONS='["_rc4","_malloc","_free"]' -s EXPORTED_RUNTIME_METHODS='["ccall","cwrap"]' -s ALLOW_MEMORY_GROWTH=1 -O3 -s ERROR_ON_UNDEFINED_SYMBOLS=0 --js-library myLibrary.js -o RC4C_ohne_include.js
