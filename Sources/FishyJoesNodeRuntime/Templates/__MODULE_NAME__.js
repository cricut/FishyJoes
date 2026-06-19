import { NAPI } from "./wasm-napi.js";
import { WASI, OpenFile, File, ConsoleStdout } from "@bjorn3/browser_wasi_shim";
import * as __MODULE_NAME__Extensions from "./__MODULE_NAME__.extensions.js";
import * as __MODULE_DEPENDENCY__Extensions from "./__MODULE_DEPENDENCY__.extensions.js";

export const init = async () => {
  let napi = new NAPI({ WASI, OpenFile, File, ConsoleStdout });
  const importObject = {};
  const importsToMerge = [
    napi.exports,
    __MODULE_DEPENDENCY__Extensions.imports,
    __MODULE_NAME__Extensions.imports,
    {
      env: {
        memory: new WebAssembly.Memory({
          initial: 585,
          maximum: 16384,
          shared: true,
        })
      }
    },
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
  if (typeof(__webpack_require__) === 'function' && typeof(fetch) === 'function') {
    const response = await import("./__MODULE_NAME__.wasm").then((module) => fetch(module.default));
    debugger;
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
  __MODULE_DEPENDENCY__Extensions.applyExtensions(library, { wasmNapi: napi });
  __MODULE_NAME__Extensions.applyExtensions(library, { wasmNapi: napi });
  return library;
};

export const {
  __MODULE_NAME__,
  __MODULE_DEPENDENCY__,
} = await init();
export default __MODULE_NAME__;
