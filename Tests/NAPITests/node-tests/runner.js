const { WASI } = require("@wasmer/wasi");
const { WasmFs } = require("@wasmer/wasmfs");

module.exports.init = async () => {
  const { NAPI } = await import("../../../../../../../Sources/FishyJoesNodeRuntime/js/wasm-napi.js");
  const wasmFs = new WasmFs();

  // Output stdout and stderr to console
  const originalWriteSync = wasmFs.fs.writeSync;
  var logBuffer = ""
  var errorBuffer = ""
  wasmFs.fs.writeSync = (fd, buffer, ...args) => {
    const text = new TextDecoder("utf-8").decode(buffer);
    switch (fd) {
    case 1:
      var lines = (logBuffer + text).split('\n')
      logBuffer = lines.pop()
      lines.forEach(e => console.log(e))
      break;
    case 2:
      var lines = (errorBuffer + text).split('\n')
      errorBuffer = lines.pop()
      lines.forEach(e => console.error(e))
      break;
    }
    return originalWriteSync(fd, buffer, ...args);
  };

  let wasi = new WASI({
    args: [], env: {},
    bindings: {
      ...WASI.defaultBindings,
      fs: wasmFs.fs
    }
  });
  let napi = new NAPI();
  const importObject = {
    wasi_snapshot_preview1: wasi.wasiImport,
    napi: napi.exports,
    env: { main() {} },
  };

  const path = await import('path');
  const url = await import('url');
  const fs = await import('fs');
  // const dirname = path.dirname(url.fileURLToPath(import.meta.url));
  const binary = fs.readFileSync(path.join(__dirname, 'out.wasm'));
  const wasmPromise = WebAssembly.instantiate(binary, importObject);

  const { instance } = await wasmPromise;
  wasi.start(instance);
  const plugin = napi.init(instance);
  return plugin
};
