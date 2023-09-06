import FishyJoesCommonRuntime
import Foundation

public struct TupleInfo {
    public typealias GetMethod = @convention(c) (_ context: OpaquePointer, _ tuple: foreignObject, _ exn: foreignOutExn) -> foreignObject
    public typealias Constructor = @convention(c) (_ context: OpaquePointer, _ values: UnsafePointer<foreignObject>, _ exn: foreignOutExn) -> foreignObject

    let getMethods: [GetMethod]
    let constructor: Constructor
    let context: OpaquePointer

    static var infos = Env.CallbackMap<[ObjectIdentifier: TupleInfo]>()

    func `get`(_ tuple: foreignObject, _ index: Int, env: Env) throws -> foreignObject {
        try env.check { exn in getMethods[index](context, tuple, exn) }
    }

    func construct(_ values: [foreignObject], env: Env) throws -> foreignObject {
        try env.check { exn in constructor(context, values, exn) }
    }
}

@_cdecl("FishyJoesRuntime_TupleConverter_setup")
public func tuple_iota_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    get0Method: TupleInfo.GetMethod?,
    get1Method: TupleInfo.GetMethod?,
    get2Method: TupleInfo.GetMethod?,
    get3Method: TupleInfo.GetMethod?,
    get4Method: TupleInfo.GetMethod?,
    get5Method: TupleInfo.GetMethod?,
    constructor: @escaping TupleInfo.Constructor,
    context: OpaquePointer
) {
    let env = Env(envRef)
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeID(name: name),
          let identifier = Env.objectID(typeID: typeID)
    else {
        fatalError("unregistered typeID \(name)")
    }
    TupleInfo.infos[env, default: [:]][identifier] = TupleInfo(
        getMethods: [
            get0Method,
            get1Method,
            get2Method,
            get3Method,
            get4Method,
            get5Method,
        ].compactMap { $0 },
        constructor: constructor,
        context: context
    )
}

extension Tuple2Converter: IotaConverter where T0: IotaConverter, T1: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeIota(object: info.get(value, 0, env: env), env: env),
            T1.consumeIota(object: info.get(value, 1, env: env), env: env)
        )
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toIotaObject(value.0, env: env)
        defer { env.deleteRef(v0) }
        let v1 = try T1.toIotaObject(value.1, env: env)
        defer { env.deleteRef(v1) }
        return try info.construct([v0, v1], env: env)
    }
}

extension Tuple3Converter: IotaConverter where T0: IotaConverter, T1: IotaConverter, T2: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeIota(object: info.get(value, 0, env: env), env: env),
            T1.consumeIota(object: info.get(value, 1, env: env), env: env),
            T2.consumeIota(object: info.get(value, 2, env: env), env: env)
        )
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toIotaObject(value.0, env: env)
        defer { env.deleteRef(v0) }
        let v1 = try T1.toIotaObject(value.1, env: env)
        defer { env.deleteRef(v1) }
        let v2 = try T2.toIotaObject(value.2, env: env)
        defer { env.deleteRef(v2) }
        return try info.construct([v0, v1, v2], env: env)
    }
}

extension Tuple4Converter: IotaConverter where T0: IotaConverter, T1: IotaConverter, T2: IotaConverter, T3: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeIota(object: info.get(value, 0, env: env), env: env),
            T1.consumeIota(object: info.get(value, 1, env: env), env: env),
            T2.consumeIota(object: info.get(value, 2, env: env), env: env),
            T3.consumeIota(object: info.get(value, 3, env: env), env: env)
        )
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toIotaObject(value.0, env: env)
        defer { env.deleteRef(v0) }
        let v1 = try T1.toIotaObject(value.1, env: env)
        defer { env.deleteRef(v1) }
        let v2 = try T2.toIotaObject(value.2, env: env)
        defer { env.deleteRef(v2) }
        let v3 = try T3.toIotaObject(value.3, env: env)
        defer { env.deleteRef(v3) }
        return try info.construct([v0, v1, v2, v3], env: env)
    }
}

extension Tuple5Converter: IotaConverter where T0: IotaConverter, T1: IotaConverter, T2: IotaConverter, T3: IotaConverter, T4: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeIota(object: info.get(value, 0, env: env), env: env),
            T1.consumeIota(object: info.get(value, 1, env: env), env: env),
            T2.consumeIota(object: info.get(value, 2, env: env), env: env),
            T3.consumeIota(object: info.get(value, 3, env: env), env: env),
            T4.consumeIota(object: info.get(value, 4, env: env), env: env)
        )
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toIotaObject(value.0, env: env)
        defer { env.deleteRef(v0) }
        let v1 = try T1.toIotaObject(value.1, env: env)
        defer { env.deleteRef(v1) }
        let v2 = try T2.toIotaObject(value.2, env: env)
        defer { env.deleteRef(v2) }
        let v3 = try T3.toIotaObject(value.3, env: env)
        defer { env.deleteRef(v3) }
        let v4 = try T4.toIotaObject(value.4, env: env)
        defer { env.deleteRef(v4) }
        return try info.construct([v0, v1, v2, v3, v4], env: env)
    }
}

extension Tuple6Converter: IotaConverter where T0: IotaConverter, T1: IotaConverter, T2: IotaConverter, T3: IotaConverter, T4: IotaConverter, T5: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeIota(object: info.get(value, 0, env: env), env: env),
            T1.consumeIota(object: info.get(value, 1, env: env), env: env),
            T2.consumeIota(object: info.get(value, 2, env: env), env: env),
            T3.consumeIota(object: info.get(value, 3, env: env), env: env),
            T4.consumeIota(object: info.get(value, 4, env: env), env: env),
            T5.consumeIota(object: info.get(value, 5, env: env), env: env)
        )
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toIotaObject(value.0, env: env)
        defer { env.deleteRef(v0) }
        let v1 = try T1.toIotaObject(value.1, env: env)
        defer { env.deleteRef(v1) }
        let v2 = try T2.toIotaObject(value.2, env: env)
        defer { env.deleteRef(v2) }
        let v3 = try T3.toIotaObject(value.3, env: env)
        defer { env.deleteRef(v3) }
        let v4 = try T4.toIotaObject(value.4, env: env)
        defer { env.deleteRef(v4) }
        let v5 = try T5.toIotaObject(value.5, env: env)
        defer { env.deleteRef(v5) }
        return try info.construct([v0, v1, v2, v3, v4, v5], env: env)
    }
}
