import FishyJoesCommonRuntime
import Foundation

// MARK: - Generics Type Conversions
public struct CollectionInfo {
    public typealias LengthMethod = @convention(c) (
        _ context: OpaquePointer,
        _ array: foreignObject,
        _ exn: foreignOutExn
    ) -> Int32
    public typealias ValuesMethod = @convention(c) (
        _ context: OpaquePointer,
        _ array: foreignObject,
        _ outValues: UnsafeMutablePointer<foreignObject>,
        _ exn: foreignOutExn
    ) -> Void
    public typealias Constructor = @convention(c) (
        _ context: OpaquePointer,
        _ inValues: UnsafePointer<foreignObject>?,
        _ length: Int32,
        _ exn: foreignOutExn
    ) -> foreignObject

    var lengthMethod: LengthMethod
    var valuesMethod: ValuesMethod
    var constructor: Constructor
    var context: OpaquePointer

    static let infos = Env.CallbackMap<[ObjectIdentifier: CollectionInfo]>()

    func length(_ object: foreignObject, env: Env) throws -> Int {
        try env.check { exn in Int(lengthMethod(context, object, exn)) }
    }

    func values(_ object: foreignObject, outValues: UnsafeMutablePointer<foreignObject>, env: Env) throws {
        try env.check { exn in valuesMethod(context, object, outValues, exn) }
    }

    func construct(inValues: UnsafePointer<foreignObject>?, length: Int32, env: Env) throws -> foreignObject {
        try env.check { exn in constructor(context, inValues, length, exn) }
    }
}

@_cdecl("FishyJoesRuntime_collection_setup")
public func collectionSetup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    lengthMethod: @escaping CollectionInfo.LengthMethod,
    valuesMethod: @escaping CollectionInfo.ValuesMethod,
    constructor: @escaping CollectionInfo.Constructor,
    context: OpaquePointer,
    exn: foreignOutExn
) {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    let env = Env(envRef)
    guard let typeID = Env.typeID(name: name),
          let identifier = Env.objectID(typeID: typeID)
    else {
        fatalError("unregistered typeID \(name)")
    }
    CollectionInfo.infos[env, default: [:]][identifier] = CollectionInfo(
        lengthMethod: lengthMethod,
        valuesMethod: valuesMethod,
        constructor: constructor,
        context: context
    )
}

extension ArrayConverter: IotaConverter where ElementConverter: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = CollectionInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let length = try info.length(value, env: env)
        let buffer = UnsafeMutablePointer<foreignObject>.allocate(capacity: length)
        defer { buffer.deallocate() }
        try info.values(value, outValues: buffer, env: env)
        defer {
            for index in 0..<length {
                env.deleteRef(buffer[index])
            }
        }

        var result = SwiftType()
        result.reserveCapacity(length)
        for index in 0..<length {
            result.append(try ElementConverter.peekIota(object: buffer[index], env: env))
        }
        return result
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = CollectionInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        var iotaObjects: [foreignObject] = []
        iotaObjects.reserveCapacity(value.count)
        defer { iotaObjects.forEach(env.deleteRef) }

        for element in value {
            try iotaObjects.append(ElementConverter.toIotaObject(element, env: env))
        }

        return try iotaObjects.withUnsafeBufferPointer { buffer in
            try info.construct(inValues: buffer.baseAddress, length: Int32(value.count), env: env)
        }
    }
}

extension DictionaryConverter: IotaConverter where KeyConverter: IotaConverter, KeyConverter.SwiftType: Hashable, ValueConverter: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = CollectionInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let length = try info.length(value, env: env)
        let buffer = UnsafeMutablePointer<foreignObject>.allocate(capacity: 2 * length)
        defer { buffer.deallocate() }
        try info.values(value, outValues: buffer, env: env)
        defer {
            for index in 0..<2 * length {
                env.deleteRef(buffer[index])
            }
        }

        var result = SwiftType()
        for index in 0..<length {
            let key = try KeyConverter.peekIota(object: buffer[2 * index], env: env)
            let value = try ValueConverter.peekIota(object: buffer[2 * index + 1], env: env)
            result[key] = value
        }
        return result
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = CollectionInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        var iotaObjects: [foreignObject] = []
        iotaObjects.reserveCapacity(value.count * 2)
        defer { iotaObjects.forEach(env.deleteRef) }

        for (key, value) in value {
            try iotaObjects.append(KeyConverter.toIotaObject(key, env: env))
            try iotaObjects.append(ValueConverter.toIotaObject(value, env: env))
        }

        return try iotaObjects.withUnsafeBufferPointer { buffer in
            try info.construct(inValues: buffer.baseAddress, length: Int32(value.count), env: env)
        }
    }
}

extension SetConverter: IotaConverter where ElementConverter: IotaConverter, ElementConverter.SwiftType: Hashable {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = CollectionInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let length = try info.length(value, env: env)
        let buffer = UnsafeMutablePointer<foreignObject>.allocate(capacity: length)
        defer { buffer.deallocate() }
        try info.values(value, outValues: buffer, env: env)
        defer {
            for index in 0..<length {
                env.deleteRef(buffer[index])
            }
        }

        var result = SwiftType()
        for index in 0..<length {
            result.insert(try ElementConverter.peekIota(object: buffer[index], env: env))
        }
        return result
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = CollectionInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        var iotaObjects: [foreignObject] = []
        iotaObjects.reserveCapacity(value.count)
        defer { iotaObjects.forEach(env.deleteRef) }

        for element in value {
            try iotaObjects.append(ElementConverter.toIotaObject(element, env: env))
        }

        return try iotaObjects.withUnsafeBufferPointer { buffer in
            try info.construct(inValues: buffer.baseAddress, length: Int32(value.count), env: env)
        }
    }
}

// MARK: - Optional Type Conversion

extension OptionalConverter: IotaConverter where WrappedConverter: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        if value == nil {
            return nil
        } else {
            return try WrappedConverter.peekIota(object: value, env: env)
        }
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        if let wrapped = value {
            return try WrappedConverter.toIotaObject(wrapped, env: env)
        } else {
            return nil
        }
    }
}
