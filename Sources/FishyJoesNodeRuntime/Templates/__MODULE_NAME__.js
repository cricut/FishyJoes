import { NAPI } from "./wasm-napi.js";
import { WASI } from "@wasmer/wasi";
import { WasmFs } from "@wasmer/wasmfs";
import * as __MODULE_NAME__Extensions from "./__MODULE_NAME__.extensions.js";
import * as __MODULE_DEPENDENCY__Extensions from "./__MODULE_DEPENDENCY__.extensions.js";

const isBufferSource = (source) => source instanceof ArrayBuffer || ArrayBuffer.isView(source);

// Normalizes a caller-supplied source (`Response`, a promise of one, or a `BufferSource`) to bytes,
// so instantiation does not depend on `instantiateStreaming` support in the runtime
const bytesOf = async (source) => {
  const resolved = await source;
  return isBufferSource(resolved) ? resolved : resolved.arrayBuffer();
};

/**
 * Loads the module and its dependencies. Every call creates a fresh NAPI and a fresh instance.
 * `options.module` instantiates a pre-compiled module, `options.source` compiles a caller-supplied binary;
 * without either, "__MODULE_NAME__.wasm" is loaded and compiled.
 * The returned library carries the compiled module as `wasmModule`.
 */
export const init = async (options = {}) => {
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
  if (options.module !== undefined) {
    if (!(options.module instanceof WebAssembly.Module)) {
      throw new TypeError("init(): `module` must be a WebAssembly.Module");
    }
    wasmPromise = WebAssembly.instantiate(options.module, importObject)
      .then((instance) => ({ module: options.module, instance }));
  } else if (options.source !== undefined) {
    wasmPromise = WebAssembly.instantiate(await bytesOf(options.source), importObject);
  } else if (typeof(__webpack_require__) === 'function' && typeof(fetch) === 'function') {
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
  const { module, instance } = await wasmPromise;
  const library = napi.init(instance);
  __MODULE_DEPENDENCY__Extensions.applyExtensions(library, { wasmNapi: napi });
  __MODULE_NAME__Extensions.applyExtensions(library, { wasmNapi: napi });
  library.wasmModule = module;
  return library;
};

export const {
  __MODULE_NAME__,
  __MODULE_DEPENDENCY__,
} = await init();
export default __MODULE_NAME__;
