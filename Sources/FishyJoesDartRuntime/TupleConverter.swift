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
public func tuple_dart_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    get0Method: @escaping TupleInfo.GetMethod,
    get1Method: @escaping TupleInfo.GetMethod,
    get2Method: @escaping TupleInfo.GetMethod,
    get3Method: @escaping TupleInfo.GetMethod,
    get4Method: @escaping TupleInfo.GetMethod,
    get5Method: @escaping TupleInfo.GetMethod,
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
        ],
        constructor: constructor,
        context: context
    )
}

extension Tuple2Converter: DartConverter where T0: DartConverter, T1: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeDart(object: info.get(value, 0, env: env), env: env),
            T1.consumeDart(object: info.get(value, 1, env: env), env: env)
        )
    }

    public static func toDart(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toDartObject(value.0, env: env)
        defer { env.deleteRef(v0) }
        let v1 = try T1.toDartObject(value.1, env: env)
        defer { env.deleteRef(v1) }
        return try info.construct([v0, v1], env: env)
    }
}

extension Tuple3Converter: DartConverter where T0: DartConverter, T1: DartConverter, T2: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeDart(object: info.get(value, 0, env: env), env: env),
            T1.consumeDart(object: info.get(value, 1, env: env), env: env),
            T2.consumeDart(object: info.get(value, 2, env: env), env: env)
        )
    }

    public static func toDart(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toDartObject(value.0, env: env)
        defer { env.deleteRef(v0) }
        let v1 = try T1.toDartObject(value.1, env: env)
        defer { env.deleteRef(v1) }
        let v2 = try T2.toDartObject(value.2, env: env)
        defer { env.deleteRef(v2) }
        return try info.construct([v0, v1, v2], env: env)
    }
}

extension Tuple4Converter: DartConverter where T0: DartConverter, T1: DartConverter, T2: DartConverter, T3: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeDart(object: info.get(value, 0, env: env), env: env),
            T1.consumeDart(object: info.get(value, 1, env: env), env: env),
            T2.consumeDart(object: info.get(value, 2, env: env), env: env),
            T3.consumeDart(object: info.get(value, 3, env: env), env: env)
        )
    }

    public static func toDart(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toDartObject(value.0, env: env)
        defer { env.deleteRef(v0) }
        let v1 = try T1.toDartObject(value.1, env: env)
        defer { env.deleteRef(v1) }
        let v2 = try T2.toDartObject(value.2, env: env)
        defer { env.deleteRef(v2) }
        let v3 = try T3.toDartObject(value.3, env: env)
        defer { env.deleteRef(v3) }
        return try info.construct([v0, v1, v2, v3], env: env)
    }
}

extension Tuple5Converter: DartConverter where T0: DartConverter, T1: DartConverter, T2: DartConverter, T3: DartConverter, T4: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeDart(object: info.get(value, 0, env: env), env: env),
            T1.consumeDart(object: info.get(value, 1, env: env), env: env),
            T2.consumeDart(object: info.get(value, 2, env: env), env: env),
            T3.consumeDart(object: info.get(value, 3, env: env), env: env),
            T4.consumeDart(object: info.get(value, 4, env: env), env: env)
        )
    }

    public static func toDart(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toDartObject(value.0, env: env)
        defer { env.deleteRef(v0) }
        let v1 = try T1.toDartObject(value.1, env: env)
        defer { env.deleteRef(v1) }
        let v2 = try T2.toDartObject(value.2, env: env)
        defer { env.deleteRef(v2) }
        let v3 = try T3.toDartObject(value.3, env: env)
        defer { env.deleteRef(v3) }
        let v4 = try T4.toDartObject(value.4, env: env)
        defer { env.deleteRef(v4) }
        return try info.construct([v0, v1, v2, v3, v4], env: env)
    }
}

extension Tuple6Converter: DartConverter where T0: DartConverter, T1: DartConverter, T2: DartConverter, T3: DartConverter, T4: DartConverter, T5: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeDart(object: info.get(value, 0, env: env), env: env),
            T1.consumeDart(object: info.get(value, 1, env: env), env: env),
            T2.consumeDart(object: info.get(value, 2, env: env), env: env),
            T3.consumeDart(object: info.get(value, 3, env: env), env: env),
            T4.consumeDart(object: info.get(value, 4, env: env), env: env),
            T5.consumeDart(object: info.get(value, 5, env: env), env: env)
        )
    }

    public static func toDart(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toDartObject(value.0, env: env)
        defer { env.deleteRef(v0) }
        let v1 = try T1.toDartObject(value.1, env: env)
        defer { env.deleteRef(v1) }
        let v2 = try T2.toDartObject(value.2, env: env)
        defer { env.deleteRef(v2) }
        let v3 = try T3.toDartObject(value.3, env: env)
        defer { env.deleteRef(v3) }
        let v4 = try T4.toDartObject(value.4, env: env)
        defer { env.deleteRef(v4) }
        let v5 = try T5.toDartObject(value.5, env: env)
        defer { env.deleteRef(v5) }
        return try info.construct([v0, v1, v2, v3, v4, v5], env: env)
    }
}
