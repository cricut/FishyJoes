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

        var i = SimpleEnum.red();
        expect(i != d, true);
        expect(i != e, true);
        expect(i, equals(i));
      });

      test('testAssociatedDataEnum', () {
          shape1(int x) => AssociatedDataEnum.thing(x);
          shape2(String x, String y, int z) => AssociatedDataEnum.bar(x, AssociatedDataEnum.other(y, z));

          expect(shape1(4).intValue, equals(4));
          expect(shape2("hello", "world", 8).intValue, equals(11));
          expect(shape1(2).plus(shape2("x", "y", 4)), equals(shape1(9)));
          expect(shape2("y", "z", 2).plus(shape1(5)), equals(shape2("y", "z", 7)));
      });

      test('testEnumToString', () {
        var r = SimpleEnum.red();
        var g = SimpleEnum.green();
        var b = SimpleEnum.blue();

        expect(r.toString(), equals("SimpleEnum.red()"));
        expect(g.toString(), equals("SimpleEnum.green()"));
        expect(b.toString(), equals("SimpleEnum.blue()"));

        var x = AssociatedDataEnum.thing(90);
        expect(x.toString(), equals("AssociatedDataEnum.thing(value: 90)"));
        var y = AssociatedDataEnum.bar("qux", x);
        expect(y.toString(), equals("AssociatedDataEnum.bar(named: qux, m_1: AssociatedDataEnum.thing(value: 90))"));
      });

      test('testEnumShallowCopy', () {
          var a = SimpleEnum.blue();
          var b = a.shallowCopy();
          var c = SimpleEnum.green();
          var d = c.shallowCopy();
          expect(a == b, true);
          expect(c, equals(d));
          expect(b != d, true);

          var e = AssociatedDataEnum.simpleEnum(b);
          var f = AssociatedDataEnum.bar("corge", e);
          var g = f.shallowCopy();
          expect(g, equals(f));

          var h = AssociatedDataEnum.thing(123);
          var i = h.shallowCopy();
          var j = i.shallowCopy();
          expect(i, equals(h));
          expect(j, equals(h));
          var k = AssociatedDataEnum.thing(124);
          expect(k != h, true);
      });
  });
}
