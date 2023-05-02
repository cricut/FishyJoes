import { TestAPI } from 'TestAPI';

test('RangeValues', () => {
    expect(TestAPI.Ranges.uInt8Range.start).toEqual(TestAPI.Primitives.minUInt8)
    expect(TestAPI.Ranges.uInt8Range.endExclusive).toEqual(TestAPI.Primitives.maxUInt8)
    expect(TestAPI.Ranges.uInt8Range).toEqual({ start: TestAPI.Primitives.minUInt8, endExclusive: TestAPI.Primitives.maxUInt8 })
    expect(TestAPI.Ranges.uInt16Range).toEqual({ start: TestAPI.Primitives.minUInt16, endExclusive: TestAPI.Primitives.maxUInt16 })
    expect(TestAPI.Ranges.uInt32Range).toEqual({ start: TestAPI.Primitives.minUInt32, endExclusive: TestAPI.Primitives.maxUInt32 })
    expect(TestAPI.Ranges.uInt64Range).toEqual({ start: TestAPI.Primitives.minUInt64, endExclusive: TestAPI.Primitives.maxUInt64 })
    expect(TestAPI.Ranges.uIntRange).toEqual({ start: TestAPI.Primitives.minUInt, endExclusive: TestAPI.Primitives.maxUInt })
    expect(TestAPI.Ranges.int8Range).toEqual({ start: TestAPI.Primitives.minInt8, endExclusive: TestAPI.Primitives.maxInt8 })
    expect(TestAPI.Ranges.int16Range).toEqual({ start: TestAPI.Primitives.minInt16, endExclusive: TestAPI.Primitives.maxInt16 })
    expect(TestAPI.Ranges.int32Range).toEqual({ start: TestAPI.Primitives.minInt32, endExclusive: TestAPI.Primitives.maxInt32 })
    expect(TestAPI.Ranges.int64Range).toEqual({ start: TestAPI.Primitives.minInt64, endExclusive: TestAPI.Primitives.maxInt64 })
    expect(TestAPI.Ranges.intRange).toEqual({ start: TestAPI.Primitives.minInt, endExclusive: TestAPI.Primitives.maxInt })
});

test('RangeEcho', () => {
    expect(TestAPI.Ranges.echoUInt8Range(TestAPI.Ranges.uInt8Range)).toEqual(TestAPI.Ranges.uInt8Range)
    expect(TestAPI.Ranges.echoUInt16Range(TestAPI.Ranges.uInt16Range)).toEqual(TestAPI.Ranges.uInt16Range)
    expect(TestAPI.Ranges.echoUInt32Range(TestAPI.Ranges.uInt32Range)).toEqual(TestAPI.Ranges.uInt32Range)
    expect(TestAPI.Ranges.echoUInt64Range(TestAPI.Ranges.uInt64Range)).toEqual(TestAPI.Ranges.uInt64Range)
    expect(TestAPI.Ranges.echoUIntRange(TestAPI.Ranges.uIntRange)).toEqual(TestAPI.Ranges.uIntRange)
    expect(TestAPI.Ranges.echoInt8Range(TestAPI.Ranges.int8Range)).toEqual(TestAPI.Ranges.int8Range)
    expect(TestAPI.Ranges.echoInt16Range(TestAPI.Ranges.int16Range)).toEqual(TestAPI.Ranges.int16Range)
    expect(TestAPI.Ranges.echoInt32Range(TestAPI.Ranges.int32Range)).toEqual(TestAPI.Ranges.int32Range)
    expect(TestAPI.Ranges.echoInt64Range(TestAPI.Ranges.int64Range)).toEqual(TestAPI.Ranges.int64Range)
    expect(TestAPI.Ranges.echoIntRange(TestAPI.Ranges.intRange)).toEqual(TestAPI.Ranges.intRange)
});

