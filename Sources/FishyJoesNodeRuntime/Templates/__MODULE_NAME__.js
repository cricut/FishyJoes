import { NAPI } from "./wasm-napi.js";
import { buildImportObject, wireWorkerMessages } from "./wasm-runtime.js";
import { WASI, OpenFile, File, ConsoleStdout } from "@bjorn3/browser_wasi_shim";
import * as __MODULE_NAME__Extensions from "./__MODULE_NAME__.extensions.js";
import * as __MODULE_DEPENDENCY__Extensions from "./__MODULE_DEPENDENCY__.extensions.js";

export const init = async () => {
  let napi = new NAPI({ WASI, OpenFile, File, ConsoleStdout });

  const memory = new WebAssembly.Memory({
    initial: 585,
    maximum: 16384,
    shared: true,
  });

  // SharedArrayBuffer holding the next pthread id (Int32 at offset 0).
  const tidBuffer = new SharedArrayBuffer(4);

  // Load Node worker_threads if available; fall back to null in webpack /
  // browser contexts where wasi:thread-spawn is unsupported.
  let workerThreadsModule = null;
  try {
    workerThreadsModule = await import(/* webpackIgnore: true */ 'node:worker_threads');
  } catch {
    workerThreadsModule = null;
  }

  let wasmModuleRef = null;
  let workerPath = null;
  const spawnWorker = ({ tid, startArg }) => {
    if (workerThreadsModule === null) {
      throw new Error("wasi:thread-spawn requires Node worker_threads (not available in this environment)");
    }
    if (wasmModuleRef === null || workerPath === null) {
      throw new Error("wasi:thread-spawn called before the wasm module was compiled");
    }
    const worker = new workerThreadsModule.Worker(workerPath, {
      workerData: { wasmModule: wasmModuleRef, memory, tidBuffer, tid, startArg },
    });
    wireWorkerMessages(worker, { napi, spawnWorker });
  };

  // wasi:thread-spawn host. Synchronous per the ABI — bump the shared tid
  // counter and dispatch the actual Worker creation through spawnWorker.
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
  // instantiate. This replaces the previous single-step instantiate.
  let wasmModule;
  if (typeof(__webpack_require__) === 'function' && typeof(fetch) === 'function') {
    const response = await import("./__MODULE_NAME__.wasm").then((module) => fetch(module.default));
    wasmModule = await WebAssembly.compileStreaming(response);
  } else {
    const path = await import(/* webpackIgnore: true */ 'path');
    const url = await import(/* webpackIgnore: true */ 'url');
    const fs = await import(/* webpackIgnore: true */ 'fs');
    const dirname = path.dirname(url.fileURLToPath(import.meta.url));
    const binary = fs.readFileSync(path.join(dirname, '__MODULE_NAME__.wasm'));
    wasmModule = await WebAssembly.compile(binary);
    workerPath = url.pathToFileURL(path.join(dirname, '__MODULE_NAME__.worker.js'));
  }
  wasmModuleRef = wasmModule;
  const instance = await WebAssembly.instantiate(wasmModule, importObject);
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
