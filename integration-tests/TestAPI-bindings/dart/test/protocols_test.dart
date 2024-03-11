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
        final testProtocolEnum = TestProtocolEnum.qux();
        testProtocolEnum.foo();
        expect(testProtocolEnum.bar(), equals(true));
        testProtocolEnum.baz(true);
        expect(testProtocolEnum.garply("Navigate a nostril!"), equals("garply Navigate a nostril! garpity garp"));
        expect(testProtocolEnum.xyzzy(42, [1.234, 45.235890198, 892.80]), equals("thud: 42; grault: [1.234, 45.235890198, 892.8]"));
        expect(testProtocolEnum.plugh(tuple.Tuple3<bool, double, List<String>>(true, 3.14159265359, ["Take a left at your intestines", "Take the second right past Mars"])), equals(tuple.Tuple3<bool, int, String>(false, 3, "Take a left at your intestines -<*>- Take the second right past Mars")));
      });
  });

}