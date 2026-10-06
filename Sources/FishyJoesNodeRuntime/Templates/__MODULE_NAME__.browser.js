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

const isBufferSource = (source) => source instanceof ArrayBuffer || ArrayBuffer.isView(source);

// Resolves `{ module, instance }` from the init options:
// - `module`: a pre-compiled `WebAssembly.Module`, instantiated as is (nothing is fetched or compiled)
// - `source`: a `Response`, a promise of one, or a `BufferSource` to compile instead of fetching the bundled binary
// - neither: fetches "__MODULE_NAME__.wasm" relative to the document
const instantiate = async (options, importObject) => {
  if (options.module !== undefined) {
    if (!(options.module instanceof WebAssembly.Module)) {
      throw new TypeError("init(): `module` must be a WebAssembly.Module");
    }
    const instance = await WebAssembly.instantiate(options.module, importObject);
    return { module: options.module, instance };
  }
  if (isBufferSource(options.source)) {
    return WebAssembly.instantiate(options.source, importObject);
  }
  const wasmResponse = options.source ?? fetch("__MODULE_NAME__.wasm");
  return WebAssembly.instantiateStreaming(wasmResponse, importObject);
};

/**
 * Loads the module and its dependencies. Every call creates a fresh NAPI and a fresh instance.
 * `options.module` instantiates a pre-compiled module, `options.source` compiles a caller-supplied binary;
 * without either, "__MODULE_NAME__.wasm" is fetched and compiled.
 * The returned library carries the compiled module as `wasmModule`.
 */
const init = async (options = {}) => {
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

  const { module, instance } = await instantiate(options, importObject);
  const library = napi.init(instance);
  ({
    __MODULE_NAME__,
    __MODULE_DEPENDENCY__,
  } = library);
  __MODULE_DEPENDENCY__Extensions.applyExtensions(library, { wasmNapi: napi });
  __MODULE_NAME__Extensions.applyExtensions(library, { wasmNapi: napi });
  library.wasmModule = module;
  return library;
};

export {
  init,
  __MODULE_NAME__,
  __MODULE_DEPENDENCY__,
};
