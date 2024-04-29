const { WASI } = require("@wasmer/wasi");
const { WasmFs } = require("@wasmer/wasmfs");

module.exports.init = async () => {
  const { NAPI } = await import("../../../Sources/FishyJoesNodeRuntime/Templates/wasm-napi.js");

  let napi = new NAPI(WASI, WasmFs);
  const importObject = {
    ...napi.exports,
  };
  importObject.env.main = () => {}

  const path = await import('path');
  const url = await import('url');
  const fs = await import('fs');
  // const dirname = path.dirname(url.fileURLToPath(import.meta.url));
  const binary = fs.readFileSync(path.join(__dirname, 'out.wasm'));
  const wasmPromise = WebAssembly.instantiate(binary, importObject);

  const { instance } = await wasmPromise;
  const library = napi.init(instance);
  return library
};
