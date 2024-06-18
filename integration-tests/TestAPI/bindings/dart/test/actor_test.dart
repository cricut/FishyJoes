import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
    final _ = ensureLoaded;
  });

  group('ActorTests', () {
    test('testLogger', () async {
      final logger = Actors_TemperatureLogger.create("log", 3);
      await logger.update(7);
      await logger.update(1);
      expect(await logger.min(), equals(1));
      expect(logger.backwardsLabel, equals("gol"));
    });
  });
}
