/**
 * This file is for DS desktop compatibility. __MODULE_NAME__.js uses a few things that
 * were causing grief to the angular cli bundler such as async exports, dynamic imports
 * of wasm files, and some of the webpack magic comments to exclude node chunks.
 *
 * Threads are spawned via browser `Worker`s constructed from this module's
 * sibling __MODULE_NAME__.worker.js. Requires a cross-origin-isolated host
 * page (COOP/COEP) for SharedArrayBuffer support.
 */
import { NAPI } from "./wasm-napi.js";
import { buildImportObject, wireWorkerMessages } from "./wasm-runtime.js";
import { WASI, OpenFile, File, ConsoleStdout } from "@bjorn3/browser_wasi_shim";
import * as __MODULE_NAME__Extensions from "./__MODULE_NAME__.extensions.js";
import * as __MODULE_DEPENDENCY__Extensions from "./__MODULE_DEPENDENCY__.extensions.js";

let __MODULE_NAME__;
let __MODULE_DEPENDENCY__;

const init = async () => {
  let napi = new NAPI({ WASI, OpenFile, File, ConsoleStdout });

  const memory = new WebAssembly.Memory({
    initial: 585,
    maximum: 16384,
    shared: true,
  });

  // SharedArrayBuffer holding the next pthread id (Int32 at offset 0).
  const tidBuffer = new SharedArrayBuffer(4);

  let wasmModuleRef = null;
  const spawnWorker = ({ tid, startArg }) => {
    if (wasmModuleRef === null) {
      throw new Error("wasi:thread-spawn called before the wasm module was compiled");
    }
    const worker = new Worker(
      new URL('./__MODULE_NAME__.worker.js', import.meta.url),
      { type: 'module' },
    );
    wireWorkerMessages(worker, { napi, spawnWorker });
    worker.postMessage({
      type: '_init',
      wasmModule: wasmModuleRef,
      memory,
      tidBuffer,
      tid,
      startArg,
    });
  };

  const threadSpawn = (startArg) => {
    const tid = Atomics.add(new Int32Array(tidBuffer), 0, 1) + 1;
    spawnWorker({ tid, startArg });
    return tid;
  };

  const importObject = buildImportObject({
    napi,
    memory,
    threadSpawn,
    extensions: [__MODULE_DEPENDENCY__Extensions, __MODULE_NAME__Extensions],
  });

  // Compile first (so the module can be shared with worker threads), then
  // instantiate.
  const wasmModule = await WebAssembly.compileStreaming(fetch("__MODULE_NAME__.wasm"));
  wasmModuleRef = wasmModule;
  const instance = await WebAssembly.instantiate(wasmModule, importObject);
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
