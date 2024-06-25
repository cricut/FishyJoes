import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('DefaultArgumentsTest', () {
      test('testDefaultArguments', () {
          expect(DefaultArguments.echoDefaults(null), equals("42 52 3.14"));
          expect(DefaultArguments.echoDefaults(null, y: null), equals("42 52 3.14"));
          expect(DefaultArguments.echoDefaults(1), equals("1 52 3.14"));
          expect(DefaultArguments.echoDefaults(1, z: 42.0), equals("1 52 42.0"));
          expect(DefaultArguments.echoDefaults(null, y: 8), equals("42 8 3.14"));
          expect(DefaultArguments.echoDefaults(1, z: 4.8, y: 2), equals("1 2 4.8"));
      });
  });
}
