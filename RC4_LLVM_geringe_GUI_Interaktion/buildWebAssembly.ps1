emsdk activate latest
emsdk_env.ps1

emcc RC4C_ohne_include.c -s EXPORTED_FUNCTIONS='["_rc4"]' -s ALLOW_MEMORY_GROWTH=1 -O3 -o a.out.wasm --no-entry
