import 'dart:js_util';

import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('EnumTests', () {
      test('testEmptyEnum', () {
          expect(EmptyEnum.notGoingToHappen, throwsA(isA<Exception>()));
      });

      test('testSimpleEnum', () {
          expect(SimpleEnum.red().hex, equals(0xff0000));
          expect(SimpleEnum.green().hex, equals(0x00ff00));
          expect(SimpleEnum.blue().hex, equals(0x0000ff));
          expect(SimpleEnum.pickAColor(0), equals(SimpleEnum.red()));
          expect(SimpleEnum.pickAColor(1), equals(SimpleEnum.green()));
          expect(SimpleEnum.pickAColor(2), equals(SimpleEnum.blue()));
      });

      test('testEnumEqualityOperator', () {
        var a = AssociatedDataEnum.thing(10);
        var b = AssociatedDataEnum.thing(10);
        var c = AssociatedDataEnum.thing(11);

        expect(a, equals(a));
        expect(b, equals(b));
        expect(c, equals(c));
        expect(a, equals(b));
        expect(b, equals(a));

        expect(a == a, true);
        expect(a == b, true);
        expect(b == a, true);
        expect(b == b, true);
        expect(c != a, true);
        expect(c != b, true);

        var d = SimpleEnum.blue();
        var e = SimpleEnum.blue();
        var f = AssociatedDataEnum.simpleEnum(d);
        var g = AssociatedDataEnum.simpleEnum(d);
        var h = AssociatedDataEnum.simpleEnum(e);
        expect(f, equals(g));
        expect(d, equals(e));
        expect(h, equals(g));
      });

      test('testAssociatedDataEnum', () {
          shape1(int x) => AssociatedDataEnum.thing(x);
          shape2(String x, String y, int z) => AssociatedDataEnum.bar(x, AssociatedDataEnum.other(y, z));

          expect(shape1(4).intValue, equals(4));
          expect(shape2("hello", "world", 8).intValue, equals(11));
          expect(shape1(2).plus(shape2("x", "y", 4)), equals(shape1(9)));
          expect(shape2("y", "z", 2).plus(shape1(5)), equals(shape2("y", "z", 7)));
      });
  });
}
