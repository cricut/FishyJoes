import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('FunctionTests', () {
      test('Const42', () {
          expect(Functions.const42(), equals(42));
      });

      test('testAbs', () {
          expect(Functions.abs(-3), equals(3));
      });

      test('testIntCompose', () {
          final composed = Functions.intCompose((it) => it + 1, (it) => it * 3);
          expect(composed(3), equals(10));
          expect(composed(2), equals(7));
      });

      test('testTheRestOfTheFunctions', () {
          expect(Functions.add3Things(3.0, 4.5, 1), equals(8.5));
          expect(Functions.makeList("a", "b", "c", "d"), equals(["a", "b", "c", "d"]));
          expect(Functions.fifthThing("hi", 1, 1.0, "...", () => 84)(), equals(84));
          expect(Functions.sixthThing("hi", 1, 1.0, "...", () => 84, 17), equals(17));
      });

      test('testExceptionInCompose', () {
          final composed = Functions.intCompose((_) => throw 'ComposeError', (it) => it);
          expect(() => composed(3), throwsA(equals('ComposeError')));
      });

      test('testPassingFunctionsToSwift', () {
          expect(Functions.exercise0(() => 8), equals("8"));
          expect(Functions.exercise1((it) => it.abs()), equals("3"));
          expect(Functions.exercise2((f, g) => (it) => f(g(it))), equals("25"));
          expect(Functions.exercise3((a, b, c) => a + b + c), equals("7.4"));
          expect(Functions.exercise4((a, b, c, d) => [a, b, c, d]), equals('["a", "b", "c", "d"]'));
          expect(Functions.exercise5((_0, _1, _2, _3, f) => f), equals("83"));
          expect(Functions.exercise6((_0, _1, _2, _3, _4, i) => i), equals("42"));
      });

      test('testSwiftThrows', () {
          expect(Functions.willThrow, throwsA(predicate((e) => '$e'.contains("TheError"))));
      });

  });
}
