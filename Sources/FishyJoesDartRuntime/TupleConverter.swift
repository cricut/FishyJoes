import FishyJoesCommonRuntime
import Foundation

public struct TupleInfo {
    public typealias GetMethod = @convention(c) (_ tuple: foreignObject, _ exn: foreignOutExn) -> foreignObject
    public typealias Constructor = @convention(c) (_ values: UnsafePointer<foreignObject>, _ exn: foreignOutExn) -> foreignObject

    let getMethods: [GetMethod]
    let constructor: Constructor

    static var infos: Env.SynchronizedDictionary<ObjectIdentifier, Env.CallbackMap<TupleInfo>> = [:]
}

@_cdecl("FishyJoesRuntime_Tuple2Converter_setup")
public func tuple2_dart_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    get0Method: @escaping TupleInfo.GetMethod,
    get1Method: @escaping TupleInfo.GetMethod,
    constructor: @escaping TupleInfo.Constructor
) {
    let env = Env(envRef)
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeID(name: name),
          let identifier = Env.objectID(typeID: typeID)
    else {
        fatalError("unregistered typeID \(name)")
    }
    TupleInfo.infos[identifier, default: Env.CallbackMap()][env] = TupleInfo(
        getMethods: [
            get0Method,
            get1Method,
        ],
        constructor: constructor
    )
}

extension Tuple2Converter: DartConverter where T0: DartConverter, T1: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)]?[env] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeDart(object: env.check { exn in info.getMethods[0](value, exn) }, env: env),
            T1.consumeDart(object: env.check { exn in info.getMethods[1](value, exn) }, env: env)
        )
    }

    public static func toDart(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)]?[env] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toDartObject(value.0, env: env)
        defer { env.deleteRef(v0) }
        let v1 = try T1.toDartObject(value.1, env: env)
        defer { env.deleteRef(v1) }
        return try env.check { exn in try Env.unwrap(info.constructor)([v0, v1], exn) }
    }
}

@_cdecl("FishyJoesRuntime_Tuple3Converter_setup")
public func tuple3_dart_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    get0Method: @escaping TupleInfo.GetMethod,
    get1Method: @escaping TupleInfo.GetMethod,
    get2Method: @escaping TupleInfo.GetMethod,
    constructor: @escaping TupleInfo.Constructor
) {
    let env = Env(envRef)
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeID(name: name),
          let identifier = Env.objectID(typeID: typeID)
    else {
        fatalError("unregistered typeID \(name)")
    }
    TupleInfo.infos[identifier, default: Env.CallbackMap()][env] = TupleInfo(
        getMethods: [
            get0Method,
            get1Method,
            get2Method,
        ],
        constructor: constructor
    )
}

extension Tuple3Converter: DartConverter where T0: DartConverter, T1: DartConverter, T2: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)]?[env] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }, env: env),
            T1.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }, env: env),
            T2.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }, env: env)
        )
    }

    public static func toDart(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)]?[env] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toDartObject(value.0, env: env)
        defer { env.deleteRef(v0) }
        let v1 = try T1.toDartObject(value.1, env: env)
        defer { env.deleteRef(v1) }
        let v2 = try T2.toDartObject(value.2, env: env)
        defer { env.deleteRef(v2) }
        return try env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2], exn) }
    }
}

@_cdecl("FishyJoesRuntime_Tuple4Converter_setup")
public func tuple4_dart_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    get0Method: @escaping TupleInfo.GetMethod,
    get1Method: @escaping TupleInfo.GetMethod,
    get2Method: @escaping TupleInfo.GetMethod,
    get3Method: @escaping TupleInfo.GetMethod,
    constructor: @escaping TupleInfo.Constructor
) {
    let env = Env(envRef)
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeID(name: name),
          let identifier = Env.objectID(typeID: typeID)
    else {
        fatalError("unregistered typeID \(name)")
    }
    TupleInfo.infos[identifier, default: Env.CallbackMap()][env] = TupleInfo(
        getMethods: [
            get0Method,
            get1Method,
            get2Method,
            get3Method,
        ],
        constructor: constructor
    )
}

extension Tuple4Converter: DartConverter where T0: DartConverter, T1: DartConverter, T2: DartConverter, T3: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)]?[env] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }, env: env),
            T1.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }, env: env),
            T2.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }, env: env),
            T3.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[3])(value, exn) }, env: env)
        )
    }

    public static func toDart(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)]?[env] else {
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
        return try env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2, v3], exn) }
    }
}

@_cdecl("FishyJoesRuntime_Tuple5Converter_setup")
public func tuple5_dart_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    get0Method: @escaping TupleInfo.GetMethod,
    get1Method: @escaping TupleInfo.GetMethod,
    get2Method: @escaping TupleInfo.GetMethod,
    get3Method: @escaping TupleInfo.GetMethod,
    get4Method: @escaping TupleInfo.GetMethod,
    constructor: @escaping TupleInfo.Constructor
) {
    let env = Env(envRef)
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeID(name: name),
          let identifier = Env.objectID(typeID: typeID)
    else {
        fatalError("unregistered typeID \(name)")
    }
    TupleInfo.infos[identifier, default: Env.CallbackMap()][env] = TupleInfo(
        getMethods: [
            get0Method,
            get1Method,
            get2Method,
            get3Method,
            get4Method,
        ],
        constructor: constructor
    )
}

extension Tuple5Converter: DartConverter where T0: DartConverter, T1: DartConverter, T2: DartConverter, T3: DartConverter, T4: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)]?[env] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }, env: env),
            T1.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }, env: env),
            T2.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }, env: env),
            T3.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[3])(value, exn) }, env: env),
            T4.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[4])(value, exn) }, env: env)
        )
    }

    public static func toDart(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)]?[env] else {
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
        return try env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2, v3, v4], exn) }
    }
}

@_cdecl("FishyJoesRuntime_Tuple6Converter_setup")
public func tuple6_dart_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    get0Method: @escaping TupleInfo.GetMethod,
    get1Method: @escaping TupleInfo.GetMethod,
    get2Method: @escaping TupleInfo.GetMethod,
    get3Method: @escaping TupleInfo.GetMethod,
    get4Method: @escaping TupleInfo.GetMethod,
    get5Method: @escaping TupleInfo.GetMethod,
    constructor: @escaping TupleInfo.Constructor
) {
    let env = Env(envRef)
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeID(name: name),
          let identifier = Env.objectID(typeID: typeID)
    else {
        fatalError("unregistered typeID \(name)")
    }
    TupleInfo.infos[identifier, default: Env.CallbackMap()][env] = TupleInfo(
        getMethods: [
            get0Method,
            get1Method,
            get2Method,
            get3Method,
            get4Method,
            get5Method,
        ],
        constructor: constructor
    )
}

extension Tuple6Converter: DartConverter where T0: DartConverter, T1: DartConverter, T2: DartConverter, T3: DartConverter, T4: DartConverter, T5: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)]?[env] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }, env: env),
            T1.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }, env: env),
            T2.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }, env: env),
            T3.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[3])(value, exn) }, env: env),
            T4.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[4])(value, exn) }, env: env),
            T5.consumeDart(object: env.check { exn in try Env.unwrap(info.getMethods[5])(value, exn) }, env: env)
        )
    }

    public static func toDart(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)]?[env] else {
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
        return try env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2, v3, v4, v5], exn) }
    }
}
