import 'package:cricut_testapi/testapi.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
    final _ = ensureLoaded;
  });

  group('TestAPITests', () {
    test('notMuch', () {
      expect(2 + 2, equals(4));
    });
  });
}
