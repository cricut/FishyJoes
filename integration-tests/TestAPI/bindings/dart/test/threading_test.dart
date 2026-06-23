import 'package:cricut_testapi/testapi.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('ThreadingTests', () {
      test('runConcurrentJobs interleaves jobs and reports the full chunk count', () async {
          const jobCount = 4;
          const chunksPerJob = 5;
          const expectedTotal = jobCount * chunksPerJob;

          final observed = <(int, int)>[];
          await Threading.runConcurrentJobs(jobCount, chunksPerJob, (jobIndex, total) async {
              observed.add((jobIndex, total));
          });

          expect(observed.length, equals(expectedTotal));

          final perJob = <int, int>{};
          for (final (jobIndex, _) in observed) {
              perJob[jobIndex] = (perJob[jobIndex] ?? 0) + 1;
          }
          expect(perJob.length, equals(jobCount));
          for (final count in perJob.values) {
              expect(count, equals(chunksPerJob));
          }

          // Concurrent jobs interleave: a serial execution would yield exactly
          // `jobCount - 1` adjacent-index transitions (one per job boundary).
          // Real parallelism produces strictly more.
          var transitions = 0;
          for (var i = 1; i < observed.length; i++) {
              if (observed[i].$1 != observed[i - 1].$1) transitions++;
          }
          expect(transitions, greaterThan(jobCount - 1));
      }, timeout: const Timeout(Duration(seconds: 10)));

      test('compute runs in parallel with the calling thread (handshake)', () async {
          expect(await Threading.proveParallelism(), isTrue);
      }, timeout: const Timeout(Duration(seconds: 10)));

      test('main thread genuinely suspends on a condvar wait', () async {
          expect(await Threading.proveMainThreadCanPark(), isTrue);
      }, timeout: const Timeout(Duration(seconds: 10)));
  });
}
