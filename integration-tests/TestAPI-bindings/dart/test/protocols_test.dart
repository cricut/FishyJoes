import 'dart:io';
import 'dart:core';
// import 'dart:js_util';
import 'dart:math';
import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:cricut_test_api/src/generated/TestAsyncSwiftSideFunctionsClass.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart' as tuple;
import 'package:dart_numerics/dart_numerics.dart';
import 'package:cricut_test_api/src/generated/TestAsyncFunctions.dart' as TestAPI;

final debugPrint = false;

void main() {
  setUp(() {
      if (debugPrint) { print('pid: $pid'); }
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

        expect(a.hasADefaultImplementation2("923.2185", true, "0.0898714"), equals("3783846677.1424932"));
        expect(a.hasADefaultImplementation2("923.2185", false, "0.0898714"), equals("1.9556754407899822e-05"));

        expect(a.hasADefaultImplementation2("0.9870923", true, "1.123123"), equals("0.9589049888649063"));
        expect(a.hasADefaultImplementation2("0.9870923", false, "1.123123"), equals("1.686253813623996"));
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
        expect(testProtocolStruct.frobby, equals([3, 42, -1]));
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
        expect(testProtocolClass.frobby, equals([42, -1, 3]));

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

      testAsyncForeignSideFunctionsCore(z) async {
        final a = z as TestAsyncFunctions;
        expect(await a.const42(), equals(49));
        expect(await a.iabs(-4), equals(4));
        final b = a.intCompose(
          (x) {
          return Future.delayed(const Duration(seconds: 0), () => x * 3);
          }, 
          (y) {
          return Future.delayed(const Duration(seconds: 0), () => y * 5);
          }
        );
        expect(await b(92), equals(1380));
        final c = await a.add3Things(3.14, 3.14159, 128);
        expect(c, closeTo(134.28159, 2E-7));
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

        expect(() async => await a.willThrow(), throwsA(predicate((e) => '$e'.contains("Spoon!"))));

        final g = await a.exercise0(e);
        expect(g, equals("84"));
        final h = await a.exercise1(b);
        expect(h, equals("-105"));

        final i = await a.exercise2(
          (a, b) { 
            return (z) async {
              return (await a(3)) + (await b(3)) + z;
            };
          }
        );
        expect(i, equals("36"));

        final j = await a.exercise3(
          (fl, d, l) async {
            return (fl / d) + (9 * l);
          }
        );
        expect(j, equals("18.227272727272727"));

        final k = await a.exercise4(
          (a, b, c, d) async {
            return [d, c, b, a];
          }
        );
        expect(k, equals("[jam, the, up, Pump]"));

        final l = await a.exercise5(
          (a, b, c, d, e) async {
            return () async {
              return (double.parse(a) + b.toDouble() + c + double.parse(d) + (await e())).toInt();
            };
          }
        );
        expect(l, equals("754"));

        final m = await a.exercise6(
          (a, b, c, d, e, f) async {
            return (double.parse(a) + b.toDouble() + c + double.parse(d) + await e() + f).toInt();
          }
        );
        expect(m, equals("852"));

        var o = 1;
        final n = a.thunkTwiceMaker(
          () async {
            o += 1;
            if (debugPrint) { print("Thunker in paradise"); }
          }
        );
        await n();
        expect(o, equals(3));

        final p = await a.defaultExercise6(
          (a, b, c, d, e, f) async {
            return (double.parse(a) + b.toDouble() + c + double.parse(d) + await e() + f).toInt();
          }
        );
        expect(p, equals("962"));
      }

      TestAsyncFunctions makeAsyncForeignSideFunctions() {
        return TestAsyncForeignSideFunctionsStruct(
          const42: () async { return 49; },
          iabs: (x) async { return x.abs(); },
          intCompose: (f, g) {
            return (x) async {
              return f( await g(x) );
            };
          },
          add3Things: (x, y, z) async {
            return x.toDouble() + y + z.toDouble();
          }, 
          makeList: (a, b, c, d) async {
            return [a, b, c, d];
          }, 
          fifthThing: (a, b, c, d, e) async {
            return e;
          }, 
          six: (a, b, c, d, e, f) async { 
            return f;
          }, 
          willThrow: () async {
            throw(Exception('Spoon!'));
          }, 
          exercise0Fun: (fn) async {
            return "${await fn() * 2}";
          }, 
          exercise1Fun: (fn) async {
            return "${await fn(-7)}";
          },
          exercise2Fun: (fn) async {
            return "${await fn((a) async { return a + 1; }, (b) async { return b * 3; })(23)}";
          },
          exercise3Fun: (fn) async {
            return "${await fn(1.0, 4.4, 2)}";
          },
          exercise4Fun: (fn) async {
            return "${
              await fn("Pump", "up", "the", "jam")
            }";
          },
          exercise5Fun: (fn) async {
            final y = await (await fn("78", 6, 4.2, "12", () async { return 654; }))();
            return "$y";
          },
          exercise6Fun: (fn) async {
            final y = await fn("78", 6, 4.2, "12", () async { return 654; }, 98);
            return "$y";
          },
          thunkTwiceMakerFun: (thunk) { 
            return () async {
              await thunk();
              await thunk();
            };
          }
        );
      }
      test('testAsyncForeignSideFunctions', () async {
        final a = makeAsyncForeignSideFunctions();
        await testAsyncForeignSideFunctionsCore(a);
      });

      test('testAsyncForeignSideFunctionsWitness', () async {
        final _a = makeAsyncForeignSideFunctions();
        final a = _a.witness();
        await testAsyncForeignSideFunctionsCore(a);
      });

      test('testTestAsyncFunctionsImpl', () async {
        final a = TestAsyncFunctionsImpl();
        await testAsyncForeignSideFunctionsCore(a);
      });

      test('testTestAsyncFunctionsImplWitness', () async {
        final _a = TestAsyncFunctionsImpl();
        final a = _a.witness();
        await testAsyncForeignSideFunctionsCore(a);
      });

      testAsyncSwiftSideFunctionsCore(z) async {
        final a = z as TestAsyncFunctions;
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

        expect(() async => await a.willThrow(), throwsA(predicate((e) => '$e'.contains("TheAsyncError()"))));

        final g = await a.exercise0(e);
        expect(g, equals("42"));
        final h = await a.exercise1(b);
        expect(h, equals("-45"));

        final i = await a.exercise2(
          (a, b) { 
            return (z) async {
              return (await a(3)) + (await b(3)) + z;
            };
          }
        );
        expect(i, equals("21"));

        final j = await a.exercise3(
          (fl, d, l) async {
            return (fl / d) + (9 * l);
          }
        );
        expect(j, equals("18.227272727272727"));

        final k = await a.exercise4(
          (a, b, c, d) async {
            return [d, c, b, a];
          }
        );
        expect(k, equals("[\"d\", \"c\", \"b\", \"a\"]"));

        final l = await a.exercise5(
          (a, b, c, d, e) async {
            return () async {
              return (b.toDouble() + c + (await e())).toInt();
            };
          }
        );
        expect(l, equals("93"));

        final m = await a.exercise6(
          (a, b, c, d, e, f) async {
            return (b.toDouble() + c + await e() + f).toInt();
          }
        );
        expect(m, equals("135"));

        var o = 3.14159265359;
        final n = a.thunkTwiceMaker(
          () async {
            o = o * o;
            if (debugPrint) { print("Thunkmaster thex"); }
          }
        );
        await n();
        expect(o, equals(97.4090910340281));

        final p = await a.defaultExercise6(
          (a, b, c, d, e, f) async {
            return (double.parse(a) + b.toDouble() + c + double.parse(d) + await e() + f).toInt();
          }
        );
        expect(p, equals("962"));
      }

      test('testAsyncSwiftSideFunctions', () async {
        final a = TestAsyncSwiftSideFunctionsClass.init();
        await testAsyncSwiftSideFunctionsCore(a);
      });

      test('testAsyncSwiftSideFunctionsWitness', () async {
        final a = TestAsyncSwiftSideFunctionsClass.init();
        final b = a.witness();
        await testAsyncSwiftSideFunctionsCore(b);
      });

      test('testDefaultComputedPropertiesImpl', () async {
        final a = TestDefaultComputedPropertiesImplOverrideNoot();
        expect(a.plutonic, equals("Newton Gimmick"));
        expect(a.noot, equals(230723));

        final b = TestDefaultComputedPropertiesImplOverridePlutonic();
        expect(b.plutonic, equals("Teddy Ruxpin"));
        expect(b.noot, equals(2983));
      });

      test('testDefaultComputedPropertiesStruct', () async {
        final a = TestDefaultComputedPropertiesStruct(spam: true, noot: 98172);
        expect(a.plutonic, equals("Newton Gimmick"));
        expect(a.spam, equals(true));
        expect(a.noot, equals(98172));
      });

      test('testDefaultComputedPropertiesReference', () {
        final a = TestDefaultComputedPropertiesReference.init(false, 678753);
        expect(a.plutonic, equals("Newton Gimmick"));
        expect(a.spam, equals(false));
        expect(a.noot, equals(678753));
      });

      test('testDefaultComputedPropertiesEnum', () {
        final a = TestDefaultComputedPropertiesEnum.qux();
        expect(a.plutonic, equals("Newton Gimmick"));
        expect(a.spam, equals(true));
        expect(a.noot, equals(72930));
      });

      test('testDifferingExportNameStruct', () {
        final a = TestDifferingExportNameStruct(tata: 8923);
        expect(a.tata, equals(8923));
      });

      test('testNonExportedProtocol', () {
        final a = TestNonExportedProtocolEnum.hogehoge();
        expect(a.fuga, equals(987890.23));
        expect(a.hoge(), equals(23723.11));
      });

      test('testEqualsHashCodeToStringForReferences', () {
        final a = TestProtocolClass.init("Zoobilee Zoo; Zoobilee Zoo!", flarp: "Magic and wonder are waiting for you.");
        final b = TestProtocolClass.init("Zoobilee Zoo; Zoobilee Zoo!", flarp: "Magic and wonder are waiting for you.");
        final c = TestProtocolClass.init("It's as close as a dream", flarp: "And as bright as the brightest blue-oo!");
        expect(0, isNot(equals(a.hashCode)));
        expect(a.hashCode, equals(b.hashCode));
        expect(a.hashCode, isNot(equals(c.hashCode)));
        // expect("TestAPI.TestProtocolClass", a.toString());
        expect(a, equals(b));
        expect(a, isNot(equals(c)));
      });
  });
}

