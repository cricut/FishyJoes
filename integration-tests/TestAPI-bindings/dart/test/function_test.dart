import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';
import 'dart:isolate';

void main() {
  setUp(() {
      print("${Isolate.current}, ${Isolate.current.hashCode}, ${Isolate.current.debugName}");
      final _ = ensureLoaded;
  });

  group('FunctionTests', () {
      test('First Test', () {
          expect(Collections.arrayOfInt, equals([2, 7, 3, 5, 8]));
          // expect(Collections.defaultCollectionHolder.integerSet, equals(<int>{2, 7}));
      });

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

  });
}

// internal class FunctionTests {
//     object ComposeError: Error()

//     @Test
//     fun testExceptionInCompose() {
//         val composed = Functions.intCompose({ throw ComposeError }, { it })
//         assertThrows<ComposeError> { composed(3) }
//     }

//     @Test

//     @Test
//     fun testPassingFunctionsToSwift() {
//         assertEquals("8", Functions.exercise0 { 8 })
//         assertEquals("3", Functions.exercise1 { abs(it) })
//         assertEquals("25", Functions.exercise2 { f, g -> { f(g(it)) } })
//         assertEquals("7.4", Functions.exercise3 { a, b, c -> a + b + c })
//         assertEquals("""["a", "b", "c", "d"]""", Functions.exercise4 { a, b, c, d -> listOf(a, b, c, d) })
//         assertEquals("83", Functions.exercise5 { _, _, _, _, f -> f })
//         assertEquals("42", Functions.exercise6 { _, _, _, _, _, i -> i })
//     }

//     @Test
//     fun testSwiftThrows() {
//         assertThrows(Error::class.java) { Functions.willThrow() }
//     }
// }
