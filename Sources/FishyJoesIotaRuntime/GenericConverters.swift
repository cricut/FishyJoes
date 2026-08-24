import FishyJoesCommonRuntime
import Foundation

// MARK: - Collection Type Conversions
public struct CollectionInfo {
    public typealias LengthMethod = @convention(c) (
        _ context: OpaquePointer,
        _ array: HostObject,
        _ exn: OutHostException
    ) -> Int32
    public typealias ValuesMethod = @convention(c) (
        _ context: OpaquePointer,
        _ array: HostObject,
        _ outValues: UnsafeMutablePointer<HostObject>,
        _ exn: OutHostException
    ) -> Void
    public typealias Constructor = @convention(c) (
        _ context: OpaquePointer,
        _ inValues: UnsafePointer<HostObject>?,
        _ length: Int32,
        _ exn: OutHostException
    ) -> HostObject

    var lengthMethod: LengthMethod
    var valuesMethod: ValuesMethod
    var constructor: Constructor
    var context: OpaquePointer

    static let infos = Env.CallbackMap<[ObjectIdentifier: CollectionInfo]>()

    func length(_ object: HostObject, env: Env) throws -> Int {
        try env.check { exn in Int(lengthMethod(context, object, exn)) }
    }

    func values(_ object: HostObject, outValues: UnsafeMutablePointer<HostObject>, env: Env) throws {
        try env.check { exn in valuesMethod(context, object, outValues, exn) }
    }

    func construct(inValues: UnsafePointer<HostObject>?, length: Int32, env: Env) throws -> HostObject {
        try env.check { exn in constructor(context, inValues, length, exn) }
    }
}

