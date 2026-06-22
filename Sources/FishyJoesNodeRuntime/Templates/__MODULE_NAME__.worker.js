// pthread worker: re-instantiates the same compiled wasm module against the
// shared memory and entered via wasi_thread_start. Host-agnostic — runs in
// either Node `worker_threads` or a browser `Worker`. All `Worker`
// construction is delegated to the main thread (Node) or the spawner Worker
// (browser), so this file does not depend on `node:worker_threads`.
//
// Workers do NOT instantiate their own NAPI env. The wasm module's napi_*
// imports are satisfied by stateless proxies built by makeWorkerImports —
// thread-safe-function calls are forwarded to main via `mainPort`; every
// other napi_* call throws. In the browser, `mainPort` is a MessagePort
// connected directly to main (handed in via `_init` from the spawner); in
// Node, it's `parentPort` (main owns the worker directly).
import { makeWorkerImports } from "./wasm-napi.js";
import { WASI, OpenFile, File, ConsoleStdout } from "@bjorn3/browser_wasi_shim";

// Acquire the message ports + init data from whichever host runs us.
// Node:    `parentPort` is both the spawn-request channel and the main NAPI
//          channel (main owns the worker directly).
// Browser: `self` is the spawner channel (used for nested spawn requests);
//          `mainPort` is a dedicated MessagePort to main for NAPI calls,
//          delivered via the `_init` message from the spawner.
const isNode = typeof process !== 'undefined' && process.versions && process.versions.node;
let spawnerPort;
let mainPort;
let initData;
if (isNode) {
  const wt = await import(/* webpackIgnore: true */ 'node:worker_threads');
  spawnerPort = wt.parentPort;
  mainPort = wt.parentPort;
  initData = wt.workerData;
} else {
  spawnerPort = self;
  initData = await new Promise((resolve) => {
    const onInit = (e) => {
      if (e.data && e.data.type === '_init') {
        self.removeEventListener('message', onInit);
        resolve(e.data);
      }
    };
    self.addEventListener('message', onInit);
  });
  mainPort = initData.mainPort;
}

const { wasmModule, memory, tidBuffer, tid, startArg } = initData;

// Nested spawn: bump the shared tid counter locally and ask the spawn host
// (main in Node, spawner in browser) to create the actual Worker. Returning
// the pre-allocated tid synchronously satisfies the wasi:thread-spawn ABI —
// the new thread starts concurrently and any guest-side join coordinates
// through shared memory + atomics.
const threadSpawn = (childStartArg) => {
  const newTid = Atomics.add(new Int32Array(tidBuffer), 0, 1) + 1;
  spawnerPort.postMessage({ type: 'wasi_thread_spawn', tid: newTid, startArg: childStartArg });
  return newTid;
};

const { imports, wasi } = makeWorkerImports({
  port: mainPort, memory, WASI, OpenFile, File, ConsoleStdout,
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
