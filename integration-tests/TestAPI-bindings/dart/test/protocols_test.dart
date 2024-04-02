import 'dart:io';
import 'dart:math';
import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart' as tuple;
import 'package:dart_numerics/dart_numerics.dart';

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

      test('testLeadingUnderscoreInNames', () {
        final lups = TestLeadingUnderscoredPropStruct(m_leadingUnderscoreProp: "With great power comes great responsibility.");
        expect(lups.m_leadingUnderscoreProp, equals("With great power comes great responsibility."));
        // test for _leadingUnderscoreMethod is just that tests build and run, since currently leading underscore on method name means it's only visible on the Swift side, not the Foreign/Dart side.
      });

      // test('testAsyncForeignSideFunctions', () async {
      //   final a = TestAsyncForeignSideFunctionsStruct(
      //     const42: const42, 
      //     iabs: iabs, 
      //     intCompose: intCompose, 
      //     add3Things: add3Things, 
      //     makeList: makeList, 
      //     fifthThing: fifthThing, 
      //     six: six, 
      //     willThrow: willThrow, 
      //     exercise0Fun: exercise0Fun, 
      //     exercise1Fun: exercise1Fun, 
      //     exercise2Fun: exercise2Fun, 
      //     exercise3Fun: exercise3Fun, 
      //     exercise4Fun: exercise4Fun, 
      //     exercise5Fun: exercise5Fun, 
      //     exercise6Fun: exercise6Fun, 
      //     thunkTwiceMakerFun: thunkTwiceMakerFun
      //     )
      // });

      test('testAsyncSwiftSideFunctions', () async {
        final a = TestAsyncSwiftSideFunctionsClass.init();
        expect(await a.const42(), equals(42));
        expect(await a.iabs(-2398), equals(2398));
        final b = a.intCompose(
          (x) {
          return Future.delayed(const Duration(seconds: 0), () => x * 3);
          }, 
          (y) {
          return Future.delayed(const Duration(seconds: 0), () => y * 5);
          }
        );
        expect(await b(92), equals(1380));
        final d = await a.makeList("By", "your", "powers", "combined");
        expect(d, List.of(["By", "your", "powers", "combined"]));
        final e = await a.fifthThing(
          "I, am",
          int64MaxValue,
          double.minPositive,
          "Captain Planet!",
          () { 
            return Future.delayed(const Duration(seconds: 0), () => 42);
          }
        );
        expect(await e(), 42);
        final f = await a.six(
          "Big, bad",
          24,
          3.14159265359,
          "Beetleborgs",
          () { 
            return Future.delayed(const Duration(seconds: 0), () => 43);
          },
          int64MinValue
        );
        expect(f, equals(int64MinValue));
      });
  });
}