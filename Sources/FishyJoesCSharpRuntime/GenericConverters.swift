import FishyJoesCommonRuntime
import Foundation

// MARK: - Generics Type Conversions
public struct CollectionInfo {
    public typealias LengthMethod = @convention(c) (_ array: csObject, _ exn: csOutExn) -> Int32
    public typealias ValuesMethod = @convention(c) (_ array: csObject, _ outValues: UnsafeMutablePointer<csObject>, _ exn: csOutExn) -> Void
    public typealias Constuctor = @convention(c) (
        _ inValues: UnsafePointer<csObject>?,
        _ length: Int32,
        _ exn: csOutExn
    ) -> csObject

    var lengthMethod: LengthMethod
    var valuesMethod: ValuesMethod
    var constuctor: Constuctor

    static var infos: [ObjectIdentifier: CollectionInfo] = [:]
}

@_cdecl("FishyJoesRuntime_collection_setup")
public func collectionSetup(
    name: UnsafePointer<unichar>,
    lengthMethod: @escaping CollectionInfo.LengthMethod,
    valuesMethod: @escaping CollectionInfo.ValuesMethod,
    constructor: @escaping CollectionInfo.Constuctor
) {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeIDsByName[name],
          let identifier = Env.typeIDsByID[typeID]
    else {
        fatalError("unregistered typeID \(name)")
    }
    CollectionInfo.infos[identifier] = CollectionInfo(
        lengthMethod: lengthMethod,
        valuesMethod: valuesMethod,
        constuctor: constructor
    )
}

extension ArrayConverter: CSharpConverter where ElementConverter: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let length = try Env.check { exn in Int(info.lengthMethod(value, exn)) }
        let buffer = UnsafeMutablePointer<csObject>.allocate(capacity: length)
        defer { buffer.deallocate() }
        try Env.check { exn in info.valuesMethod(value, buffer, exn) }
        defer {
            for index in 0..<length {
                Env.deleteRef(buffer[index])
            }
        }

        var result = SwiftType()
        result.reserveCapacity(length)
        for index in 0..<length {
            result.append(try ElementConverter.peekCSharp(object: buffer[index]))
        }
        return result
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        var cSharpObjects: [csObject] = []
        cSharpObjects.reserveCapacity(value.count)
        defer { cSharpObjects.forEach(Env.deleteRef) }

        for element in value {
            try cSharpObjects.append(ElementConverter.toCSharpObject(element))
        }

        return try cSharpObjects.withUnsafeBufferPointer { buffer in
            try Env.check { exn in info.constuctor(buffer.baseAddress, Int32(value.count), exn) }
        }
    }
}

extension DictionaryConverter: CSharpConverter where KeyConverter: CSharpConverter, KeyConverter.SwiftType: Hashable, ValueConverter: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let length = try Env.check { exn in Int(info.lengthMethod(value, exn)) }
        let buffer = UnsafeMutablePointer<csObject>.allocate(capacity: 2 * length)
        defer { buffer.deallocate() }
        try Env.check { exn in info.valuesMethod(value, buffer, exn) }
        defer {
            for index in 0..<2 * length {
                Env.deleteRef(buffer[index])
            }
        }

        var result = SwiftType()
        for index in 0..<length {
            let key = try KeyConverter.peekCSharp(object: buffer[2 * index])
            let value = try ValueConverter.peekCSharp(object: buffer[2 * index + 1])
            result[key] = value
        }
        return result
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        var cSharpObjects: [csObject] = []
        cSharpObjects.reserveCapacity(value.count * 2)
        defer { cSharpObjects.forEach(Env.deleteRef) }

        for (key, value) in value {
            try cSharpObjects.append(KeyConverter.toCSharpObject(key))
            try cSharpObjects.append(ValueConverter.toCSharpObject(value))
        }

        return try cSharpObjects.withUnsafeBufferPointer { buffer in
            try Env.check { exn in info.constuctor(buffer.baseAddress, Int32(value.count), exn) }
        }
    }
}

extension SetConverter: CSharpConverter where ElementConverter: CSharpConverter, ElementConverter.SwiftType: Hashable {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let length = try Env.check { exn in Int(info.lengthMethod(value, exn)) }
        let buffer = UnsafeMutablePointer<csObject>.allocate(capacity: length)
        defer { buffer.deallocate() }
        try Env.check { exn in info.valuesMethod(value, buffer, exn) }
        defer {
            for index in 0..<length {
                Env.deleteRef(buffer[index])
            }
        }

        var result = SwiftType()
        for index in 0..<length {
            result.insert(try ElementConverter.peekCSharp(object: buffer[index]))
        }
        return result
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        var cSharpObjects: [csObject] = []
        cSharpObjects.reserveCapacity(value.count)
        defer { cSharpObjects.forEach(Env.deleteRef) }

        for element in value {
            try cSharpObjects.append(ElementConverter.toCSharpObject(element))
        }

        return try cSharpObjects.withUnsafeBufferPointer { buffer in
            try Env.check { exn in info.constuctor(buffer.baseAddress, Int32(value.count), exn) }
        }
    }
}

// MARK: - Optional Type Conversion

