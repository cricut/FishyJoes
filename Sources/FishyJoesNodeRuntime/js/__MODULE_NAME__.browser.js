/**
 * This file is for DS desktop compatibility. __MODULE_NAME__.js uses a few things that
 * were causing grief to the angular cli bundler such as async exports, dynamic imports
 * of wasm files, and some of the webpack magic comments to exclude node chunks
 */
import { WASI } from "@wasmer/wasi";
import { WasmFs } from "@wasmer/wasmfs";
import { NAPI } from "./wasm-napi.js";
import * as __MODULE_NAME__Extensions from "./__MODULE_NAME__.extensions.js";
import * as __MODULE_DEPENDENCY__Extensions from "./__MODULE_DEPENDENCY__.extensions.js";

let __MODULE_NAME__;
let __MODULE_DEPENDENCY__;

const init = async () => {
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
      fs: wasmFs.fs
    }
  });
  let napi = new NAPI();
  const importObject = {};
  const importsToMerge = [
    { wasi_snapshot_preview1: wasi.wasiImport },
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

  const response = await fetch("__MODULE_NAME__.wasm");
  const wasmPromise = WebAssembly.instantiateStreaming(response, importObject);

  const { instance } = await wasmPromise;
  console.log(instance);
  wasi.start(instance);
  const library = napi.init(instance);
  ({
    __MODULE_NAME__,
    __MODULE_DEPENDENCY__,
  } = library);
  __MODULE_DEPENDENCY__Extensions.applyExtensions(library);
  __MODULE_NAME__Extensions.applyExtensions(library);
  return library;
};

export {
  init,
  __MODULE_NAME__,
  __MODULE_DEPENDENCY__,
};
