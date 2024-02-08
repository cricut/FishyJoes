import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('MethodTests', () {
      test('StaticMethods', () {
          expect(Methods.staticGet, equals(123));
          // TODO: expect(Methods.staticGetMethod(), equals(234));

          expect(Methods.staticModifiable, equals(345));
          Methods.staticModifiable = 987;
          expect(Methods.staticModifiable, equals(987));

          expect(Methods.staticStored, equals(567));
          Methods.staticStored = 765;
          expect(Methods.staticStored, equals(765));
      });

      test('InstanceMethods', () {
          final instance = Methods.create();

          expect(instance.instanceGet, equals(1234));
          // TODO: expect(instance.instanceGetMethod(), equals(2345));

          expect(instance.instanceModifiable, equals(3456));
          instance.instanceModifiable = 9876;
          expect(instance.instanceModifiable, equals(9876));

          expect(instance.instanceStored, equals(5678));
          instance.instanceStored = 7654;
          expect(instance.instanceStored, equals(7654));
      });

      test('AsyncFunctionCall', () async {
        final value = await Methods.async42();
        expect(value, equals(42));
      });

      test('AsyncYieldingFunctionCall', () async {
        await Methods.asyncYield();
      });

      test('AsyncSleepFunctionCal', () async {
        await Methods.asyncSleep();
      });

      test('AsyncVoidFunctionCall', () async {
        await Methods.asyncVoid();
      });

      test('AsyncCallbackFunctionCall0', () async {
        var threw = false;
        var value = 42;
        var ran = false;
        try {
          value = await Methods.asyncCallbackFunc0(() async {
            ran = true;
            return 42;
          });
        } catch (e) {
          threw = true;
        }
        expect(threw, equals(false));
        expect(value, equals(42));
        expect(ran, equals(true));
      });

      test('AsyncCallbackFunctionCallThrow', () async {
        expect(() async {
          await Methods.asyncCallbackFunc0(() => throw "asyncErr");
        }, throwsA(equals("asyncErr")));
      });

      test('AsyncDoubleFunctionCall', () async {
        final value = await Methods.asyncDouble(1.0);
        expect(value, equals(2.0));
      });

      test('AsyncMultipleArgsFunctionCall', () async {
        expect(await Methods.asyncMultipleArgs(1, () async => 2), equals(3));
      });

      test('AsyncThrowingFunctionCall', () {
        expect(() async {
          await Methods.asyncThrowing();
        }, throwsA(predicate((e) => '$e'.contains("TheMethodError()"))));
      });
  });
}
