import FishyJoesCommonRuntime
import Foundation

public struct TupleInfo {
    public typealias GetMethod = @convention(c) (_ tuple: foreignObject, _ exn: foreignOutExn) -> foreignObject
    public typealias Constructor = @convention(c) (_ values: UnsafePointer<foreignObject>, _ exn: foreignOutExn) -> foreignObject

    let getMethods: [GetMethod]
    let constructor: Constructor

    static var infos: [ObjectIdentifier: TupleInfo] = [:]
}

@_cdecl("FishyJoesRuntime_Tuple2Converter_setup")
public func tuple2_iota_setup(
    name: UnsafePointer<unichar>,
    get0Method: @escaping TupleInfo.GetMethod,
    get1Method: @escaping TupleInfo.GetMethod,
    constructor: @escaping TupleInfo.Constructor
) {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeIDsByName[name],
          let identifier = Env.typeIDsByID[typeID]
    else {
        fatalError("unregistered typeID \(name)")
    }
    TupleInfo.infos[identifier] = TupleInfo(
        getMethods: [
            get0Method,
            get1Method,
        ],
        constructor: constructor
    )
}

extension Tuple2Converter: IotaConverter where T0: IotaConverter, T1: IotaConverter {
    public static func peekIota(_ value: foreignObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }),
            T1.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) })
        )
    }

    public static func toIota(_ value: SwiftType) throws -> foreignObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toIotaObject(value.0)
        defer { Env.deleteRef(v0) }
        let v1 = try T1.toIotaObject(value.1)
        defer { Env.deleteRef(v1) }
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1], exn) }
    }
}

@_cdecl("FishyJoesRuntime_Tuple3Converter_setup")
public func tuple3_iota_setup(
    name: UnsafePointer<unichar>,
    get0Method: @escaping TupleInfo.GetMethod,
    get1Method: @escaping TupleInfo.GetMethod,
    get2Method: @escaping TupleInfo.GetMethod,
    constructor: @escaping TupleInfo.Constructor
) {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeIDsByName[name],
          let identifier = Env.typeIDsByID[typeID]
    else {
        fatalError("unregistered typeID \(name)")
    }
    TupleInfo.infos[identifier] = TupleInfo(
        getMethods: [
            get0Method,
            get1Method,
            get2Method,
        ],
        constructor: constructor
    )
}

extension Tuple3Converter: IotaConverter where T0: IotaConverter, T1: IotaConverter, T2: IotaConverter {
    public static func peekIota(_ value: foreignObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }),
            T1.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }),
            T2.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) })
        )
    }

    public static func toIota(_ value: SwiftType) throws -> foreignObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toIotaObject(value.0)
        defer { Env.deleteRef(v0) }
        let v1 = try T1.toIotaObject(value.1)
        defer { Env.deleteRef(v1) }
        let v2 = try T2.toIotaObject(value.2)
        defer { Env.deleteRef(v2) }
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2], exn) }
    }
}

@_cdecl("FishyJoesRuntime_Tuple4Converter_setup")
public func tuple4_iota_setup(
    name: UnsafePointer<unichar>,
    get0Method: @escaping TupleInfo.GetMethod,
    get1Method: @escaping TupleInfo.GetMethod,
    get2Method: @escaping TupleInfo.GetMethod,
    get3Method: @escaping TupleInfo.GetMethod,
    constructor: @escaping TupleInfo.Constructor
) {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeIDsByName[name],
          let identifier = Env.typeIDsByID[typeID]
    else {
        fatalError("unregistered typeID \(name)")
    }
    TupleInfo.infos[identifier] = TupleInfo(
        getMethods: [
            get0Method,
            get1Method,
            get2Method,
            get3Method,
        ],
        constructor: constructor
    )
}

