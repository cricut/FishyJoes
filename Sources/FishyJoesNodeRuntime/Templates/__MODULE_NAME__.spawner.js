/**
 * Dedicated thread-spawning Worker for the browser entry. The browser main
 * thread runs wasi-libc with `__wasilibc_enable_futex_busywait_on_current_thread`
 * so locks busy-spin instead of trapping on `atomic.wait32`. While busy-spinning
 * main can't service `new Worker(...)` requests itself, so wasi:thread-spawn is
 * delegated here.
 *
 * Spawner only creates pthread Workers. NAPI / threadsafe-function calls travel
 * directly from each pthread Worker to main over a per-worker MessageChannel
 * created at spawn time — the spawner never sits on that path.
 *
 * Protocol:
 *   main -> spawner  { type: 'init', wasmModule, memory, tidBuffer }
 *   spawner -> main  { type: 'ack' }
 *   main -> spawner  { type: 'spawn', tid, startArg }
 *   spawner -> main  { type: 'new_worker_port', port }   (transferable MessagePort)
 *   spawner -> worker { type: '_init', ..., mainPort }   (transferable MessagePort)
 *   worker -> spawner { type: 'wasi_thread_spawn', tid, startArg }
 */

let wasmModule = null;
let memory = null;
let tidBuffer = null;
const WORKER_URL = new URL('./__MODULE_NAME__.worker.js', import.meta.url);

self.addEventListener('message', (e) => {
  const msg = e.data;
  if (!msg || typeof msg !== 'object') return;
  if (msg.type === 'init') {
    wasmModule = msg.wasmModule;
    memory = msg.memory;
    tidBuffer = msg.tidBuffer;
    self.postMessage({ type: 'ack' });
  } else if (msg.type === 'spawn') {
    spawnPthread(msg.tid, msg.startArg);
  }
});

function spawnPthread(tid, startArg) {
  if (wasmModule === null) {
    self.postMessage({ type: 'spawner_error', error: 'spawn before init' });
    return;
  }

  // Direct worker<->main channel for NAPI calls; main installs the dispatch
  // handler on its end and the worker uses the other end for postMessage.
  const channel = new MessageChannel();
  self.postMessage({ type: 'new_worker_port', port: channel.port1 }, [channel.port1]);

  const worker = new Worker(WORKER_URL, { type: 'module' });
  worker.addEventListener('message', (e) => {
    const childMsg = e.data;
    if (childMsg && childMsg.type === 'wasi_thread_spawn') {
      // Nested spawn from a descendant Worker — handle locally so it never
      // touches main.
      spawnPthread(childMsg.tid, childMsg.startArg);
    }
  });
  worker.addEventListener('error', (err) => {
    self.postMessage({ type: 'spawner_error', error: String(err && err.message || err) });
  });
  worker.postMessage(
    {
      type: '_init',
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
