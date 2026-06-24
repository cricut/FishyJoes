import { NAPI } from "./wasm-napi.js";
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

  const { Worker } = await import(/* webpackIgnore: true */ 'node:worker_threads');

  // Bring the spawner up early; spawn requests must not be routed through
  // main. See __MODULE_NAME__.spawner.js for the rationale.
  const spawner = new Worker(new URL('./__MODULE_NAME__.spawner.js', import.meta.url));

  // Compile the wasm module so we can share it with the spawner before
  // dispatching any spawn requests.
  let wasmModule;
  if (typeof(__webpack_require__) === 'function' && typeof(fetch) === 'function') {
    const response = await import("./__MODULE_NAME__.wasm").then((module) => fetch(module.default));
    wasmModule = await WebAssembly.compileStreaming(response);
  } else {
    const fs = await import(/* webpackIgnore: true */ 'fs');
    const binary = fs.readFileSync(new URL('./__MODULE_NAME__.wasm', import.meta.url));
    wasmModule = await WebAssembly.compile(binary);
  }

  // Init handshake: wait for spawner ack before threadSpawn could be invoked.
  await new Promise((resolve, reject) => {
    const timeout = setTimeout(() => reject(new Error('spawner did not ack init in 5s')), 5000);
    const onInitAck = (msg) => {
      if (!msg) return;
      if (msg.type === 'init_ack') {
        clearTimeout(timeout);
        spawner.off('message', onInitAck);
        resolve();
      }
    };
    spawner.on('message', onInitAck);
    spawner.postMessage({ type: 'init', wasmModule, memory, tidBuffer });
  });

  // After init, spawner only sends control messages — never proxies NAPI.
  // For each pthread Worker the spawner creates, it forwards a fresh
  // MessagePort here; that port is wired straight to napi.dispatchWorkerMessage.
  spawner.on('message', (msg) => {
    if (!msg) return;
    switch (msg.type) {
      case 'spawn_worker_port':
        msg.port.on('message', (ev) => napi.dispatchWorkerMessage(ev));
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
