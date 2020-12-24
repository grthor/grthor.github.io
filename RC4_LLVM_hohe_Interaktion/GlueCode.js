// Initial memory of 256 pages = 16384 kb = 16777216 Byte
// Max memory of 16384 pages = 1gb = 1073741824 Byte
var mymemory = new WebAssembly.Memory(
  {
    initial:256,
    maximum:32768
  }
);

// var buffer = new Uint32Array(mymemory.buffer);

// 256 Pages. 1 page a 64kib
// 256 Pages. 1 page a 64kib
var importObject = {
  env: {
    memory: mymemory,
    printToGUI: value => showNumberInGUI(value)
  }
};

function initializeWebAssembly() {
  return WebAssembly.instantiateStreaming(fetch('RC4C_ohne_include.wasm'), importObject);
}

function getBuffer() {
  return mymemory.buffer;
}

function growMemory(additionalPages) {
  mymemory.grow(additionalPages);
}
