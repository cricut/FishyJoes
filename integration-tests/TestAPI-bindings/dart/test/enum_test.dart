import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('EnumTests', () {
      // test('testEmptyEnum', () {
      //     expect(EmptyEnum.notGoingToHappen, throwsA(isA<Exception>()));
      // });

      // test('testSimpleEnum', () {
      //     // expect(SimpleEnum.red().hex, equals(0xff0000));
      //     // expect(SimpleEnum.green().hex, equals(0x00ff00));
      //     // expect(SimpleEnum.blue().hex, equals(0x0000ff));
      //     var enumObj = SimpleEnum.red;
      //     var c = enumObj.testFuncCall(8, 32);
      //     print("c: $c");
      //     print("done!");
      //     // expect(SimpleEnum.pickAColor(0), equals(SimpleEnum.red()));
      //     // expect(SimpleEnum.pickAColor(1), equals(SimpleEnum.green()));
      //     // expect(SimpleEnum.pickAColor(2), equals(SimpleEnum.blue()));
      // });

      // test('testAssociatedDataEnum', () {
      //     shape1(int x) => AssociatedDataEnum.thing(x);
      //     shape2(String x, String y, int z) => AssociatedDataEnum.bar(x, AssociatedDataEnum.other(y, z));

      //     expect(shape1(4).intValue, equals(4));
      //     expect(shape2("hello", "world", 8).intValue, equals(11));
      //     expect(shape1(2).plus(shape2("x", "y", 4)), equals(shape1(9)));
      //     expect(shape2("y", "z", 2).plus(shape1(5)), equals(shape2("y", "z", 7)));
      // });
      // test('testAssociatedDataEnum', () {
      //   var enumObj = AssociatedDataEnum.thing;
      //   print("enumObj: $enumObj");
      //   print("enumObj.thingValue: ${enumObj.thingValue}");
      // });

      test('testAssociatedDataEnum', () {
        var enumObj = AssociatedDataEnum.thing(900);
        print("enumObj: $enumObj");
        var thing = enumObj as AssociatedDataEnum_Thing;
        print("thing.value: ${thing.value}");
      });
  });
}
