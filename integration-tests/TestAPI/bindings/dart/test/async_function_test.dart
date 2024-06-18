import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('AsyncFunctionTests', () {
      test('AsyncTestConst42', () async {
          expect(await AsyncFunctions.const42(), equals(42));
      });

      test('AsyncTestAbs', () async {
          expect(await AsyncFunctions.abs(-3), equals(3));
      });

      test('AsyncTestIntCompose', () async {
          final composed = AsyncFunctions.intCompose((it) async => it + 1, (it) async => it * 3);
          expect(await composed(3), equals(10));
          expect(await composed(2), equals(7));
      });

      test('AsyncTestTheRestOfTheFunctions', () async {
          expect(await AsyncFunctions.add3Things(3.0, 4.5, 1), equals(8.5));
          expect(await AsyncFunctions.makeList("a", "b", "c", "d"), equals(["a", "b", "c", "d"]));
          var fn = await AsyncFunctions.fifthThing("hi", 1, 1.0, "...", () async => 84);
          expect(await fn(), equals(84));
          expect(await AsyncFunctions.sixthThing("hi", 1, 1.0, "...", () async => 84, 17), equals(17));
      });

      test('AsyncTestExceptionInCompose', () async {
          final composed = AsyncFunctions.intCompose((_) async => throw 'ComposeError', (it) async => it);
          expect(() async => await composed(3), throwsA(equals('ComposeError')));
      });

      test('AsyncTestPassingFunctionsToSwift', () async {
          expect(await AsyncFunctions.exercise0(() async => 8), equals("8"));
          expect(await AsyncFunctions.exercise1((it) async => it.abs()), equals("3"));
          expect(await AsyncFunctions.exercise2((f, g) => (it) async => await f(await g(it))), equals("25"));
          expect(await AsyncFunctions.exercise3((a, b, c) async => a + b + c), equals("7.4"));
          expect(await AsyncFunctions.exercise4((a, b, c, d) async => [a, b, c, d]), equals('["a", "b", "c", "d"]'));
          expect(await AsyncFunctions.exercise5((_0, _1, _2, _3, f) async => f), equals("83"));
          expect(await AsyncFunctions.exercise6((_0, _1, _2, _3, _4, i) async => i), equals("42"));
      });

      test('AsyncTestSwiftThrows', () async {
          expect(() async => await AsyncFunctions.willThrow(), throwsA(predicate((e) => '$e'.contains("TheAsyncError"))));
      });
  });
}
