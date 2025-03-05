import 'package:cricut_testapi/testapi.dart';
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

      group('AsyncInstanceTests', () {
          test('AsyncFunctionCall', () async {
              final value = await Methods.create().async42();
              expect(value, equals(42));
          });

          test('AsyncYieldingFunctionCall', () async {
              await Methods.create().asyncYield();
          });

          test('AsyncSleepFunctionCal', () async {
              await Methods.create().asyncSleep();
          });

          test('AsyncVoidFunctionCall', () async {
              await Methods.create().asyncVoid();
          });

          test('AsyncCallbackFunctionCall0', () async {
              var threw = false;
              var value = 42;
              var ran = false;
              try {
                value = await Methods.create().asyncCallbackFunc0(() async {
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
                  await Methods.create().asyncCallbackFunc0(() => throw "asyncErr");
                }, throwsA(equals("asyncErr")));
          });

          test('AsyncDoubleFunctionCall', () async {
              final value = await Methods.create().asyncDouble(1.0);
              expect(value, equals(2.0));
          });

          test('AsyncMultipleArgsFunctionCall', () async {
              expect(await Methods.create().asyncMultipleArgs(1, () async => 2), equals(3));
          });

          test('AsyncThrowingFunctionCall', () {
              expect(() async {
                  await Methods.create().asyncThrowing();
                }, throwsA(predicate((e) => '$e'.contains("TheMethodError()"))));
          });
      });

      group('AsyncStaticTests', () {
          test('AsyncFunctionCall', () async {
              final value = await Methods.staticAsync42();
              expect(value, equals(42));
          });

          test('AsyncYieldingFunctionCall', () async {
              await Methods.staticAsyncYield();
          });

          test('AsyncSleepFunctionCal', () async {
              await Methods.staticAsyncSleep();
          });

          test('AsyncVoidFunctionCall', () async {
              await Methods.staticAsyncVoid();
          });

          test('AsyncCallbackFunctionCall0', () async {
              var threw = false;
              var value = 42;
              var ran = false;
              try {
                value = await Methods.staticAsyncCallbackFunc0(() async {
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
                  await Methods.staticAsyncCallbackFunc0(() => throw "asyncErr");
                }, throwsA(equals("asyncErr")));
          });

          test('AsyncDoubleFunctionCall', () async {
              final value = await Methods.staticAsyncDouble(1.0);
              expect(value, equals(2.0));
          });

          test('AsyncMultipleArgsFunctionCall', () async {
              expect(await Methods.staticAsyncMultipleArgs(1, () async => 2), equals(3));
          });

          test('AsyncThrowingFunctionCall', () {
              expect(() async {
                  await Methods.staticAsyncThrowing();
                }, throwsA(predicate((e) => '$e'.contains("TheMethodError()"))));
          });
      });
  });
}
