import 'dart:io';
import 'dart:math';
import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart' as tuple;

void main() {
  setUp(() {
      print('pid: $pid');
      final _ = ensureLoaded;
  });

  group('ProtocolTests', () {
      test('testProtocolImplementation', () {
        final a = AProtocolImplementation(foo: "Garply", baz: false);
        expect(a.foo, equals("Garply"));
        expect(a.baz, equals(false));

        final b = a.bar(2, 128);
        expect(b.foo, equals("130"));
        expect(b.baz, equals(true));

        expect(a.hasADefaultImplementation(9, -102.1), equals("-312 notBazzed"));
        expect(a.hasADefaultImplementation(2, 0.345), equals("bazzy 3"));

        expect(a.hasADefaultImplementation2("923.2185", true, 0.0898714), equals(3.7838466771424932E9));
        expect(a.hasADefaultImplementation2("923.2185", false, 0.0898714), equals(1.9556754407899822E-5));

        expect(a.hasADefaultImplementation2("0.9870923", true, 1.123123), equals(0.9589049888649063));
        expect(a.hasADefaultImplementation2("0.9870923", false, 1.123123), equals(1.686253813623996));
      });

      test('testProtocolEnum', () {
        final testProtocolEnum = TestProtocolEnum.qux();
        testProtocolEnum.foo();
        expect(testProtocolEnum.bar(), equals(true));
        testProtocolEnum.baz(true);
        expect(testProtocolEnum.garply("Navigate a nostril!"), equals("garply Navigate a nostril! garpity garp"));
        expect(testProtocolEnum.xyzzy(42, [1.234, 45.235890198, 892.80]), equals("thud: 42; grault: [1.234, 45.235890198, 892.8]"));
        expect(testProtocolEnum.plugh(tuple.Tuple3<bool, double, List<String>>(true, 3.14159265359, ["Take a left at your intestines", "Take the second right past Mars"])), equals(tuple.Tuple3<bool, int, String>(false, 3, "Take a left at your intestines -<*>- Take the second right past Mars")));
      });

      test('testProtocolStruct', () {
        final testProtocolStruct = TestProtocolStruct(corge: "Raft a river of lava-ah!");
        expect(testProtocolStruct.corge, equals("Raft a river of lava-ah!"));
        testProtocolStruct.corge = "Spank a plankton too! (take that)";
        expect(testProtocolStruct.corge, equals("Spank a plankton too! (take that)"));
        expect(testProtocolStruct.frob, equals([3.14159265359, 42.0, -1.23456789]));
        expect(testProtocolStruct.plugh(tuple.Tuple3<bool, double, List<String>>(true, 42.9, ["Ride on the magic school bus", "You might get baked into a pie"])), equals(tuple.Tuple3<bool, int, String>(true, 51, "Ride on the magic school bus *>-<* You might get baked into a pie")));

        testProtocolStruct.foo();
        expect(testProtocolStruct.bar(), equals(false));
        testProtocolStruct.baz(true);
        expect(testProtocolStruct.garply("An octopus in your neighborhood?"), equals("garp garpity An octopus in your neighborhood? garpee"));
        expect(testProtocolStruct.xyzzy(42, [1.234, 45.235890198, 892.80]), equals("thud: 42 | grault: [1.234, 45.235890198, 892.8]"));
      });

      test('testProtocolClass', () {
        final testProtocolClass = TestProtocolClass.init("Step inside it's a wilder ride!");
        expect(testProtocolClass.corge, equals("Step inside it's a wilder ride!"));
        expect(testProtocolClass.frob, equals([42.0, -1.23456789, 3.14159265359]));

        expect(testProtocolClass.flarp, equals(null));
        testProtocolClass.flarp = "Excellent observation Kiki!";
        expect(testProtocolClass.flarp, equals("Excellent observation Kiki!"));
        expect(testProtocolClass.wombat(null), equals(42.909));
        expect(testProtocolClass.wombat(57), equals(null));
        expect(testProtocolClass.wombat(56), equals(7890.2));

        expect(testProtocolClass.spqr(AssociatedDataEnum.thing(23947889)), equals(23947889));
        expect(testProtocolClass.spqr(AssociatedDataEnum.other("zxc", 89708973)), equals(89708973));
        expect(testProtocolClass.spqr(AssociatedDataEnum.bar("shme", AssociatedDataEnum.noValue())), equals(45));
        expect(testProtocolClass.spqr(AssociatedDataEnum.noValue()), equals(42));
        expect(testProtocolClass.spqr(AssociatedDataEnum.simpleEnum(SimpleEnum.blue())), equals(1));        

        testProtocolClass.foo();
        expect(testProtocolClass.bar(), equals(true));
        testProtocolClass.baz(false);
        expect(testProtocolClass.garply("Surfin' on a sine wave"), "garplify Surfin' on a sine wave parguino");
        expect(testProtocolClass.xyzzy(42, [1.234, 45.235890198, 892.80]), equals("thud: 42 \\|/ grault: [1.234, 45.235890198, 892.8]"));
        expect(testProtocolClass.plugh(tuple.Tuple3<bool, double, List<String>>(true, 92.47, ["Please let this be a normal field trip", "I knew I should've stayed home today"])), equals(tuple.Tuple3<bool, int, String>(true, 83, "Please let this be a normal field trip _-^= I knew I should've stayed home today")));
      });

    test('testMutatingCounterProtocol', () {
        final mc1 = MutatingCounter(count: 42);
        expect(mc1.count, equals(42));
        mc1.tick();
        expect(mc1.count, equals(43));

        var mc2 = mc1.witness();
        expect(mc2.count, equals(129));
        mc2.tick();
        expect(mc2.count, equals(130));
      });

    test('testProtocolDartImpl', () {
      var a = ProtocolDartImpl(foo: 'oof!', baz: false);
      expect(a.foo, equals("oof!"));
      a.foo = "ofo!";
      expect(a.foo, equals("ofo!"));
      expect(a.baz, equals(false));
      final b = a.hasADefaultImplementation(2389, 17.23);
      expect(b, equals("bazzy 52558 / 27 = 1946.5925925925926"));
      final c = a.hasADefaultImplementation2("With the Frizz? No way!", false, 8923.8293);
      expect(c, equals(-3.14159265359));
    });
  });
}

class ProtocolDartImpl implements AProtocol {
  @override
  bool baz;

  @override
  String foo;

  ProtocolDartImpl({
        required String foo,
        required bool baz
    }):
        this.foo = foo,
        this.baz = baz;

  @override
  AProtocol bar(int x, int y) {
    final div = x / y;
    final a = ProtocolDartImpl(foo: "$x / $y = $div", baz: x != y);
    return a;
  }

  String hasADefaultImplementation(
      int x,
      double y
  ) {
    final x_prime = x * 22;
    final y_prime = y / 2.0382;
    return AProtocol_DefaultImplementations(this).hasADefaultImplementation(x_prime, y_prime);
  }
  
  double hasADefaultImplementation2(
      String a,
      bool b,
      double c
  ) {
    final a_prime = "wibbledy wobbledy $a woo";
    final b_prime = !b;
    final c_prime = c * 7.23890;
    return AProtocol_DefaultImplementations(this).hasADefaultImplementation2(a_prime, b_prime, c_prime);
  }
}