extension Tuple4Converter: IotaConverter where T0: IotaConverter, T1: IotaConverter, T2: IotaConverter, T3: IotaConverter {
    public static func peekIota(_ value: foreignObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }),
            T1.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }),
            T2.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }),
            T3.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[3])(value, exn) })
        )
    }

    public static func toIota(_ value: SwiftType) throws -> foreignObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toIotaObject(value.0)
        defer { Env.deleteRef(v0) }
        let v1 = try T1.toIotaObject(value.1)
        defer { Env.deleteRef(v1) }
        let v2 = try T2.toIotaObject(value.2)
        defer { Env.deleteRef(v2) }
        let v3 = try T3.toIotaObject(value.3)
        defer { Env.deleteRef(v3) }
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2, v3], exn) }
    }
}

@_cdecl("FishyJoesRuntime_Tuple5Converter_setup")
public func tuple5_iota_setup(
    name: UnsafePointer<unichar>,
    get0Method: @escaping TupleInfo.GetMethod,
    get1Method: @escaping TupleInfo.GetMethod,
    get2Method: @escaping TupleInfo.GetMethod,
    get3Method: @escaping TupleInfo.GetMethod,
    get4Method: @escaping TupleInfo.GetMethod,
    constructor: @escaping TupleInfo.Constructor
) {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeIDsByName[name],
          let identifier = Env.typeIDsByID[typeID]
    else {
        fatalError("unregistered typeID \(name)")
    }
    TupleInfo.infos[identifier] = TupleInfo(
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

extension Tuple5Converter: IotaConverter where T0: IotaConverter, T1: IotaConverter, T2: IotaConverter, T3: IotaConverter, T4: IotaConverter {
    public static func peekIota(_ value: foreignObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }),
            T1.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }),
            T2.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }),
            T3.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[3])(value, exn) }),
            T4.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[4])(value, exn) })
        )
    }

    public static func toIota(_ value: SwiftType) throws -> foreignObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toIotaObject(value.0)
        defer { Env.deleteRef(v0) }
        let v1 = try T1.toIotaObject(value.1)
        defer { Env.deleteRef(v1) }
        let v2 = try T2.toIotaObject(value.2)
        defer { Env.deleteRef(v2) }
        let v3 = try T3.toIotaObject(value.3)
        defer { Env.deleteRef(v3) }
        let v4 = try T4.toIotaObject(value.4)
        defer { Env.deleteRef(v4) }
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2, v3, v4], exn) }
    }
}

@_cdecl("FishyJoesRuntime_Tuple6Converter_setup")
public func tuple6_iota_setup(
    name: UnsafePointer<unichar>,
    get0Method: @escaping TupleInfo.GetMethod,
    get1Method: @escaping TupleInfo.GetMethod,
    get2Method: @escaping TupleInfo.GetMethod,
    get3Method: @escaping TupleInfo.GetMethod,
    get4Method: @escaping TupleInfo.GetMethod,
    get5Method: @escaping TupleInfo.GetMethod,
    constructor: @escaping TupleInfo.Constructor
) {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeIDsByName[name],
          let identifier = Env.typeIDsByID[typeID]
    else {
        fatalError("unregistered typeID \(name)")
    }
    TupleInfo.infos[identifier] = TupleInfo(
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

extension Tuple6Converter: IotaConverter where T0: IotaConverter, T1: IotaConverter, T2: IotaConverter, T3: IotaConverter, T4: IotaConverter, T5: IotaConverter {
    public static func peekIota(_ value: foreignObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }),
            T1.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }),
            T2.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }),
            T3.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[3])(value, exn) }),
            T4.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[4])(value, exn) }),
            T5.consumeIota(object: Env.check { exn in try Env.unwrap(info.getMethods[5])(value, exn) })
        )
    }

    public static func toIota(_ value: SwiftType) throws -> foreignObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toIotaObject(value.0)
        defer { Env.deleteRef(v0) }
        let v1 = try T1.toIotaObject(value.1)
        defer { Env.deleteRef(v1) }
        let v2 = try T2.toIotaObject(value.2)
        defer { Env.deleteRef(v2) }
        let v3 = try T3.toIotaObject(value.3)
        defer { Env.deleteRef(v3) }
        let v4 = try T4.toIotaObject(value.4)
        defer { Env.deleteRef(v4) }
        let v5 = try T5.toIotaObject(value.5)
        defer { Env.deleteRef(v5) }
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2, v3, v4, v5], exn) }
    }
}
