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
        var a = AProtocolImplementation(foo: "oof!", baz: false);
        print("a: ${a}");
        var b = a.bar(2, 13);
        print("a barred: ${b}");
      });
  });

}