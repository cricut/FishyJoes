module.exports.init = async () => {
  const { NAPI } = await import("../../../../../../../Sources/FishyJoesNodeRuntime/Templates/wasm-napi.js");
  const { WASI, OpenFile, File, ConsoleStdout } = await import("@bjorn3/browser_wasi_shim");

  let napi = new NAPI({ WASI, OpenFile, File, ConsoleStdout });
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
