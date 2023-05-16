//
//  Ranges.swift
//  FishyJoes
//
//  Created by Matt Stoker on 4/21/23.
//

/// <!-- FishyJoes.export(Ranges) -->
public enum Ranges {
    /// <!-- FishyJoes.export(uInt8Range) -->
    public static let uInt8Range: Range<UInt8> = UInt8.min..<UInt8.max
    /// <!-- FishyJoes.export(uInt16Range) -->
    public static let uInt16Range: Range<UInt16> = UInt16.min..<UInt16.max
    /// <!-- FishyJoes.export(uInt32Range) -->
    public static let uInt32Range: Range<UInt32> = UInt32.min..<UInt32.max
    /// <!-- FishyJoes.export(uInt64Range) -->
    public static let uInt64Range: Range<UInt64> = UInt64.min..<UInt64.max
    /// <!-- FishyJoes.export(uIntRange) -->
    public static let uIntRange: Range<UInt> = UInt(UInt32.min)..<UInt(UInt32.max)
    /// <!-- FishyJoes.export(int8Range) -->
    public static let int8Range: Range<Int8> = Int8.min..<Int8.max
    /// <!-- FishyJoes.export(int16Range) -->
    public static let int16Range: Range<Int16> = Int16.min..<Int16.max
    /// <!-- FishyJoes.export(int32Range) -->
    public static let int32Range: Range<Int32> = Int32.min..<Int32.max
    /// <!-- FishyJoes.export(int64Range) -->
    public static let int64Range: Range<Int64> = Int64.min..<Int64.max
    /// <!-- FishyJoes.export(intRange) -->
    public static let intRange: Range<Int> = Int(Int32.min)..<Int(Int32.max)
    // TODO: Support for non-integer open-ended ranges
//    /// <!-- FishyJoes.export(floatRange) -->
//    public static let floatRange: Range<Float> = -Float.greatestFiniteMagnitude..<Float.greatestFiniteMagnitude
//    /// <!-- FishyJoes.export(doubleRange) -->
//    public static let doubleRange: Range<Double> = -Double.greatestFiniteMagnitude..<Double.greatestFiniteMagnitude
//    /// <!-- FishyJoes.export(stringRange) -->
//    public static let stringRange: Range<String> = "A"..<"Z"

    /// <!-- FishyJoes.export(echoUInt8Range) -->
    public static func echoUInt8Range(_ range: Range<UInt8>) -> Range<UInt8> { return range }
    /// <!-- FishyJoes.export(echoUInt16Range) -->
    public static func echoUInt16Range(_ range: Range<UInt16>) -> Range<UInt16> { return range }
    /// <!-- FishyJoes.export(echoUInt32Range) -->
    public static func echoUInt32Range(_ range: Range<UInt32>) -> Range<UInt32> { return range }
    /// <!-- FishyJoes.export(echoUInt64Range) -->
    public static func echoUInt64Range(_ range: Range<UInt64>) -> Range<UInt64> { return range }
    /// <!-- FishyJoes.export(echoUIntRange) -->
    public static func echoUIntRange(_ range: Range<UInt>) -> Range<UInt> { return range }
    /// <!-- FishyJoes.export(echoInt8Range) -->
    public static func echoInt8Range(_ range: Range<Int8>) -> Range<Int8> { return range }
    /// <!-- FishyJoes.export(echoInt16Range) -->
    public static func echoInt16Range(_ range: Range<Int16>) -> Range<Int16> { return range }
    /// <!-- FishyJoes.export(echoInt32Range) -->
    public static func echoInt32Range(_ range: Range<Int32>) -> Range<Int32> { return range }
    /// <!-- FishyJoes.export(echoInt64Range) -->
    public static func echoInt64Range(_ range: Range<Int64>) -> Range<Int64> { return range }
    /// <!-- FishyJoes.export(echoIntRange) -->
    public static func echoIntRange(_ range: Range<Int>) -> Range<Int> { return range }
    // TODO: Support for non-integer open-ended ranges
//    /// <!-- FishyJoes.export(echoFloatRange) -->
//    public static func echoFloatRange(_ range: Range<Float>) -> Range<Float> { return range }
//    /// <!-- FishyJoes.export(echoDoubleRange) -->
//    public static func echoDoubleRange(_ range: Range<Double>) -> Range<Double> { return range }
//    /// <!-- FishyJoes.export(echoStringRange) -->
//    public static func echoStringRange(_ range: Range<String>) -> Range<String> { return range }
}

