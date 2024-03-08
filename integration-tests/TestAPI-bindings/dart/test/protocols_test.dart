import 'dart:io';
import 'dart:math';
import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      print('pid: $pid');
      final _ = ensureLoaded;
  });

  group('ProtocolTests', () {
      test('testProtocolImplementation', () {
        var a = AProtocolImplementation(foo: "Garply", baz: false);
        expect(a.foo, equals("Garply"));
        expect(a.baz, equals(false));

        var b = a.bar(2, 128);
        expect(b.foo, equals("130"));
        expect(b.baz, equals(true));

        expect(a.hasADefaultImplementation(9, -102.1), equals("-312 notBazzed"));
      });
  });

}