test('ClosedRangeValues', () => {
    expect(TestAPI.ClosedRanges.uInt8Range.start).toEqual(TestAPI.Primitives.minUInt8)
    expect(TestAPI.ClosedRanges.uInt8Range.endInclusive).toEqual(TestAPI.Primitives.maxUInt8)
    expect(TestAPI.ClosedRanges.uInt8Range).toEqual({ start: TestAPI.Primitives.minUInt8, endInclusive: TestAPI.Primitives.maxUInt8 })
    expect(TestAPI.ClosedRanges.uInt16Range).toEqual({ start: TestAPI.Primitives.minUInt16, endInclusive: TestAPI.Primitives.maxUInt16 })
    expect(TestAPI.ClosedRanges.uInt32Range).toEqual({ start: TestAPI.Primitives.minUInt32, endInclusive: TestAPI.Primitives.maxUInt32 })
    expect(TestAPI.ClosedRanges.uInt64Range).toEqual({ start: TestAPI.Primitives.minUInt64, endInclusive: TestAPI.Primitives.maxUInt64 })
    expect(TestAPI.ClosedRanges.uIntRange).toEqual({ start: TestAPI.Primitives.minUInt, endInclusive: TestAPI.Primitives.maxUInt })
    expect(TestAPI.ClosedRanges.int8Range).toEqual({ start: TestAPI.Primitives.minInt8, endInclusive: TestAPI.Primitives.maxInt8 })
    expect(TestAPI.ClosedRanges.int16Range).toEqual({ start: TestAPI.Primitives.minInt16, endInclusive: TestAPI.Primitives.maxInt16 })
    expect(TestAPI.ClosedRanges.int32Range).toEqual({ start: TestAPI.Primitives.minInt32, endInclusive: TestAPI.Primitives.maxInt32 })
    expect(TestAPI.ClosedRanges.int64Range).toEqual({ start: TestAPI.Primitives.minInt64, endInclusive: TestAPI.Primitives.maxInt64 })
    expect(TestAPI.ClosedRanges.intRange).toEqual({ start: TestAPI.Primitives.minInt, endInclusive: TestAPI.Primitives.maxInt })
    expect(TestAPI.ClosedRanges.floatRange).toEqual({ start: TestAPI.Primitives.minFloat, endInclusive: TestAPI.Primitives.maxFloat })
    expect(TestAPI.ClosedRanges.doubleRange).toEqual({ start: TestAPI.Primitives.minDouble, endInclusive: TestAPI.Primitives.maxDouble })
    expect(TestAPI.ClosedRanges.stringRange).toEqual({ start: "A", endInclusive: "Z" })
});

test('ClosedRangeEcho', () => {
    expect(TestAPI.ClosedRanges.echoUInt8Range(TestAPI.ClosedRanges.uInt8Range)).toEqual(TestAPI.ClosedRanges.uInt8Range)
    expect(TestAPI.ClosedRanges.echoUInt16Range(TestAPI.ClosedRanges.uInt16Range)).toEqual(TestAPI.ClosedRanges.uInt16Range)
    expect(TestAPI.ClosedRanges.echoUInt32Range(TestAPI.ClosedRanges.uInt32Range)).toEqual(TestAPI.ClosedRanges.uInt32Range)
    expect(TestAPI.ClosedRanges.echoUInt64Range(TestAPI.ClosedRanges.uInt64Range)).toEqual(TestAPI.ClosedRanges.uInt64Range)
    expect(TestAPI.ClosedRanges.echoUIntRange(TestAPI.ClosedRanges.uIntRange)).toEqual(TestAPI.ClosedRanges.uIntRange)
    expect(TestAPI.ClosedRanges.echoInt8Range(TestAPI.ClosedRanges.int8Range)).toEqual(TestAPI.ClosedRanges.int8Range)
    expect(TestAPI.ClosedRanges.echoInt16Range(TestAPI.ClosedRanges.int16Range)).toEqual(TestAPI.ClosedRanges.int16Range)
    expect(TestAPI.ClosedRanges.echoInt32Range(TestAPI.ClosedRanges.int32Range)).toEqual(TestAPI.ClosedRanges.int32Range)
    expect(TestAPI.ClosedRanges.echoInt64Range(TestAPI.ClosedRanges.int64Range)).toEqual(TestAPI.ClosedRanges.int64Range)
    expect(TestAPI.ClosedRanges.echoIntRange(TestAPI.ClosedRanges.intRange)).toEqual(TestAPI.ClosedRanges.intRange)
    expect(TestAPI.ClosedRanges.echoFloatRange(TestAPI.ClosedRanges.floatRange)).toEqual(TestAPI.ClosedRanges.floatRange)
    expect(TestAPI.ClosedRanges.echoDoubleRange(TestAPI.ClosedRanges.doubleRange)).toEqual(TestAPI.ClosedRanges.doubleRange)
    expect(TestAPI.ClosedRanges.echoStringRange(TestAPI.ClosedRanges.stringRange)).toEqual(TestAPI.ClosedRanges.stringRange)
});
