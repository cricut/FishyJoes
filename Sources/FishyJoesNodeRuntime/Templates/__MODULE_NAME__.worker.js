// pthread worker: re-instantiates the same compiled wasm module against the
// shared memory and entered via wasi_thread_start. Host-agnostic — runs in
// either Node `worker_threads` or a browser `Worker`. All `Worker`
// construction is delegated to the main thread, so this file does not
// depend on `node:worker_threads`.
//
// Workers do NOT instantiate their own NAPI env. The wasm module's napi_*
// imports are satisfied by stateless proxies built by makeWorkerImports —
// thread-safe-function calls are forwarded to the main NAPI via the
// message port; every other napi_* call throws.
import { makeWorkerImports } from "./wasm-napi.js";
import { WASI, OpenFile, File, ConsoleStdout } from "@bjorn3/browser_wasi_shim";

// Acquire the message port + init data from whichever host runs us.
// Node: workerData carries it. Browser: main sends an `_init` postMessage.
const isNode = typeof process !== 'undefined' && process.versions && process.versions.node;
let port;
let initData;
if (isNode) {
  const wt = await import(/* webpackIgnore: true */ 'node:worker_threads');
  port = wt.parentPort;
  initData = wt.workerData;
} else {
  port = self;
  initData = await new Promise((resolve) => {
    const onInit = (e) => {
      if (e.data && e.data.type === '_init') {
        self.removeEventListener('message', onInit);
        resolve(e.data);
      }
    };
    self.addEventListener('message', onInit);
  });
}

const { wasmModule, memory, tidBuffer, tid, startArg } = initData;

// Nested spawn: bump the shared tid counter locally and ask main to create
// the actual Worker. Returning the pre-allocated tid synchronously satisfies
// the wasi:thread-spawn ABI — the new thread starts concurrently and any
// guest-side join coordinates through shared memory + atomics.
const threadSpawn = (childStartArg) => {
  const newTid = Atomics.add(new Int32Array(tidBuffer), 0, 1) + 1;
  port.postMessage({ type: 'wasi_thread_spawn', tid: newTid, startArg: childStartArg });
  return newTid;
};

const { imports, wasi } = makeWorkerImports({
  port, memory, WASI, OpenFile, File, ConsoleStdout,
});
imports.wasi = { "thread-spawn": threadSpawn };

const instance = await WebAssembly.instantiate(wasmModule, imports);
// browser_wasi_shim syscalls reach linear memory through wasi.inst; we set it
// directly rather than calling wasi.initialize() (which would re-run global
// constructors on top of main-thread state).
wasi.inst = instance;
try {
  instance.exports.wasi_thread_start(tid, startArg);
} catch (err) {
  console.error('wasi_thread_start threw:', err);
  throw err;
}
