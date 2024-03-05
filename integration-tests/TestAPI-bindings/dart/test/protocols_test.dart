import 'dart:io';
import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      print('pid: $pid');
      final _ = ensureLoaded;
  });

  group('ProtocolTests', () {
      test('testProtocolImplementation', () {
        var a = AProtocolImplementation(foo: 34);
        print("a: ${a}");
        // a.increment();
        // print("a incremented: ${a}");
      });
  });
}
