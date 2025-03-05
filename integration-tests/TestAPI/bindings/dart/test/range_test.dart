import 'package:cricut_testapi/testapi.dart';
import 'package:test/test.dart';
import 'package:fishyjoes_dart/runtime.dart';

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

  group('RangeTests', () {
      test('testRangeValues', () {
          expect(Ranges.uInt8Range, equals(SwiftRange(0, uint8Max)));
          expect(Ranges.uInt16Range, equals(SwiftRange(0, uint16Max)));
          expect(Ranges.uInt32Range, equals(SwiftRange(0, uint32Max)));
          // TODO: should we forbid uint64?
          //expect(Ranges.uInt64Range, equals(SwiftRange(0, uint64Max)));
          //expect(Ranges.uIntRange, equals(SwiftRange(0, uint64Max)));
          expect(Ranges.int8Range, equals(SwiftRange(int8Min, int8Max)));
          expect(Ranges.int16Range, equals(SwiftRange(int16Min, int16Max)));
          expect(Ranges.int32Range, equals(SwiftRange(int32Min, int32Max)));
          expect(Ranges.int64Range, equals(SwiftRange(int64Min, int64Max)));
          expect(Ranges.intRange, equals(SwiftRange(int32Min, int32Max)));
      });

      test('testRangeEcho', () {
          expect(Ranges.echoUInt8Range(Ranges.uInt8Range), equals(Ranges.uInt8Range));
          expect(Ranges.echoUInt16Range(Ranges.uInt16Range), equals(Ranges.uInt16Range));
          expect(Ranges.echoUInt32Range(Ranges.uInt32Range), equals(Ranges.uInt32Range));
          // TODO: should we forbid uint64?
          //expect(Ranges.echoUInt64Range(Ranges.uInt64Range), equals(Ranges.uInt64Range));
          //expect(Ranges.echoUIntRange(Ranges.uIntRange), equals(Ranges.uIntRange));
          expect(Ranges.echoInt8Range(Ranges.int8Range), equals(Ranges.int8Range));
          expect(Ranges.echoInt16Range(Ranges.int16Range), equals(Ranges.int16Range));
          expect(Ranges.echoInt32Range(Ranges.int32Range), equals(Ranges.int32Range));
          expect(Ranges.echoInt64Range(Ranges.int64Range), equals(Ranges.int64Range));
          expect(Ranges.echoIntRange(Ranges.intRange), equals(Ranges.intRange));
      });

      test('testClosedRangeValues', () {
          expect(ClosedRanges.uInt8Range, equals(SwiftClosedRange(0, uint8Max)));
          expect(ClosedRanges.uInt16Range, equals(SwiftClosedRange(0, uint16Max)));
          expect(ClosedRanges.uInt32Range, equals(SwiftClosedRange(0, uint32Max)));
          // TODO: should we forbid uint64?
          //expect(ClosedRanges.uInt64Range, equals(SwiftClosedRange(0, uint64Max)));
          //expect(ClosedRanges.uIntRange, equals(SwiftClosedRange(0, uint64Max)));
          expect(ClosedRanges.int8Range, equals(SwiftClosedRange(int8Min, int8Max)));
          expect(ClosedRanges.int16Range, equals(SwiftClosedRange(int16Min, int16Max)));
          expect(ClosedRanges.int32Range, equals(SwiftClosedRange(int32Min, int32Max)));
          expect(ClosedRanges.int64Range, equals(SwiftClosedRange(int64Min, int64Max)));
          expect(ClosedRanges.intRange, equals(SwiftClosedRange(int32Min, int32Max)));
          expect(ClosedRanges.floatRange, equals(SwiftClosedRange(-floatMax, floatMax)));
          expect(ClosedRanges.doubleRange, equals(SwiftClosedRange(-doubleMax, doubleMax)));
          expect(ClosedRanges.stringRange, equals(SwiftClosedRange("A", "Z")));
      });

      test('testClosedRangeEcho', () {
          expect(ClosedRanges.echoUInt8Range(ClosedRanges.uInt8Range), equals(ClosedRanges.uInt8Range));
          expect(ClosedRanges.echoUInt16Range(ClosedRanges.uInt16Range), equals(ClosedRanges.uInt16Range));
          expect(ClosedRanges.echoUInt32Range(ClosedRanges.uInt32Range), equals(ClosedRanges.uInt32Range));
          // TODO: should we forbid uint64?
          //expect(ClosedRanges.echoUInt64Range(ClosedRanges.uInt64Range), equals(ClosedRanges.uInt64Range));
          //expect(ClosedRanges.echoUIntRange(ClosedRanges.uIntRange), equals(ClosedRanges.uIntRange));
          expect(ClosedRanges.echoInt8Range(ClosedRanges.int8Range), equals(ClosedRanges.int8Range));
          expect(ClosedRanges.echoInt16Range(ClosedRanges.int16Range), equals(ClosedRanges.int16Range));
          expect(ClosedRanges.echoInt32Range(ClosedRanges.int32Range), equals(ClosedRanges.int32Range));
          expect(ClosedRanges.echoInt64Range(ClosedRanges.int64Range), equals(ClosedRanges.int64Range));
          expect(ClosedRanges.echoIntRange(ClosedRanges.intRange), equals(ClosedRanges.intRange));
          expect(ClosedRanges.echoFloatRange(ClosedRanges.floatRange), equals(ClosedRanges.floatRange));
          expect(ClosedRanges.echoDoubleRange(ClosedRanges.doubleRange), equals(ClosedRanges.doubleRange));
          expect(ClosedRanges.echoStringRange(ClosedRanges.stringRange), equals(ClosedRanges.stringRange));

          // TODO: Empty ranges?
          // ClosedRange empty = new ClosedRange(0, -1)
          // Assert.True(empty.isEmpty())
          // Assert.True(ClosedRanges.echoInt32Range(empty).isEmpty())
      });
  });
}
