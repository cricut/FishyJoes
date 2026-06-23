/**
 * Dedicated thread-spawning Worker, shared by both Node and browser entries.
 *
 * Main runs the JS event loop and the wasm guest on the same thread. Any
 * blocking wait inside wasm on main stalls the event loop, so a
 * `wasi:thread-spawn` routed through main would have to queue behind it —
 * and if the lock is only released by the not-yet-spawned thread, that's a
 * deadlock. The spawner is a separate Worker that never enters wasm, so its
 * event loop is always free to run `new Worker(...)`.
 *
 * Spawner only creates pthread Workers. NAPI / threadsafe-function calls
 * travel directly from each pthread Worker to main over a per-worker
 * MessageChannel created at spawn time — the spawner never sits on that path.
 *
 * Protocol:
 *   parent  -> spawner  { type: 'init', wasmModule, memory, tidBuffer }
 *   spawner -> parent   { type: 'init_ack' }
 *   parent  -> spawner  { type: 'spawn', tid, startArg }
 *   spawner -> parent   { type: 'spawn_worker_port', port }  (transferable MessagePort)
 *   spawner -> worker   Node:    workerData = { ..., mainPort } at construction
 *                       Browser: { type: 'worker_init', ..., mainPort } via postMessage
 *   worker  -> spawner  { type: 'wasi_thread_spawn', tid, startArg }
 */

const isNode = typeof process !== 'undefined' && process.versions && process.versions.node;

const workerUrl = new URL('./__MODULE_NAME__.worker.js', import.meta.url);

let parentPort = null;
let WorkerCtor;
let MessageChannelCtor;

if (isNode) {
  const wt = await import(/* webpackIgnore: true */ 'node:worker_threads');
  parentPort = wt.parentPort;
  WorkerCtor = wt.Worker;
  MessageChannelCtor = wt.MessageChannel;
} else {
  WorkerCtor = globalThis.Worker;
  MessageChannelCtor = globalThis.MessageChannel;
}

const sendToParent = (msg, transfer) => {
  if (isNode) {
    parentPort.postMessage(msg, transfer);
  } else {
    self.postMessage(msg, transfer);
  }
};

const onParentMessage = (cb) => {
  if (isNode) {
    parentPort.on('message', cb);
  } else {
    self.addEventListener('message', (e) => cb(e.data));
  }
};

let wasmModule = null;
let memory = null;
let tidBuffer = null;

onParentMessage((msg) => {
  if (!msg || typeof msg !== 'object') return;
  switch (msg.type) {
    case 'init':
      wasmModule = msg.wasmModule;
      memory = msg.memory;
      tidBuffer = msg.tidBuffer;
      sendToParent({ type: 'init_ack' });
      break;
    case 'spawn':
      spawnPthread(msg.tid, msg.startArg);
      break;
  }
});

function spawnPthread(tid, startArg) {
  if (wasmModule === null) {
    sendToParent({ type: 'spawner_error', error: 'spawn before init' });
    return;
  }

  // Direct worker<->main channel for NAPI calls; main installs the dispatch
  // handler on its end and the worker uses the other end for postMessage.
  const channel = new MessageChannelCtor();
  sendToParent({ type: 'spawn_worker_port', port: channel.port1 }, [channel.port1]);

  if (isNode) {
    const worker = new WorkerCtor(workerUrl, {
      workerData: { wasmModule, memory, tidBuffer, tid, startArg, mainPort: channel.port2 },
      transferList: [channel.port2],
    });
    worker.on('message', (childMsg) => {
      if (!childMsg) return;
      if (childMsg.type === 'wasi_thread_spawn') {
        // Nested spawn from a descendant Worker — handle locally so it never
        // touches main.
        spawnPthread(childMsg.tid, childMsg.startArg);
      }
    });
    worker.on('error', (err) => {
      sendToParent({ type: 'spawner_error', error: String(err && err.message || err) });
    });
  } else {
    const worker = new WorkerCtor(workerUrl, { type: 'module' });
    worker.addEventListener('message', (e) => {
      const childMsg = e.data;
      if (!childMsg) return;
      if (childMsg.type === 'wasi_thread_spawn') {
        spawnPthread(childMsg.tid, childMsg.startArg);
      }
    });
    worker.addEventListener('error', (err) => {
      sendToParent({ type: 'spawner_error', error: String(err && err.message || err) });
    });
    worker.postMessage(
      {
        type: 'worker_init',
        wasmModule,
        memory,
        tidBuffer,
        tid,
        startArg,
        mainPort: channel.port2,
      },
      [channel.port2],
    );
  }
}
