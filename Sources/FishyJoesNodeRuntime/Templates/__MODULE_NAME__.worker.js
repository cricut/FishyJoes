// pthread worker: re-instantiates the same compiled wasm module against the
// shared memory and entered via wasi_thread_start. Host-agnostic — runs in
// either Node `worker_threads` or a browser `Worker`. `Worker` construction
// is delegated to the spawner Worker in both environments, so this file
// never calls `new Worker(...)` itself.
//
// Workers do NOT instantiate their own NAPI env. The wasm module's napi_*
// imports are satisfied by stateless proxies built by makeWorkerImports —
// thread-safe-function calls are forwarded to main via `mainPort`; every
// other napi_* call throws. `mainPort` is a MessagePort connected directly
// to main, delivered via `workerData.mainPort` in Node and via the
// `worker_init` message in the browser.
import { makeWorkerImports } from "./wasm-napi.js";
import { WASI, OpenFile, File, ConsoleStdout } from "@bjorn3/browser_wasi_shim";

// Acquire the spawner channel + main NAPI port + init data from whichever
// host runs us. In both environments the spawner is our direct parent and
// owns the spawn-request channel; `mainPort` is a separate MessagePort to
// main reserved for NAPI traffic.
const isNode = typeof process !== 'undefined' && process.versions && process.versions.node;
let spawnerPort;
let mainPort;
let initData;
if (isNode) {
  const wt = await import(/* webpackIgnore: true */ 'node:worker_threads');
  spawnerPort = wt.parentPort;
  initData = wt.workerData;
  mainPort = initData.mainPort;
} else {
  spawnerPort = self;
  initData = await new Promise((resolve) => {
    const onWorkerInit = (e) => {
      const msg = e.data;
      if (!msg) return;
      switch (msg.type) {
        case 'worker_init':
          self.removeEventListener('message', onWorkerInit);
          resolve(msg);
          break;
      }
    };
    self.addEventListener('message', onWorkerInit);
  });
  mainPort = initData.mainPort;
}

const { wasmModule, memory, tidBuffer, tid, startArg } = initData;

// Nested spawn: bump the shared tid counter locally and ask the spawner to
// create the actual Worker. Returning the pre-allocated tid synchronously
// satisfies the wasi:thread-spawn ABI — the new thread starts concurrently
// and any guest-side join coordinates through shared memory + atomics.
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
