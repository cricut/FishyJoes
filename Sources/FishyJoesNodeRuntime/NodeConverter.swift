import Foundation

// MARK: - NodeJS Type Conversion Protocols

public protocol NodeConverter: Converter {
    static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType
    static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value
    static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws
}

public protocol NodeMutator: NodeConverter {
    static func mutateNode(_ value: SwiftType, this: NAPI.Value, env: NAPI.Env) throws
}

extension NodeConverter {
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
    }
}

// MARK: - Primitive Type Conversions

extension VoidConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws {}
    public static func toNode(_ value: Void, env: NAPI.Env) throws -> NAPI.Value {
        return .init(ptr: nil)
    }
}

extension Bool: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Bool {
        try env.getValueBool(value)
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.getBoolean(value)
    }
}

extension UInt8: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        try UInt8(env.getValueUint32(value))
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createUint32(UInt32(value))
    }
}

extension UInt16: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        try UInt16(env.getValueUint32(value))
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createUint32(UInt32(value))
    }
}

extension UInt32: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        try env.getValueUint32(value)
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createUint32(value)
    }
}

extension UInt64: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        let (result, lossless) = try env.getValueBigintUint64(value)
        if !lossless { throw JSException(message: "bigint outside range of \(Self.self)") }
        return .init(result)
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createBigintUint64(value)
    }
}

extension UInt: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> UInt {
        #if arch(wasm32)
        UInt(try env.getValueUint32(value))
        #else
        guard let result = UInt(exactly: try env.getValueDouble(value)) else {
            throw JSException(message: "number outside range of \(Self.self)")
        }
        return result
        #endif
    }

    public static func toNode(_ value: UInt, env: NAPI.Env) throws -> NAPI.Value {
        #if arch(wasm32)
        try env.createUint32(UInt32(value))
        #else
        try env.createDouble(Double(value))
        #endif
    }
}

extension Int8: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        try Int8(env.getValueInt32(value))
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createInt32(Int32(value))
    }
}

extension Int16: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        try Int16(env.getValueInt32(value))
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createInt32(Int32(value))
    }
}

extension Int32: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        try env.getValueInt32(value)
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createInt32(Int32(value))
    }
}

extension Int64: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        let (result, lossless) = try env.getValueBigintInt64(value)
        if !lossless { throw JSException(message: "bigint outside range of \(Self.self)") }
        return .init(result)
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        try env.createBigintInt64(value)
    }
}

extension Int: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Int {
        #if arch(wasm32)
        return try Int(env.getValueInt32(value))
        #else
        return try Int(env.getValueInt64(value))
        #endif
    }

    public static func toNode(_ value: Int, env: NAPI.Env) throws -> NAPI.Value {
        #if arch(wasm32)
        return try env.createInt32(Int32(value))
        #else
        return try env.createInt64(Int64(value))
        #endif
    }
}

extension Float: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Float {
        try Float(env.getValueDouble(value))
    }

    public static func toNode(_ value: Float, env: NAPI.Env) throws -> NAPI.Value {
        try env.createDouble(Double(value))
    }
}

extension Double: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Double {
        try env.getValueDouble(value)
    }

    public static func toNode(_ value: Double, env: NAPI.Env) throws -> NAPI.Value {
        try env.createDouble(value)
    }
}

// MARK: - String Type Conversion

extension String: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> String {
        try env.getValueStringUtf8(value)!
    }

    public static func toNode(_ value: String, env: NAPI.Env) throws -> NAPI.Value {
        try env.createStringUtf8(value)
    }
}

// MARK: - Data Type Conversion

extension Data: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Data {
        let global = try env.getGlobal()

        // Get the number of bytes in the ArrayBuffer
        let byteLength = try env.getNamedProperty(value, "byteLength")

        // Get a byte-oriented view of the ArrayBuffer with UInt8Array
        let uInt8ArrayConstructor = try env.getNamedProperty(global, "Uint8Array")
        let uInt8View = try env.newInstance(uInt8ArrayConstructor, [value])

        // Create a Data to store the memory from the ArrayBuffer
        let count = try Int.fromNode(byteLength, env: env)
        var data = Data(count: count)

        // Copy the bytes from the UInt8Array to the Data
        for index in 0..<count {
            data[index] = try UInt8.fromNode(try env.getElement(uInt8View, UInt32(index)), env: env)
        }

        return data
    }

    public static func toNode(_ value: Data, env: NAPI.Env) throws -> NAPI.Value {
        let global = try env.getGlobal()

        // Create an ArrayBuffer of the same size as the Data
        let arrayBufferConstructor = try env.getNamedProperty(global, "ArrayBuffer")
        let byteCount = try Int.toNode(value.count, env: env)
        let arrayBuffer = try env.newInstance(arrayBufferConstructor, [byteCount])

        // Get a byte-oriented view of the ArrayBuffer with UInt8Array
        let uInt8ArrayConstructor = try env.getNamedProperty(global, "Uint8Array")
        let uInt8View = try env.newInstance(uInt8ArrayConstructor, [arrayBuffer])

        // Copy the bytes from the Data to the UInt8Array
        for (index, byte) in value.enumerated() {
            try env.setElement(uInt8View, UInt32(index), UInt8.toNode(byte, env: env))
        }

        return arrayBuffer
    }
}

// MARK: - URL Type Conversion

