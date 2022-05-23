//
//  File.swift
//  File
//
//  Created by Gabriel Pulido on 4/26/22.
//

@_exported import FishyJoesCommonRuntime
import Foundation

public class CPPPacker {
    var data = Data()
    var idx = 0
    private func resize(_ newSize: Int) {
        if newSize > data.count {
            data.append(contentsOf: [UInt8](repeating: 0, count: newSize - data.count))
        }
    }
    private func align(_ alignment: Int) {
        let off = idx & (alignment - 1)
        if off != 0 {
            idx += alignment - off
        }
    }
    func put<T>(_ value: T) {
        align(MemoryLayout<T>.size)
        resize(idx + MemoryLayout<T>.size)
        data.withUnsafeMutableBytes { (pointer: UnsafeMutableRawBufferPointer) -> Void in
            pointer.storeBytes(of: value, toByteOffset: idx, as: T.self)
        }
        idx += MemoryLayout<T>.size
    }
    func take<T>(_ type: T.Type) -> T {
        align(MemoryLayout<T>.size)
        resize(idx + MemoryLayout<T>.size)
        let ret = data.withUnsafeMutableBytes { (pointer: UnsafeMutableRawBufferPointer) in
            return pointer.load(fromByteOffset: idx, as: T.self)
        }
        idx += MemoryLayout<T>.size
        return ret
    }
    func putBytes(newData: Data) {
        resize(idx + newData.count)
        data.withUnsafeMutableBytes { (pointer: UnsafeMutableRawBufferPointer) -> Void in
            newData.copyBytes(to: UnsafeMutableRawBufferPointer(rebasing: pointer[idx..<idx + newData.count]), from: 0..<newData.count)
        }
        idx += newData.count
    }
    func takeBytes(count: Int) -> Data {
        resize(idx + count)
        let ret = data[idx..<idx + count]
        idx += count
        return ret
    }
}

public protocol CPPConverter: Converter {
    static func fromCPP(_: CPPPacker) throws -> SwiftType
    static func toCPP(_: CPPPacker, _: SwiftType) throws
}

extension VoidConverter: CPPConverter {
    public static func fromCPP(_: CPPPacker) throws {}
    public static func toCPP(_: CPPPacker, _ val: Void) throws {}
}

protocol PrimitiveConverter: CPPConverter {}
extension PrimitiveConverter {
    public static func fromCPP(_ packer: CPPPacker) throws -> SwiftType {
        return packer.take(SwiftType.self)
    }
    public static func toCPP(_ packer: CPPPacker, _ val: SwiftType) throws {
        packer.put(val)
    }
}

extension Bool: CPPConverter {
    public static func fromCPP(_ packer: CPPPacker) throws -> Bool {
        return packer.take(UInt8.self) != 0
    }
    public static func toCPP(_ packer: CPPPacker, _ val: Bool) throws {
        packer.put(UInt8(val ? 1 : 0))
    }
}

extension UInt8: PrimitiveConverter {}
extension UInt16: PrimitiveConverter {}
extension UInt32: PrimitiveConverter {}
extension UInt64: PrimitiveConverter {}

extension Int8: PrimitiveConverter {}
extension Int16: PrimitiveConverter {}
extension Int32: PrimitiveConverter {}
extension Int64: PrimitiveConverter {}

extension Float: PrimitiveConverter {}
extension Double: PrimitiveConverter {}

extension Int: CPPConverter {
    public static func fromCPP(_ packer: CPPPacker) throws -> Int {
        return Int(packer.take(Int64.self))
    }
    public static func toCPP(_ packer: CPPPacker, _ val: Int) throws {
        packer.put(Int64(val))
    }
}

extension String: CPPConverter {
    public static func fromCPP(_ packer: CPPPacker) throws -> String {
        let length = packer.take(UInt64.self)
        let utf8Data = packer.takeBytes(count: Int(length))
        return String(data: utf8Data, encoding: Encoding.utf8)!
    }
    public static func toCPP(_ packer: CPPPacker, _ val: String) throws {
        let utf8Data = val.data(using: .utf8)!
        packer.put(UInt64(utf8Data.count))
        packer.putBytes(newData: utf8Data)
    }
}

extension Data: CPPConverter {
    public static func fromCPP(_ packer: CPPPacker) throws -> Data {
        let length = packer.take(UInt64.self)
        return packer.takeBytes(count: Int(length))
    }
    public static func toCPP(_ packer: CPPPacker, _ val: Data) throws {
        packer.put(UInt64(val.count))
        packer.putBytes(newData: val)
    }
}

