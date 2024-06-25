import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  final uint8Max  = 0xff;
  final uint16Max = 0xffff;
  final uint32Max = 0xffffffff;
  // TODO: should we forbid uint64?
  final uint64Max = -1;

  final int8Min  = -0x80;
  final int16Min = -0x8000;
  final int32Min = -0x80000000;
  final int64Min = -0x8000000000000000;

  final int8Max  = 0x7f;
  final int16Max = 0x7fff;
  final int32Max = 0x7fffffff;
  final int64Max = 0x7fffffffffffffff;

  final floatMax = 3.4028234663852886E+38;
  final doubleMax = 1.7976931348623157E+308;

  group('PrimitiveTests', () {
      test('testPrimitiveValues', () {
          expect(Primitives.falseBool, equals(false));
          expect(Primitives.trueBool, equals(true));
          expect(Primitives.zeroUInt8, equals(0));
          expect(Primitives.minUInt8, equals(0));
          expect(Primitives.maxUInt8, equals(uint8Max));
          expect(Primitives.zeroUInt16, equals(0));
          expect(Primitives.minUInt16, equals(0));
          expect(Primitives.maxUInt16, equals(uint16Max));
          expect(Primitives.zeroUInt32, equals(0));
          expect(Primitives.minUInt32, equals(0));
          expect(Primitives.maxUInt32, equals(uint32Max));
          expect(Primitives.zeroUInt64, equals(0));
          expect(Primitives.minUInt64, equals(0));
          expect(Primitives.maxUInt64, equals(uint64Max));
          expect(Primitives.zeroInt8, equals(0));
          expect(Primitives.minInt8, equals(int8Min));
          expect(Primitives.maxInt8, equals(int8Max));
          expect(Primitives.zeroInt16, equals(0));
          expect(Primitives.minInt16, equals(int16Min));
          expect(Primitives.maxInt16, equals(int16Max));
          expect(Primitives.zeroInt32, equals(0));
          expect(Primitives.minInt32, equals(int32Min));
          expect(Primitives.maxInt32, equals(int32Max));
          expect(Primitives.zeroInt64, equals(0));
          expect(Primitives.minInt64, equals(int64Min));
          expect(Primitives.maxInt64, equals(int64Max));
          expect(Primitives.zeroFloat, equals(0.0));
          expect(Primitives.minFloat, equals(-floatMax));
          expect(Primitives.maxFloat, equals(floatMax));
          expect(Primitives.zeroDouble, equals(0.0));
          expect(Primitives.minDouble, equals(-doubleMax));
          expect(Primitives.maxDouble, equals(doubleMax));
      });

      test('testArraysOfPrimitiveValues', () {
          expect(Primitives.manyBool, equals([false, true]));
          expect(Primitives.manyUInt8, equals([0, 0, uint8Max]));
          expect(Primitives.manyUInt16, equals([0, 0, uint16Max]));
          expect(Primitives.manyUInt32, equals([0, 0, uint32Max]));
          expect(Primitives.manyUInt64, equals([0, 0, uint64Max]));
          expect(Primitives.manyInt8, equals([0, int8Min, int8Max]));
          expect(Primitives.manyInt16, equals([0, int16Min, int16Max]));
          expect(Primitives.manyInt32, equals([0, int32Min, int32Max]));
          expect(Primitives.manyInt64, equals([0, int64Min, int64Max]));
          expect(Primitives.manyFloat, equals([0, -floatMax, floatMax]));
          expect(Primitives.manyDouble, equals([0, -doubleMax, doubleMax]));
      });

      test('testArraysOfOptionalPrimitiveValues', () {
          expect(Primitives.manyMaybeBool, equals([null, false, true]));
          expect(Primitives.manyMaybeUInt8, equals([null, 0, 0, uint8Max]));
          expect(Primitives.manyMaybeUInt16, equals([null, 0, 0, uint16Max]));
          expect(Primitives.manyMaybeUInt32, equals([null, 0, 0, uint32Max]));
          expect(Primitives.manyMaybeUInt64, equals([null, 0, 0, uint64Max]));
          expect(Primitives.manyMaybeInt8, equals([null, 0, int8Min, int8Max]));
          expect(Primitives.manyMaybeInt16, equals([null, 0, int16Min, int16Max]));
          expect(Primitives.manyMaybeInt32, equals([null, 0, int32Min, int32Max]));
          expect(Primitives.manyMaybeInt64, equals([null, 0, int64Min, int64Max]));
          expect(Primitives.manyMaybeFloat, equals([null, 0, -floatMax, floatMax]));
          expect(Primitives.manyMaybeDouble, equals([null, 0, -doubleMax, doubleMax]));
      });

      test('testFunctionsTakingAndReturningPrimitiveTypes', () {
          expect(Primitives.echoBool(false), equals(false));
          expect(Primitives.echoBool(true), equals(true));
          expect(Primitives.echoUInt8(0), equals(0));
          expect(Primitives.echoUInt8(0), equals(0));
          expect(Primitives.echoUInt8(uint8Max), equals(uint8Max));
          expect(Primitives.echoUInt16(0), equals(0));
          expect(Primitives.echoUInt16(0), equals(0));
          expect(Primitives.echoUInt16(uint16Max), equals(uint16Max));
          expect(Primitives.echoUInt32(0), equals(0));
          expect(Primitives.echoUInt32(0), equals(0));
          expect(Primitives.echoUInt32(uint32Max), equals(uint32Max));
          expect(Primitives.echoUInt64(0), equals(0));
          expect(Primitives.echoUInt64(0), equals(0));
          expect(Primitives.echoUInt64(uint64Max), equals(uint64Max));
          expect(Primitives.echoInt8(0), equals(0));
          expect(Primitives.echoInt8(int8Min), equals(int8Min));
          expect(Primitives.echoInt8(int8Max), equals(int8Max));
          expect(Primitives.echoInt16(0), equals(0));
          expect(Primitives.echoInt16(int16Min), equals(int16Min));
          expect(Primitives.echoInt16(int16Max), equals(int16Max));
          expect(Primitives.echoInt32(0), equals(0));
          expect(Primitives.echoInt32(int32Min), equals(int32Min));
          expect(Primitives.echoInt32(int32Max), equals(int32Max));
          expect(Primitives.echoInt64(0), equals(0));
          expect(Primitives.echoInt64(int64Min), equals(int64Min));
          expect(Primitives.echoInt64(int64Max), equals(int64Max));
          expect(Primitives.echoFloat(0.0), equals(0.0));
          expect(Primitives.echoFloat(-floatMax), equals(-floatMax));
          expect(Primitives.echoFloat(floatMax), equals(floatMax));
          expect(Primitives.echoDouble(0.0), equals(0.0));
          expect(Primitives.echoDouble(-doubleMax), equals(-doubleMax));
          expect(Primitives.echoDouble(doubleMax), equals(doubleMax));
      });

      test('testFunctionsTakingReturningOptionalPrimitiveTypes', () {
          expect(Primitives.maybeEchoBool(null), equals(null));
          expect(Primitives.maybeEchoBool(false), equals(false));
          expect(Primitives.maybeEchoBool(true), equals(true));
          expect(Primitives.maybeEchoUInt8(null), equals(null));
          expect(Primitives.maybeEchoUInt8(0), equals(0));
          expect(Primitives.maybeEchoUInt8(0), equals(0));
          expect(Primitives.maybeEchoUInt8(uint8Max), equals(uint8Max));
          expect(Primitives.maybeEchoUInt16(null), equals(null));
          expect(Primitives.maybeEchoUInt16(0), equals(0));
          expect(Primitives.maybeEchoUInt16(0), equals(0));
          expect(Primitives.maybeEchoUInt16(uint16Max), equals(uint16Max));
          expect(Primitives.maybeEchoUInt32(null), equals(null));
          expect(Primitives.maybeEchoUInt32(0), equals(0));
          expect(Primitives.maybeEchoUInt32(0), equals(0));
          expect(Primitives.maybeEchoUInt32(uint32Max), equals(uint32Max));
          expect(Primitives.maybeEchoUInt64(null), equals(null));
          expect(Primitives.maybeEchoUInt64(0), equals(0));
          expect(Primitives.maybeEchoUInt64(0), equals(0));
          expect(Primitives.maybeEchoUInt64(uint64Max), equals(uint64Max));
          expect(Primitives.maybeEchoInt8(null), equals(null));
          expect(Primitives.maybeEchoInt8(0), equals(0));
          expect(Primitives.maybeEchoInt8(int8Min), equals(int8Min));
          expect(Primitives.maybeEchoInt8(int8Max), equals(int8Max));
          expect(Primitives.maybeEchoInt16(null), equals(null));
          expect(Primitives.maybeEchoInt16(0), equals(0));
          expect(Primitives.maybeEchoInt16(int16Min), equals(int16Min));
          expect(Primitives.maybeEchoInt16(int16Max), equals(int16Max));
          expect(Primitives.maybeEchoInt32(null), equals(null));
          expect(Primitives.maybeEchoInt32(0), equals(0));
          expect(Primitives.maybeEchoInt32(int32Min), equals(int32Min));
          expect(Primitives.maybeEchoInt32(int32Max), equals(int32Max));
          expect(Primitives.maybeEchoInt64(null), equals(null));
          expect(Primitives.maybeEchoInt64(0), equals(0));
          expect(Primitives.maybeEchoInt64(int64Min), equals(int64Min));
          expect(Primitives.maybeEchoInt64(int64Max), equals(int64Max));
          expect(Primitives.maybeEchoFloat(null), equals(null));
          expect(Primitives.maybeEchoFloat(0.0), equals(0.0));
          expect(Primitives.maybeEchoFloat(-floatMax), equals(-floatMax));
          expect(Primitives.maybeEchoFloat(floatMax), equals(floatMax));
          expect(Primitives.maybeEchoDouble(null), equals(null));
          expect(Primitives.maybeEchoDouble(0.0), equals(0.0));
          expect(Primitives.maybeEchoDouble(-doubleMax), equals(-doubleMax));
          expect(Primitives.maybeEchoDouble(doubleMax), equals(doubleMax));
      });

      test('testFunctionsTakingClosuresWithPrimitiveTypes', () {
          expect(Primitives.valueMapper(10, (it) => (it ?? 0) * 2), equals(20));
      });

      test('testObjectsWithPrimitiveMembers', () {
          expect(Primitives_PrimitiveHolder.staticProperty, equals([null, 0, 0, uint8Max]));
          expect(Primitives_PrimitiveHolder.staticMutableProperty, equals([null, 0, 0, uint8Max]));
          Primitives_PrimitiveHolder.staticMutableProperty = [100, 200];
          expect(Primitives_PrimitiveHolder.staticMutableProperty, equals([100, 200]));
          final s = Primitives.defaultPrimitiveHolder;
          expect(s, equals(Primitives.defaultPrimitiveHolder));
          s.b = !s.b;
          expect(s, isNot(equals(Primitives.defaultPrimitiveHolder)));
      });
  });
}
