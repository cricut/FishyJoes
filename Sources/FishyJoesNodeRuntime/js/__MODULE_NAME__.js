import { NAPI } from "./wasm-napi.js";
import { WASI } from "@wasmer/wasi";
import { WasmFs } from "@wasmer/wasmfs";
import * as __MODULE_NAME__Extensions from "./__MODULE_NAME__.extensions.js";
import * as __MODULE_DEPENDENCY__Extensions from "./__MODULE_DEPENDENCY__.extensions.js";

export const init = async () => {
  let napi = new NAPI(WASI, WasmFs);
  const importObject = {};
  const importsToMerge = [
    napi.exports,
    __MODULE_DEPENDENCY__Extensions.imports,
    __MODULE_NAME__Extensions.imports,
  ];
  for (const imports of importsToMerge) {
    for (const [namespace, functions] of Object.entries(imports)) {
      importObject[namespace] = {
        ...importObject[namespace],
        ...functions
      }
    }
  }

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
  // console.log(instance);
  const library = napi.init(instance);
  __MODULE_DEPENDENCY__Extensions.applyExtensions(library);
  __MODULE_NAME__Extensions.applyExtensions(library);
  return library;
};

export const {
  __MODULE_NAME__,
  __MODULE_DEPENDENCY__,
} = await init();
export default __MODULE_NAME__;
