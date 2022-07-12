import FishyJoesCommonRuntime
import Foundation

// MARK: - Generics Type Conversions
public struct CollectionInfo {
    public typealias LengthMethod = @convention(c) (_ array: csObject, _ exn: csOutExn) -> Int32
    public typealias ValuesMethod = @convention(c) (_ array: csObject, _ outValues: UnsafeMutableRawPointer, _ exn: csOutExn) -> Void
    public typealias Constuctor = @convention(c) (
        _ inValues: UnsafeRawPointer?,
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
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let length = try Env.check { exn in Int(info.lengthMethod(value, exn)) }
        let buffer = UnsafeMutablePointer<csObject>.allocate(capacity: length)
        defer { buffer.deallocate() }
        try Env.check { exn in info.valuesMethod(value, buffer, exn) }

        var result = SwiftType()
        result.reserveCapacity(length)
        for index in 0..<length {
            // TODO: free things if thrown
            result.append(try ElementConverter.fromCSharp(object: buffer[index], consuming: true))
        }
        return result
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        return try value
            .map(ElementConverter.toCSharpObject)
            .withUnsafeBufferPointer { buffer in
                try Env.check { exn in info.constuctor(buffer.baseAddress, Int32(value.count), exn) }
            }
    }
}

extension DictionaryConverter: CSharpConverter where KeyConverter: CSharpConverter, KeyConverter.SwiftType: Hashable, ValueConverter: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let length = try Env.check { exn in Int(info.lengthMethod(value, exn)) }
        let buffer = UnsafeMutablePointer<csObject>.allocate(capacity: 2 * length)
        defer { buffer.deallocate() }
        try Env.check { exn in info.valuesMethod(value, buffer, exn) }

        var result = SwiftType()
        for index in 0..<length {
            // TODO: free things if thrown
            let key = try KeyConverter.fromCSharp(object: buffer[2 * index], consuming: true)
            let value = try ValueConverter.fromCSharp(object: buffer[2 * index + 1], consuming: true)
            result[key] = value
        }
        return result
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        return try value
            .flatMap { try [KeyConverter.toCSharpObject($0.key), ValueConverter.toCSharpObject($0.value)] }
            .withUnsafeBufferPointer { buffer in
                try Env.check { exn in info.constuctor(buffer.baseAddress, Int32(value.count), exn) }
            }
    }
}

extension SetConverter: CSharpConverter where ElementConverter: CSharpConverter, ElementConverter.SwiftType: Hashable {
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let length = try Env.check { exn in Int(info.lengthMethod(value, exn)) }
        let buffer = UnsafeMutablePointer<csObject>.allocate(capacity: length)
        defer { buffer.deallocate() }
        try Env.check { exn in info.valuesMethod(value, buffer, exn) }

        var result = SwiftType()
        for index in 0..<length {
            // TODO: free things if thrown
            result.insert(try ElementConverter.fromCSharp(object: buffer[index], consuming: true))
        }
        return result
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        return try value
            .map(ElementConverter.toCSharpObject)
            .withUnsafeBufferPointer { buffer in
                try Env.check { exn in info.constuctor(buffer.baseAddress, Int32(value.count), exn) }
            }
    }
}

// MARK: - Optional Type Conversion

extension OptionalConverter: CSharpConverter where WrappedConverter: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        if value == nil {
            return nil
        } else {
            return try WrappedConverter.fromCSharp(object: value)
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