@_cdecl("FishyJoesCommonRuntime_collection_setup")
public func collectionSetup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    lengthMethod: @escaping CollectionInfo.LengthMethod,
    valuesMethod: @escaping CollectionInfo.ValuesMethod,
    constructor: @escaping CollectionInfo.Constructor,
    context: OpaquePointer,
    exn: OutHostException
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
    public static func peekIota(_ value: HostObject, env: Env) throws -> SwiftType {
        guard let info = CollectionInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let length = try info.length(value, env: env)
        let buffer = UnsafeMutablePointer<HostObject>.allocate(capacity: length)
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

    public static func toIota(_ value: SwiftType, env: Env) throws -> HostObject {
        guard let info = CollectionInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        var iotaObjects: [HostObject] = []
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
    public static func peekIota(_ value: HostObject, env: Env) throws -> SwiftType {
        guard let info = CollectionInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let length = try info.length(value, env: env)
        let buffer = UnsafeMutablePointer<HostObject>.allocate(capacity: 2 * length)
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

    public static func toIota(_ value: SwiftType, env: Env) throws -> HostObject {
        guard let info = CollectionInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        var iotaObjects: [HostObject] = []
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
    public static func peekIota(_ value: HostObject, env: Env) throws -> SwiftType {
        guard let info = CollectionInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let length = try info.length(value, env: env)
        let buffer = UnsafeMutablePointer<HostObject>.allocate(capacity: length)
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

    public static func toIota(_ value: SwiftType, env: Env) throws -> HostObject {
        guard let info = CollectionInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        var iotaObjects: [HostObject] = []
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

// MARK: - Optional Type Conversions

extension OptionalConverter: IotaConverter where WrappedConverter: IotaConverter {
    public static func peekIota(_ value: HostObject, env: Env) throws -> SwiftType {
        if value == nil {
            return nil
        } else {
            return try WrappedConverter.peekIota(object: value, env: env)
        }
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> HostObject {
        if let wrapped = value {
            return try WrappedConverter.toIotaObject(wrapped, env: env)
        } else {
            return nil
        }
    }
}

// MARK: - Range Type Conversions

public struct IotaSwiftRange {
    public typealias GetLowerBoundMethod = @convention(c) (_ context: OpaquePointer, _ range: HostObject, _ exn: OutHostException) -> HostObject
    public typealias GetUpperBoundMethod = @convention(c) (_ context: OpaquePointer, _ range: HostObject, _ exn: OutHostException) -> HostObject
    public typealias Constructor = @convention(c) (_ context: OpaquePointer, _ start: HostObject, _ end: HostObject, _ exn: OutHostException) -> HostObject

    static var interfaces = Env.CallbackMap<[ObjectIdentifier: IotaSwiftRange]>()

    var getLowerBoundMethod: GetLowerBoundMethod
    var getUpperBoundMethod: GetUpperBoundMethod
    var constructor: Constructor
    var context: OpaquePointer

    func lowerBound(_ object: HostObject, env: Env) throws -> HostObject {
        try env.check { exn in getLowerBoundMethod(context, object, exn) }
    }

    func upperBound(_ object: HostObject, env: Env) throws -> HostObject {
        try env.check { exn in getUpperBoundMethod(context, object, exn) }
    }

    func construct(lowerBound: HostObject, upperBound: HostObject, env: Env) throws -> HostObject {
        try env.check { exn in constructor(context, lowerBound, upperBound, exn) }
    }
}

@_cdecl("FishyJoesCommonRuntime_RangeConverter_setup")
public func RangeConverter_iota_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    getLowerBoundMethod: @escaping IotaSwiftRange.GetLowerBoundMethod,
    getUpperBoundMethod: @escaping IotaSwiftRange.GetUpperBoundMethod,
    constructor: @escaping IotaSwiftRange.Constructor,
    context: OpaquePointer
) {
    let env = Env(envRef)
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeID(name: name),
          let identifier = Env.objectID(typeID: typeID)
    else {
        fatalError("unregistered typeID \(name)")
    }
    IotaSwiftRange.interfaces[env, default: [:]][identifier] = IotaSwiftRange(
        getLowerBoundMethod: getLowerBoundMethod,
        getUpperBoundMethod: getUpperBoundMethod,
        constructor: constructor,
        context: context
    )
}

extension RangeConverter: IotaConverter where BoundConverter: IotaConverter {
    public static func peekIota(_ value: HostObject, env: Env) throws -> SwiftType {
        guard let interface = IotaSwiftRange.interfaces[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let lowerBound = try BoundConverter.consumeIota(object: interface.lowerBound(value, env: env), env: env)
        let upperBound = try BoundConverter.consumeIota(object: interface.upperBound(value, env: env), env: env)

        return lowerBound..<upperBound
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> HostObject {
        guard let interface = IotaSwiftRange.interfaces[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let lowerBound = try BoundConverter.toIotaObject(value.lowerBound, env: env)
        defer { env.deleteRef(lowerBound) }
        let upperBound = try BoundConverter.toIotaObject(value.upperBound, env: env)
        defer { env.deleteRef(upperBound) }

        return try interface.construct(lowerBound: lowerBound, upperBound: upperBound, env: env)
    }
}

extension ClosedRangeConverter: IotaConverter where BoundConverter: IotaConverter {
    public static func peekIota(_ value: HostObject, env: Env) throws -> SwiftType {
        guard let interface = IotaSwiftRange.interfaces[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let lowerBound = try BoundConverter.consumeIota(object: interface.lowerBound(value, env: env), env: env)
        let upperBound = try BoundConverter.consumeIota(object: interface.upperBound(value, env: env), env: env)

        return lowerBound...upperBound
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> HostObject {
        guard let interface = IotaSwiftRange.interfaces[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let lowerBound = try BoundConverter.toIotaObject(value.lowerBound, env: env)
        defer { env.deleteRef(lowerBound) }
        let upperBound = try BoundConverter.toIotaObject(value.upperBound, env: env)
        defer { env.deleteRef(upperBound) }

        return try interface.construct(lowerBound: lowerBound, upperBound: upperBound, env: env)
    }
}

// MARK: - Result Type Conversions
public struct IotaResult {
    public typealias GetContentsMethod = @convention(c) (
        _ context: OpaquePointer,
        _ result: HostObject,
        _ outIsSuccess: UnsafeMutablePointer<UInt8>,
        _ exn: OutHostException
    ) -> HostObject
    public typealias Constructor = @convention(c) (
        _ context: OpaquePointer,
        _ isSuccess: UInt8,
        _ contents: HostObject,
        _ exn: OutHostException
    ) -> HostObject

    static var interfaces = Env.CallbackMap<[ObjectIdentifier: IotaResult]>()

    var getContentsMethod: GetContentsMethod
    var constructor: Constructor
    var context: OpaquePointer

    func getContents(_ object: HostObject, env: Env) throws -> (isSuccess: Bool, contents: HostObject) {
        try env.check { exn in
            var isSuccess: UInt8 = 0
            let contents = getContentsMethod(context, object, &isSuccess, exn)
            return (isSuccess != 0, contents)
        }
    }

    func construct(isSuccess: Bool, contents: HostObject, env: Env) throws -> HostObject {
        try env.check { exn in constructor(context, isSuccess ? 1 : 0, contents, exn) }
    }
}

@_cdecl("FishyJoesCommonRuntime_ResultConverter_setup")
public func ResultConverter_iota_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    getContentsMethod: @escaping IotaResult.GetContentsMethod,
    constructor: @escaping IotaResult.Constructor,
    context: OpaquePointer
) {
    let env = Env(envRef)
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeID(name: name),
          let identifier = Env.objectID(typeID: typeID)
    else {
        fatalError("unregistered typeID \(name)")
    }
    IotaResult.interfaces[env, default: [:]][identifier] = IotaResult(
        getContentsMethod: getContentsMethod,
        constructor: constructor,
        context: context
    )
}

extension ResultConverter: IotaConverter where SuccessConverter: IotaConverter, FailureConverter: IotaConverter {
    public static func peekIota(_ value: HostObject, env: Env) throws -> SwiftType {
        guard let interface = IotaResult.interfaces[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        let (isSuccess, contents) = try interface.getContents(value, env: env)
        if isSuccess {
            return try .success(SuccessConverter.consumeIota(object: contents, env: env))
        } else {
            return try .failure(FailureConverter.consumeIota(object: contents, env: env))
        }
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> HostObject {
        guard let interface = IotaResult.interfaces[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }

        switch value {
        case .success(let success):
            let contents = try SuccessConverter.toIotaObject(success, env: env)
            return try interface.construct(isSuccess: true, contents: contents, env: env)
        case .failure(let error):
            let contents = try FailureConverter.toIotaObject(error, env: env)
            return try interface.construct(isSuccess: false, contents: contents, env: env)
        }
    }
}
