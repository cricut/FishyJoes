import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';
import 'dart:isolate';

void main() {
  setUp(() {
      print("${Isolate.current}, ${Isolate.current.hashCode}, ${Isolate.current.debugName}");
      final _ = ensureLoaded;
  });

  group('A group of tests', () {
      test('First Test', () {
          expect(Collections.arrayOfInt, equals([2, 7, 3, 5, 8]));
          // expect(Collections.defaultCollectionHolder.integerSet, equals(<int>{2, 7}));
      });
  });
}
