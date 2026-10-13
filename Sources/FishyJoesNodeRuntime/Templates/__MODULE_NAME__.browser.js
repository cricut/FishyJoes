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

const protoLibrary = async () => ({
  module: await WebAssembly.compileStreaming(fetch("__MODULE_NAME__.wasm")),
});

const init = async (compiled) => {
  const { module } = compiled ?? await protoLibrary();
  if (!(module instanceof WebAssembly.Module)) {
    throw new TypeError("init(): `compiled` must come from protoLibrary()");
  }
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

  const instance = await WebAssembly.instantiate(module, importObject);
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
  protoLibrary,
  init,
  __MODULE_NAME__,
  __MODULE_DEPENDENCY__,
};
