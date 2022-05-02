import { WASI } from "@wasmer/wasi";
import { WasmFs } from "@wasmer/wasmfs";
import { NAPI } from "./wasm-napi.js";

export const init = async () => {
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
      fs: wasmFs.fs,
    }
  });
  let napi = new NAPI();
  const importObject = {
    wasi_snapshot_preview1: wasi.wasiImport,
    ...napi.exports,
  };

  let wasmPromise
  if (typeof(fetch) === 'function') {
    const response = await import("./__MODULE_NAME__.wasm").then((module) => fetch(module.default));
    wasmPromise = WebAssembly.instantiateStreaming(response, importObject);
  } else {
    const path = await import(/* webpackIgnore: true */ 'path');
    const url = await import(/* webpackIgnore: true */ 'url');
    const fs = await import(/* webpackIgnore: true */ 'fs');
    const dirname = path.dirname(url.fileURLToPath(import.meta.url));
    const binary = fs.readFileSync(path.join(dirname, '__MODULE_NAME__.wasm'));
    wasmPromise = WebAssembly.instantiate(binary, importObject);
  }
  const { instance } = await wasmPromise;
  console.log(instance);
  wasi.start(instance);
  const __MODULE_NAME__ = napi.init(instance);
  return __MODULE_NAME__.default
};

export const __MODULE_NAME__ = await init();
export default __MODULE_NAME__;