extension ArrayConverter: CPPConverter where ElementConverter: CPPConverter {
    public static func fromCPP(_ packer: CPPPacker) throws -> [ElementConverter.SwiftType] {
        let count = packer.take(UInt64.self)
        var ret: [ElementConverter.SwiftType] = []
        for _ in 0..<count {
            ret.append(try ElementConverter.fromCPP(packer))
        }
        return ret
    }
    public static func toCPP(_ packer: CPPPacker, _ val: [ElementConverter.SwiftType]) throws {
        packer.put(UInt64(val.count))
        for ele in val {
            try ElementConverter.toCPP(packer, ele)
        }
    }
}

extension DictionaryConverter: CPPConverter where
    KeyConverter: CPPConverter,
    KeyConverter.SwiftType: Hashable,
    ValueConverter: CPPConverter {
    public static func fromCPP(_ packer: CPPPacker) throws -> [KeyConverter.SwiftType: ValueConverter.SwiftType] {
        let count = packer.take(UInt64.self)
        var ret: [KeyConverter.SwiftType: ValueConverter.SwiftType] = [:]
        for _ in 0..<count {
            let key = KeyConverter.fromCPP(packer)
            let val = ValueConverter.fromCPP(packer)
            ret[key] = val
        }
        return ret
    }
    public static func toCPP(_ packer: CPPPacker, _ dict: [KeyConverter.SwiftType: ValueConverter.SwiftType]) throws {
        packer.put(UInt64(dict.count))
        for pair in dict {
            KeyConverter.toCPP(packer, pair.key)
            ValueConverter.toCPP(packer, pair.value)
        }
    }
}

extension SetConverter: CPPConverter where ElementConverter: CPPConverter, ElementConverter.SwiftType: Hashable {
    public static func fromCPP(_ packer: CPPPacker) throws -> Set<ElementConverter.SwiftType> {
        let count = packer.take(UInt64.self)
        var ret: Set<ElementConverter.SwiftType> = []
        for _ in 0..<count {
            ret.insert(ElementConverter.fromCPP(packer))
        }
        return ret
    }
    public static func toCPP(_ packer: CPPPacker, _ set: Set<ElementConverter.SwiftType>) throws {
        packer.put(UInt64(set.count))
        for val in set {
            ElementConverter.toCPP(packer, val)
        }
    }
}

extension OptionalConverter: CPPConverter where WrappedConverter: CPPConverter {
    public static func fromCPP(_ packer: CPPPacker) throws -> WrappedConverter.SwiftType? {
        if Bool.fromCPP(packer) {
            return WrappedConverter.fromCPP(packer)
        }
        return nil
    }
    public static func toCPP(_ packer: CPPPacker, _ val: WrappedConverter.SwiftType?) throws {
        if let nonNil = val {
            Bool.toCPP(packer, true)
            WrappedConverter.toCPP(packer, nonNil)
        } else {
            Bool.toCPP(packer, false)
        }
    }
}

extension Tuple2Converter: CPPConverter where T0: CPPConverter, T1: CPPConverter {
    public static func fromCPP(_ packer: CPPPacker) throws -> (T0.SwiftType, T1.SwiftType) {
        return (T0.fromCPP(packer), T1.fromCPP(packer))
    }
    public static func toCPP(_ packer: CPPPacker, _ tup: (T0.SwiftType, T1.SwiftType)) throws {
        T0.toCPP(packer, tup.0)
        T1.toCPP(packer, tup.1)
    }
}

extension Tuple3Converter: CPPConverter where T0: CPPConverter, T1: CPPConverter, T2: CPPConverter {
    public static func fromCPP(_ packer: CPPPacker) throws -> (T0.SwiftType, T1.SwiftType, T2.SwiftType) {
        return (T0.fromCPP(packer), T1.fromCPP(packer), T2.fromCPP(packer))
    }
    public static func toCPP(_ packer: CPPPacker, _ tup: (T0.SwiftType, T1.SwiftType, T2.SwiftType)) throws {
        T0.toCPP(packer, tup.0)
        T1.toCPP(packer, tup.1)
        T2.toCPP(packer, tup.2)
    }
}

extension Tuple4Converter: CPPConverter where T0: CPPConverter, T1: CPPConverter, T2: CPPConverter, T3: CPPConverter {
    public static func fromCPP(_ packer: CPPPacker) throws -> (T0.SwiftType, T1.SwiftType, T2.SwiftType, T3.SwiftType) {
        return (T0.fromCPP(packer), T1.fromCPP(packer), T2.fromCPP(packer), T3.fromCPP(packer))
    }
    public static func toCPP(_ packer: CPPPacker, _ tup: (T0.SwiftType, T1.SwiftType, T2.SwiftType, T3.SwiftType)) throws {
        T0.toCPP(packer, tup.0)
        T1.toCPP(packer, tup.1)
        T0.toCPP(packer, tup.2)
        T1.toCPP(packer, tup.3)
    }
}