extension URL: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> URL {
        let urlStringObject = try env.getNamedProperty(value, "href")
        let urlString = try env.getValueStringUtf8(urlStringObject) ?? "<null>"
        guard let url = URL(string: urlString) else { throw MalformedURLError(message: "Not a valid URL: \(urlString)") }
        return url
    }

    public static func toNode(_ value: URL, env: NAPI.Env) throws -> NAPI.Value {
        let urlString = value.absoluteString
        let urlStringObject = try env.createStringUtf8(urlString)
        let urlConstructor = try env.getNamedProperty(env.getGlobal(), "URL")
        return try env.newInstance(urlConstructor, [urlStringObject])
    }
}

// MARK: - Generics Type Conversions

extension ArrayConverter: NodeConverter where ElementConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let length = try env.getArrayLength(value)
        return try (0..<length).map { index in
            try ElementConverter.fromNode(env.getElement(value, index), env: env)
        }
    }

    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let array = try env.createArrayWithLength(value.count)
        for (index, value) in value.enumerated() {
            try env.setElement(array, UInt32(index), ElementConverter.toNode(value, env: env))
        }
        return array
    }
}

extension DictionaryConverter: NodeConverter where KeyConverter: NodeConverter, ValueConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let iterator = try env.callFunction(value, env.getNamedProperty(value, "entries"), [])
        let nextFun = try env.getNamedProperty(iterator, "next")
        func next() throws -> NAPI.Value? {
            let result = try env.callFunction(iterator, nextFun, [])
            guard try !env.getValueBool(env.getNamedProperty(result, "done")) else {
                return nil
            }
            return try env.getNamedProperty(result, "value")
        }

        var result: SwiftType = [:]
        while let entry = try next() {
            let key = try KeyConverter.fromNode(env.getElement(entry, 0), env: env)
            let value = try ValueConverter.fromNode(env.getElement(entry, 1), env: env)
            result[key] = value
        }
        return result
    }

    public static func toNode(_ dict: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let global = try env.getGlobal()
        let mapConstructor = try env.getNamedProperty(global, "Map")
        let map = try env.newInstance(mapConstructor, [])
        let mapSet = try env.getNamedProperty(map, "set")

        for (key, value) in dict {
            _ = try env.callFunction(map, mapSet, [KeyConverter.toNode(key, env: env), ValueConverter.toNode(value, env: env)])
        }

        return map
    }
}

extension SetConverter: NodeConverter where ElementConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        throw JSException(message: "TODO: implement Swift.Set.static func fromNode(_:env:)")
    }

    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let global = try env.getGlobal()
        let setConstructor: NAPI.Value = try env.getNamedProperty(global, "Set")

        let array = try env.createArrayWithLength(value.count)

        for (index, element) in value.enumerated() {
            try env.setElement(array, UInt32(index), ElementConverter.toNode(element, env: env))
        }

        return try env.newInstance(setConstructor, [array])
    }
}

// MARK: - Optional Type Conversion

extension OptionalConverter: NodeConverter where WrappedConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        try nodeIsUndefiend(value, env: env) ? nil : WrappedConverter.fromNode(value, env: env)
    }

    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        if let wrapped = value {
            return try WrappedConverter.toNode(wrapped, env: env)
        } else {
            return try env.getUndefined()
        }
    }
}

// MARK: - Range Type Conversion

extension RangeConverter: NodeConverter where BoundConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Range<BoundConverter.SwiftType> {
        let lowerBound = try BoundConverter.fromNode(try env.getNamedProperty(value, "lowerBound"), env: env)
        let upperBound = try BoundConverter.fromNode(try env.getNamedProperty(value, "upperBoundExclusive"), env: env)

        guard lowerBound <= upperBound else { throw InvalidRangeError(message: "\(lowerBound)..<\(upperBound)") }
        return lowerBound..<upperBound
    }

    public static func toNode(_ value: Range<BoundConverter.SwiftType>, env: NAPI.Env) throws -> NAPI.Value {
        let lowerBound = try BoundConverter.toNode(value.lowerBound, env: env)
        let upperBound = try BoundConverter.toNode(value.upperBound, env: env)

        let range = try env.createObject()
        try env.setNamedProperty(range, "lowerBound", lowerBound)
        try env.setNamedProperty(range, "upperBoundExclusive", upperBound)
        return range
    }
}

extension ClosedRangeConverter: NodeConverter where BoundConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> ClosedRange<BoundConverter.SwiftType> {
        let lowerBound = try BoundConverter.fromNode(try env.getNamedProperty(value, "lowerBound"), env: env)
        let upperBound = try BoundConverter.fromNode(try env.getNamedProperty(value, "upperBoundInclusive"), env: env)

        guard lowerBound <= upperBound else { throw InvalidRangeError(message: "\(lowerBound)...\(upperBound)") }
        return lowerBound...upperBound
    }

    public static func toNode(_ value: ClosedRange<BoundConverter.SwiftType>, env: NAPI.Env) throws -> NAPI.Value {
        let lowerBound = try BoundConverter.toNode(value.lowerBound, env: env)
        let upperBound = try BoundConverter.toNode(value.upperBound, env: env)

        let range = try env.createObject()
        try env.setNamedProperty(range, "lowerBound", lowerBound)
        try env.setNamedProperty(range, "upperBoundInclusive", upperBound)
        return range
    }
}
