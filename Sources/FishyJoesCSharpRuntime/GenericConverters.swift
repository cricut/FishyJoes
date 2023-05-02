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

public struct CSharpOpenRange {
    public typealias GetStartMethod = @convention(c) (_ range: csObject, _ exn: csOutExn) -> csObject
    public typealias GetEndExclusiveMethod = @convention(c) (_ range: csObject, _ exn: csOutExn) -> csObject
    public typealias Constructor = @convention(c) (_ start: csObject, _ end: csObject, _ exn: csOutExn) -> csObject

    fileprivate static var interfaces: [ObjectIdentifier: CSharpOpenRange] = [:]

    fileprivate var getStartMethod: GetStartMethod?
    fileprivate var getEndExclusiveMethod: GetEndExclusiveMethod?
    fileprivate var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_RangeConverter_setup")
public func RangeConverter_cSharp_setup(
    name: UnsafePointer<unichar>,
    getStartMethod: @escaping CSharpOpenRange.GetStartMethod,
    getEndExclusiveMethod: @escaping CSharpOpenRange.GetEndExclusiveMethod,
    constructor: @escaping CSharpOpenRange.Constructor
) {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeIDsByName[name],
          let identifier = Env.typeIDsByID[typeID]
    else {
        fatalError("unregistered typeID \(name)")
    }
    CSharpOpenRange.interfaces[identifier] = CSharpOpenRange(
        getStartMethod: getStartMethod,
        getEndExclusiveMethod: getEndExclusiveMethod,
        constructor: constructor
    )
}

extension RangeConverter: CSharpConverter where BoundConverter: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        guard let interface = CSharpOpenRange.interfaces[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let start = try Env.check { exn in try Env.unwrap(interface.getStartMethod)(value, exn) }
        let lowerBound = try Env.unwrap(BoundConverter.consumeCSharp(object: start))

        let endExclusive = try Env.check { exn in try Env.unwrap(interface.getEndExclusiveMethod)(value, exn) }
        let upperBound = try Env.unwrap(BoundConverter.consumeCSharp(object: endExclusive))

        return lowerBound..<upperBound
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let interface = CSharpOpenRange.interfaces[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let start = try BoundConverter.toCSharpObject(value.lowerBound)
        defer { Env.deleteRef(start) }
        let endExclusive = try BoundConverter.toCSharpObject(value.upperBound)
        defer { Env.deleteRef(endExclusive) }

        let openRange = try Env.check { exn in try Env.unwrap(interface.constructor)(start, endExclusive, exn) }
        return openRange
    }
}

public struct CSharpClosedRange {
    public typealias GetStartMethod = @convention(c) (_ range: csObject, _ exn: csOutExn) -> csObject
    public typealias GetEndInclusiveMethod = @convention(c) (_ range: csObject, _ exn: csOutExn) -> csObject
    public typealias Constructor = @convention(c) (_ start: csObject, _ end: csObject, _ exn: csOutExn) -> csObject

    fileprivate static var interfaces: [ObjectIdentifier: CSharpClosedRange] = [:]

    fileprivate var getStartMethod: GetStartMethod?
    fileprivate var getEndInclusiveMethod: GetEndInclusiveMethod?
    fileprivate var constructor: Constructor?
}

@_cdecl("FishyJoesRuntime_ClosedRangeConverter_setup")
public func ClosedRangeConverter_cSharp_setup(
    name: UnsafePointer<unichar>,
    getStartMethod: @escaping CSharpClosedRange.GetStartMethod,
    getEndInclusiveMethod: @escaping CSharpClosedRange.GetEndInclusiveMethod,
    constructor: @escaping CSharpClosedRange.Constructor
) {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeIDsByName[name],
          let identifier = Env.typeIDsByID[typeID]
    else {
        fatalError("unregistered typeID \(name)")
    }
    CSharpClosedRange.interfaces[identifier] = CSharpClosedRange(
        getStartMethod: getStartMethod,
        getEndInclusiveMethod: getEndInclusiveMethod,
        constructor: constructor
    )
}

extension ClosedRangeConverter: CSharpConverter where BoundConverter: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        guard let interface = CSharpClosedRange.interfaces[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let start = try Env.check { exn in try Env.unwrap(interface.getStartMethod)(value, exn) }
        let lowerBound = try Env.unwrap(BoundConverter.consumeCSharp(object: start))

        let endInclusive = try Env.check { exn in try Env.unwrap(interface.getEndInclusiveMethod)(value, exn) }
        let upperBound = try Env.unwrap(BoundConverter.consumeCSharp(object: endInclusive))

        return lowerBound...upperBound
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let interface = CSharpClosedRange.interfaces[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let start = try BoundConverter.toCSharpObject(value.lowerBound)
        defer { Env.deleteRef(start) }
        let endInclusive = try BoundConverter.toCSharpObject(value.upperBound)
        defer { Env.deleteRef(endInclusive) }

        let closedRange = try Env.check { exn in try Env.unwrap(interface.constructor)(start, endInclusive, exn) }
        return closedRange
    }
}