extension OptionalConverter: CSharpConverter where WrappedConverter: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        if value == nil {
            return nil
        } else {
            return try WrappedConverter.peekCSharp(object: value)
        }
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        if let wrapped = value {
            return try WrappedConverter.toCSharpObject(wrapped)
        } else {
            return nil
        }
    }
}

// MARK: - Range Type Conversion

public struct CSharpSwiftRange {
    public typealias GetLowerBoundMethod = @convention(c) (_ range: csObject, _ exn: csOutExn) -> csObject
    public typealias GetUpperBoundMethod = @convention(c) (_ range: csObject, _ exn: csOutExn) -> csObject
    public typealias Constructor = @convention(c) (_ start: csObject, _ end: csObject, _ exn: csOutExn) -> csObject

    static var interfaces: [ObjectIdentifier: CSharpSwiftRange] = [:]

    var getLowerBoundMethod: GetLowerBoundMethod?
    var getUpperBoundMethod: GetUpperBoundMethod?
    var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_RangeConverter_setup")
public func RangeConverter_cSharp_setup(
    name: UnsafePointer<unichar>,
    getLowerBoundMethod: @escaping CSharpSwiftRange.GetLowerBoundMethod,
    getUpperBoundMethod: @escaping CSharpSwiftRange.GetUpperBoundMethod,
    constructor: @escaping CSharpSwiftRange.Constructor
) {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeIDsByName[name],
          let identifier = Env.typeIDsByID[typeID]
    else {
        fatalError("unregistered typeID \(name)")
    }
    CSharpSwiftRange.interfaces[identifier] = CSharpSwiftRange(
        getLowerBoundMethod: getLowerBoundMethod,
        getUpperBoundMethod: getUpperBoundMethod,
        constructor: constructor
    )
}

extension RangeConverter: CSharpConverter where BoundConverter: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        guard let interface = CSharpSwiftRange.interfaces[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let lowerBound = try Env.unwrap(BoundConverter.consumeCSharp(object: try Env.check { exn in try Env.unwrap(interface.getLowerBoundMethod)(value, exn) }))
        let upperBound = try Env.unwrap(BoundConverter.consumeCSharp(object: try Env.check { exn in try Env.unwrap(interface.getUpperBoundMethod)(value, exn) }))

        return lowerBound..<upperBound
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let interface = CSharpSwiftRange.interfaces[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let lowerBound = try BoundConverter.toCSharpObject(value.lowerBound)
        defer { Env.deleteRef(lowerBound) }
        let upperBound = try BoundConverter.toCSharpObject(value.upperBound)
        defer { Env.deleteRef(upperBound) }

        let range = try Env.check { exn in try Env.unwrap(interface.constructor)(lowerBound, upperBound, exn) }
        return range
    }
}

public struct CSharpSwiftClosedRange {
    public typealias GetLowerBoundMethod = @convention(c) (_ range: csObject, _ exn: csOutExn) -> csObject
    public typealias GetUpperBoundMethod = @convention(c) (_ range: csObject, _ exn: csOutExn) -> csObject
    public typealias Constructor = @convention(c) (_ start: csObject, _ end: csObject, _ exn: csOutExn) -> csObject

    static var interfaces: [ObjectIdentifier: CSharpSwiftClosedRange] = [:]

    var getLowerBoundMethod: GetLowerBoundMethod?
    var getUpperBoundMethod: GetUpperBoundMethod?
    var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_ClosedRangeConverter_setup")
public func ClosedRangeConverter_cSharp_setup(
    name: UnsafePointer<unichar>,
    getLowerBoundMethod: @escaping CSharpSwiftClosedRange.GetLowerBoundMethod,
    getUpperBoundMethod: @escaping CSharpSwiftClosedRange.GetUpperBoundMethod,
    constructor: @escaping CSharpSwiftClosedRange.Constructor
) {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeIDsByName[name],
          let identifier = Env.typeIDsByID[typeID]
    else {
        fatalError("unregistered typeID \(name)")
    }
    CSharpSwiftClosedRange.interfaces[identifier] = CSharpSwiftClosedRange(
        getLowerBoundMethod: getLowerBoundMethod,
        getUpperBoundMethod: getUpperBoundMethod,
        constructor: constructor
    )
}

extension ClosedRangeConverter: CSharpConverter where BoundConverter: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        guard let interface = CSharpSwiftClosedRange.interfaces[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let lowerBound = try Env.unwrap(BoundConverter.consumeCSharp(object: try Env.check { exn in try Env.unwrap(interface.getLowerBoundMethod)(value, exn) }))
        let upperBound = try Env.unwrap(BoundConverter.consumeCSharp(object: try Env.check { exn in try Env.unwrap(interface.getUpperBoundMethod)(value, exn) }))

        return lowerBound...upperBound
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let interface = CSharpSwiftClosedRange.interfaces[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let lowerBound = try BoundConverter.toCSharpObject(value.lowerBound)
        defer { Env.deleteRef(lowerBound) }
        let upperBound = try BoundConverter.toCSharpObject(value.upperBound)
        defer { Env.deleteRef(upperBound) }

        let closedRange = try Env.check { exn in try Env.unwrap(interface.constructor)(lowerBound, upperBound, exn) }
        return closedRange
    }
}
