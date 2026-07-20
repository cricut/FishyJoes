/**
 * This file is for DS desktop compatibility. __MODULE_NAME__.js uses a few things that
 * were causing grief to the angular cli bundler such as async exports, dynamic imports
 * of wasm files, and some of the webpack magic comments to exclude node chunks
 */
import { NAPI } from "./wasm-napi.js";
import { WASI } from "@wasmer/wasi";
import { WasmFs } from "@wasmer/wasmfs";
import * as __MODULE_NAME__Extensions from "./__MODULE_NAME__.extensions.js";
import * as __MODULE_DEPENDENCY__Extensions from "./__MODULE_DEPENDENCY__.extensions.js";

let __MODULE_NAME__;
let __MODULE_DEPENDENCY__;

/**
 * Initialize the Wasm module.
 *
 * `wasmSource` optionally supplies the binary, so a host that already holds it
 * (or shares one download between the main thread and workers) can instantiate
 * without this module fetching it again:
 * - `WebAssembly.Module`: instantiated directly (compile is skipped).
 * - `ArrayBuffer` / typed array view: compiled and instantiated from bytes.
 * - `Response` or a promise of one (e.g. a `fetch(...)` call): streamed;
 *   the response must carry `Content-Type: application/wasm`.
 * - omitted: fetches "__MODULE_NAME__.wasm" relative to the document, as before.
 */
const init = async (wasmSource) => {
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
  } else if (wasmSource instanceof ArrayBuffer || ArrayBuffer.isView(wasmSource)) {
    ({ instance } = await WebAssembly.instantiate(wasmSource, importObject));
  } else {
    ({ instance } = await WebAssembly.instantiateStreaming(wasmSource ?? fetch("__MODULE_NAME__.wasm"), importObject));
  }
  const library = napi.init(instance);
  ({
    __MODULE_NAME__,
    __MODULE_DEPENDENCY__,
  } = library);
  __MODULE_DEPENDENCY__Extensions.applyExtensions(library, { wasmNapi: napi });
  __MODULE_NAME__Extensions.applyExtensions(library, { wasmNapi: napi });
  return library;
};

export {
  init,
  __MODULE_NAME__,
  __MODULE_DEPENDENCY__,
};
