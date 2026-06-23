/**
 * This file is for DS desktop compatibility. __MODULE_NAME__.js uses a few things that
 * were causing grief to the angular cli bundler such as async exports, dynamic imports
 * of wasm files, and some of the webpack magic comments to exclude node chunks.
 *
 * Threads are spawned via browser `Worker`s constructed from this module's
 * sibling __MODULE_NAME__.worker.js. Requires a cross-origin-isolated host
 * page (COOP/COEP) for SharedArrayBuffer support. Worker construction is
 * delegated to __MODULE_NAME__.spawner.js — see that file for the rationale.
 *
 * Browser-specific: the JS main thread cannot `atomic.wait32`, so wasi-libc
 * is flipped into busy-spin mode here via
 * `__wasilibc_enable_futex_busywait_on_current_thread` (gated by
 * `enableBusyFutex`).
 */
import { NAPI } from "./wasm-napi.js";
import { WASI, OpenFile, File, ConsoleStdout } from "@bjorn3/browser_wasi_shim";
import * as __MODULE_NAME__Extensions from "./__MODULE_NAME__.extensions.js";
import * as __MODULE_DEPENDENCY__Extensions from "./__MODULE_DEPENDENCY__.extensions.js";

let __MODULE_NAME__;
let __MODULE_DEPENDENCY__;

const init = async ({ enableBusyFutex = true } = {}) => {
  let napi = new NAPI({ WASI, OpenFile, File, ConsoleStdout });

  const memory = new WebAssembly.Memory({
    initial: 585,
    maximum: 16384,
    shared: true,
  });

  // SharedArrayBuffer holding the next pthread id (Int32 at offset 0).
  const tidBuffer = new SharedArrayBuffer(4);

  // Bring the spawner up early; spawn requests must not be routed through
  // main. See __MODULE_NAME__.spawner.js for the rationale.
  const spawner = new Worker(
    new URL('./__MODULE_NAME__.spawner.js', import.meta.url),
    { type: 'module' },
  );

  // Compile the wasm module so we can share it with the spawner before
  // dispatching any spawn requests.
  const wasmModule = await WebAssembly.compileStreaming(
    fetch(new URL('./__MODULE_NAME__.wasm', import.meta.url)),
  );

  // Init handshake: wait for spawner ack before threadSpawn could be invoked.
  await new Promise((resolve, reject) => {
    const timeout = setTimeout(() => reject(new Error('spawner did not ack init in 5s')), 5000);
    const onInitAck = (e) => {
      const msg = e.data;
      if (!msg) return;
      switch (msg.type) {
        case 'init_ack':
          clearTimeout(timeout);
          spawner.removeEventListener('message', onInitAck);
          resolve();
          break;
      }
    };
    spawner.addEventListener('message', onInitAck);
    spawner.postMessage({ type: 'init', wasmModule, memory, tidBuffer });
  });

  // After init, spawner only sends control messages — never proxies NAPI.
  // For each pthread Worker the spawner creates, it forwards a fresh
  // MessagePort here; that port is wired straight to napi.dispatchWorkerMessage.
  spawner.addEventListener('message', (e) => {
    const msg = e.data;
    if (!msg) return;
    switch (msg.type) {
      case 'spawn_worker_port':
        msg.port.onmessage = (ev) => napi.dispatchWorkerMessage(ev.data);
        break;
      case 'spawner_error':
        console.error('spawner error:', msg.error);
        break;
    }
  });

  const threadSpawn = (startArg) => {
    const tid = Atomics.add(new Int32Array(tidBuffer), 0, 1) + 1;
    spawner.postMessage({ type: 'spawn', tid, startArg });
    return tid;
  };

  const importObject = buildImportObject({
    napi,
    memory,
    threadSpawn,
    extensions: [__MODULE_DEPENDENCY__Extensions, __MODULE_NAME__Extensions],
  });
  const instance = await WebAssembly.instantiate(wasmModule, importObject);

  // Browser JS main thread cannot `memory.atomic.wait32`. Flip wasi-libc into
  // busy-spin mode on this thread BEFORE napi.init (which calls wasi.initialize
  // → runs Swift global ctors that may futex-wait). Per-thread flag, so workers
  // are unaffected. The symbol is force-exported via linkerSettings in the
  // generated Package.swift; optional chaining keeps older wasm artifacts that
  // don't export it working (they just won't get the fix).
  if (enableBusyFutex) {
    instance.exports.__wasilibc_enable_futex_busywait_on_current_thread?.();
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

function buildImportObject({ napi, memory, threadSpawn, extensions }) {
  const importObject = {};
  const importsToMerge = [
    napi.exports,
    ...extensions.map((e) => e.imports),
    {
      env: { memory },
      wasi: { "thread-spawn": threadSpawn },
    },
  ];
  for (const imports of importsToMerge) {
    for (const [namespace, functions] of Object.entries(imports)) {
      importObject[namespace] = {
        ...importObject[namespace],
        ...functions,
      };
    }
  }
  return importObject;
}