class TestDefaultComputedPropertiesImplOverrideNoot implements TestDefaultComputedProperties {
  int get noot => 230723;
}

class TestDefaultComputedPropertiesImplOverridePlutonic implements TestDefaultComputedProperties {
  String get plutonic => "Teddy Ruxpin";
}

class TestAsyncFunctionsImpl implements TestAPI.TestAsyncFunctions {
    @override
    Future<String> exercise0(
        Future<int> Function() fn
    ) async {
      return "${(await fn()) * 2}";
    }
    @override
    Future<String> exercise1(
        Future<int> Function(int) fn
    ) async {
      return "${await fn(-7)}";
    }
    @override
    Future<String> exercise2(
        Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) fn
    ) async {
      return "${await fn((a) async { return a + 1; }, (b) async { return b * 3; })(23)}";
    }
    @override
    Future<String> exercise3(
        Future<double> Function(double, double, int) fn
    ) async {
      return "${await fn(1.0, 4.4, 2)}";
    }
    @override
    Future<String> exercise4(
        Future<List<String>> Function(String, String, String, String) fn
    ) async {
      return "${await fn("Pump", "up", "the", "jam")}";
    }
    @override
    Future<String> exercise5(
        Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) fn
    ) async {
      final y = await (await fn("78", 6, 4.2, "12", () async { return 654; }))();
      return "$y";
    }
    @override
    Future<String> exercise6(
        Future<int> Function(String, int, double, String, Future<int> Function(), int) fn
    ) async {
      final y = await fn("78", 6, 4.2, "12", () async { return 654; }, 98);
      return "$y";
    }
    @override
    Future<void> Function() thunkTwiceMaker(
        Future<void> Function() thunk
    ) {
      return () async {
        await thunk();
        await thunk();
      };
    }
    @override
    TestAPI.TestAsyncFunctions witness(
    ) {
      return TestAsyncFunctionsImpl();
    }
    @override
    Future<int> Function() get const42 {
      return () async { return 49; };
    }
    @override
    Future<int> Function(int) get iabs {
      return (a) async { return a.abs(); };
    }
    @override
    Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) get intCompose {
      return (f, g) {
        return (x) async {
          return f( await g(x));
        };
      };
    }
    @override
    Future<double> Function(double, double, int) get add3Things {
      return (x, y, z) async {
        return x.toDouble() + y + z.toDouble();
      };
    }
    @override
    Future<List<String>> Function(String, String, String, String) get makeList {
      return (a, b, c, d) async {
        return [a, b, c, d];
      };
    }
    @override
    Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) get fifthThing {
      return (a, b, c, d, e) async {
        return e;
      };
    }
    @override
    Future<int> Function(String, int, double, String, Future<int> Function(), int) get six {
      return (a, b, c, d, e, f) async { 
        return f;
      };
    }
    @override
    Future<int> Function() get willThrow {
      return () async {
        throw(Exception('Spoon!'));
      };
    }
}
