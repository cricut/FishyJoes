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

extension ArrayConverter: IotaConverter where ElementConverter: IotaConverter {
    public static func peekIota(_ value: csObject) throws -> SwiftType {
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
            result.append(try ElementConverter.peekIota(object: buffer[index]))
        }
        return result
    }

    public static func toIota(_ value: SwiftType) throws -> csObject {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        var iotaObjects: [csObject] = []
        iotaObjects.reserveCapacity(value.count)
        defer { iotaObjects.forEach(Env.deleteRef) }

        for element in value {
            try iotaObjects.append(ElementConverter.toIotaObject(element))
        }

        return try iotaObjects.withUnsafeBufferPointer { buffer in
            try Env.check { exn in info.constuctor(buffer.baseAddress, Int32(value.count), exn) }
        }
    }
}

extension DictionaryConverter: IotaConverter where KeyConverter: IotaConverter, KeyConverter.SwiftType: Hashable, ValueConverter: IotaConverter {
    public static func peekIota(_ value: csObject) throws -> SwiftType {
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
            let key = try KeyConverter.peekIota(object: buffer[2 * index])
            let value = try ValueConverter.peekIota(object: buffer[2 * index + 1])
            result[key] = value
        }
        return result
    }

    public static func toIota(_ value: SwiftType) throws -> csObject {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        var iotaObjects: [csObject] = []
        iotaObjects.reserveCapacity(value.count * 2)
        defer { iotaObjects.forEach(Env.deleteRef) }

        for (key, value) in value {
            try iotaObjects.append(KeyConverter.toIotaObject(key))
            try iotaObjects.append(ValueConverter.toIotaObject(value))
        }

        return try iotaObjects.withUnsafeBufferPointer { buffer in
            try Env.check { exn in info.constuctor(buffer.baseAddress, Int32(value.count), exn) }
        }
    }
}

extension SetConverter: IotaConverter where ElementConverter: IotaConverter, ElementConverter.SwiftType: Hashable {
    public static func peekIota(_ value: csObject) throws -> SwiftType {
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
            result.insert(try ElementConverter.peekIota(object: buffer[index]))
        }
        return result
    }

    public static func toIota(_ value: SwiftType) throws -> csObject {
        guard let info = CollectionInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        var iotaObjects: [csObject] = []
        iotaObjects.reserveCapacity(value.count)
        defer { iotaObjects.forEach(Env.deleteRef) }

        for element in value {
            try iotaObjects.append(ElementConverter.toIotaObject(element))
        }

        return try iotaObjects.withUnsafeBufferPointer { buffer in
            try Env.check { exn in info.constuctor(buffer.baseAddress, Int32(value.count), exn) }
        }
    }
}

// MARK: - Optional Type Conversion

extension OptionalConverter: IotaConverter where WrappedConverter: IotaConverter {
    public static func peekIota(_ value: csObject) throws -> SwiftType {
        if value == nil {
            return nil
        } else {
            return try WrappedConverter.peekIota(object: value)
        }
    }

    public static func toIota(_ value: SwiftType) throws -> csObject {
        if let wrapped = value {
            return try WrappedConverter.toIotaObject(wrapped)
        } else {
            return nil
        }
    }
}
