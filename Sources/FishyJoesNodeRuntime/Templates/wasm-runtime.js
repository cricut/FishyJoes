// Host-agnostic bootstrap helpers shared by the Node and browser entries.
// Centralizes import-object assembly and the message dispatch table so the
// per-host entries only carry the bits that genuinely differ (how to fetch
// the wasm bytes and how to construct a Worker).

export function buildImportObject({ napi, memory, threadSpawn, extensions }) {
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

// Attach a message listener to a freshly-created worker. Dispatches:
//   wasi_thread_spawn  -> spawnWorker (so descendant workers can request
//                        further pthreads from main)
//   napi_*             -> napi.dispatchWorkerMessage (existing TSF forwards)
// Works with both Node `Worker` (.on('message')) and browser `Worker`
// (.addEventListener('message')).
export function wireWorkerMessages(worker, { napi, spawnWorker }) {
  const handle = (msg) => {
    if (msg && msg.type === 'wasi_thread_spawn') {
      spawnWorker({
        tid: msg.tid,
        startArg: msg.startArg,
      });
    } else {
      napi.dispatchWorkerMessage(msg);
    }
  };
  if (typeof worker.on === 'function') {
    worker.on('message', handle);
    worker.on('error', (err) => { console.error('worker thread error:', err); });
    worker.on('exit', (code) => {
      if (code !== 0 && code !== 1) {
        console.error(`worker thread exited with code ${code}`);
      }
    });
  } else {
    worker.addEventListener('message', (e) => handle(e.data));
    worker.addEventListener('error', (e) => { console.error('worker thread error:', e); });
  }
}
