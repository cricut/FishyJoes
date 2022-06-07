import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
    });

    test('First Test', () {
      expect(Simple.platformVersion, isTrue);
    });
  });
}
