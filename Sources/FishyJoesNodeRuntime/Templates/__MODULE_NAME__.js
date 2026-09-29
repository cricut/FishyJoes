import { NAPI } from "./wasm-napi.js";
import { WASI } from "@wasmer/wasi";
import { WasmFs } from "@wasmer/wasmfs";
import * as __MODULE_NAME__Extensions from "./__MODULE_NAME__.extensions.js";
import * as __MODULE_DEPENDENCY__Extensions from "./__MODULE_DEPENDENCY__.extensions.js";

/**
 * Initialize the Wasm module.
 *
 * `wasmSource` optionally supplies the binary so the host can share one copy
 * instead of this module loading it again:
 * - `WebAssembly.Module`: instantiated directly (compile is skipped).
 * - `ArrayBuffer` / typed array view: compiled and instantiated from bytes.
 * - `Response` or a promise of one: read into bytes, then instantiated
 *   (byte path, so it works on runtimes without `instantiateStreaming`).
 * - omitted: bundler `fetch` or filesystem read of "__MODULE_NAME__.wasm", as before.
 */
export const init = async (wasmSource) => {
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

  let instance;
  if (wasmSource instanceof WebAssembly.Module) {
    instance = await WebAssembly.instantiate(wasmSource, importObject);
  } else if (wasmSource !== undefined) {
    const binary = wasmSource instanceof ArrayBuffer || ArrayBuffer.isView(wasmSource)
      ? wasmSource
      : await (await wasmSource).arrayBuffer();
    ({ instance } = await WebAssembly.instantiate(binary, importObject));
  } else if (typeof(__webpack_require__) === 'function' && typeof(fetch) === 'function') {
    const response = await import("./__MODULE_NAME__.wasm").then((module) => fetch(module.default));
    ({ instance } = await WebAssembly.instantiateStreaming(response, importObject));
  } else {
    const path = await import(/* webpackIgnore: true */ 'path');
    const url = await import(/* webpackIgnore: true */ 'url');
    const fs = await import(/* webpackIgnore: true */ 'fs');
    const dirname = path.dirname(url.fileURLToPath(import.meta.url));
    const binary = fs.readFileSync(path.join(dirname, '__MODULE_NAME__.wasm'));
    ({ instance } = await WebAssembly.instantiate(binary, importObject));
  }
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
