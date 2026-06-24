import './_exports.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:tuple/tuple.dart' as tuple;

// ignore_for_file: unused_import
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: library_prefixes
// ignore_for_file: file_names
// ignore_for_file: annotate_overrides

/// <!-- FishyJoes.export(Threading) -->
class Threading {
    Threading._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(runConcurrentJobs) -->
    /// Spawns `jobCount` jobs concurrently, each running `chunksPerJob`
    /// blocking sleeps off the calling thread. After each chunk, invokes
    /// `progress(jobIndex, totalChunks)` where `totalChunks` is the
    /// cumulative number of chunks completed across all jobs.
    static Future<void> runConcurrentJobs(
        int jobCount,
        int chunksPerJob,
        Future<void> Function(int, int) progress,
    ) =>
        GCRef.using(progress, (_progressHandle) =>
            consumeCreatedRef<Future<void>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Threading_runConcurrentJobs(Loader.shared.env, jobCount, chunksPerJob, _progressHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(proveParallelism) -->
    /// Returns true iff the compute thread and the calling thread can
    /// rendezvous via shared atomics — a one-sided proof of parallelism.
    /// Under serial execution the worker spins forever waiting for the
    /// main-thread release flag;
    static Future<bool> proveParallelism(
    ) =>
        consumeCreatedRef<Future<bool>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Threading_proveParallelism(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(proveMainThreadCanPark) -->
    /// Returns true iff waiting on the wasm main thread truly suspends it
    /// — i.e., a condvar wait on this thread actually drives `atomic.wait`
    /// to its parking path. The test sets a flag inside the condvar's lock
    /// after acquiring it; a worker pthread (via `spawnBlocking`) spins on
    /// the flag and then signals. Because `condition.wait()` atomically
    /// releases the lock when parking, the worker can only acquire the
    /// lock — and therefore only signal — once the main thread has truly
    /// suspended. A `false` return means the wait fast-pathed and we never
    /// parked; in the browser without `__wasilibc_enable_futex_busywait`,
    /// the wait would instead trap on `atomic.wait32`.
    static Future<bool> proveMainThreadCanPark(
    ) =>
        consumeCreatedRef<Future<bool>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Threading_proveMainThreadCanPark(Loader.shared.env, _exn)))
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Threading_proveMainThreadCanPark;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Threading_proveParallelism;
    static late CreatedRef Function(
        Env env,
        int jobCount,
        int chunksPerJob,
        UnownedRef progress,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Threading_runConcurrentJobs;
}