/// <!-- FishyJoes.export(ClosedRanges) -->
public enum ClosedRanges {
    /// <!-- FishyJoes.export(uInt8Range) -->
    public static let uInt8Range: ClosedRange<UInt8> = UInt8.min...UInt8.max
    /// <!-- FishyJoes.export(uInt16Range) -->
    public static let uInt16Range: ClosedRange<UInt16> = UInt16.min...UInt16.max
    /// <!-- FishyJoes.export(uInt32Range) -->
    public static let uInt32Range: ClosedRange<UInt32> = UInt32.min...UInt32.max
    /// <!-- FishyJoes.export(uInt64Range) -->
    public static let uInt64Range: ClosedRange<UInt64> = UInt64.min...UInt64.max
    /// <!-- FishyJoes.export(uIntRange) -->
    public static let uIntRange: ClosedRange<UInt> = UInt(UInt32.min)...UInt(UInt32.max)
    /// <!-- FishyJoes.export(int8Range) -->
    public static let int8Range: ClosedRange<Int8> = Int8.min...Int8.max
    /// <!-- FishyJoes.export(int16Range) -->
    public static let int16Range: ClosedRange<Int16> = Int16.min...Int16.max
    /// <!-- FishyJoes.export(int32Range) -->
    public static let int32Range: ClosedRange<Int32> = Int32.min...Int32.max
    /// <!-- FishyJoes.export(int64Range) -->
    public static let int64Range: ClosedRange<Int64> = Int64.min...Int64.max
    /// <!-- FishyJoes.export(intRange) -->
    public static let intRange: ClosedRange<Int> = Int(Int32.min)...Int(Int32.max)
    /// <!-- FishyJoes.export(floatRange) -->
    public static let floatRange: ClosedRange<Float> = -Float.greatestFiniteMagnitude...Float.greatestFiniteMagnitude
    /// <!-- FishyJoes.export(doubleRange) -->
    public static let doubleRange: ClosedRange<Double> = -Double.greatestFiniteMagnitude...Double.greatestFiniteMagnitude
    /// <!-- FishyJoes.export(stringRange) -->
    public static let stringRange: ClosedRange<String> = "A"..."Z"

    /// <!-- FishyJoes.export(echoUInt8Range) -->
    public static func echoUInt8Range(_ range: ClosedRange<UInt8>) -> ClosedRange<UInt8> { return range }
    /// <!-- FishyJoes.export(echoUInt16Range) -->
    public static func echoUInt16Range(_ range: ClosedRange<UInt16>) -> ClosedRange<UInt16> { return range }
    /// <!-- FishyJoes.export(echoUInt32Range) -->
    public static func echoUInt32Range(_ range: ClosedRange<UInt32>) -> ClosedRange<UInt32> { return range }
    /// <!-- FishyJoes.export(echoUInt64Range) -->
    public static func echoUInt64Range(_ range: ClosedRange<UInt64>) -> ClosedRange<UInt64> { return range }
    /// <!-- FishyJoes.export(echoUIntRange) -->
    public static func echoUIntRange(_ range: ClosedRange<UInt>) -> ClosedRange<UInt> { return range }
    /// <!-- FishyJoes.export(echoInt8Range) -->
    public static func echoInt8Range(_ range: ClosedRange<Int8>) -> ClosedRange<Int8> { return range }
    /// <!-- FishyJoes.export(echoInt16Range) -->
    public static func echoInt16Range(_ range: ClosedRange<Int16>) -> ClosedRange<Int16> { return range }
    /// <!-- FishyJoes.export(echoInt32Range) -->
    public static func echoInt32Range(_ range: ClosedRange<Int32>) -> ClosedRange<Int32> { return range }
    /// <!-- FishyJoes.export(echoInt64Range) -->
    public static func echoInt64Range(_ range: ClosedRange<Int64>) -> ClosedRange<Int64> { return range }
    /// <!-- FishyJoes.export(echoIntRange) -->
    public static func echoIntRange(_ range: ClosedRange<Int>) -> ClosedRange<Int> { return range }
    /// <!-- FishyJoes.export(echoFloatRange) -->
    public static func echoFloatRange(_ range: ClosedRange<Float>) -> ClosedRange<Float> { return range }
    /// <!-- FishyJoes.export(echoDoubleRange) -->
    public static func echoDoubleRange(_ range: ClosedRange<Double>) -> ClosedRange<Double> { return range }
    /// <!-- FishyJoes.export(echoStringRange) -->
    public static func echoStringRange(_ range: ClosedRange<String>) -> ClosedRange<String> { return range }
}
