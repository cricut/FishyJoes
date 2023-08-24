import FishyJoesCommonRuntime
import Foundation

public struct TupleInfo {
    public typealias GetMethod = @convention(c) (_ tuple: csObject, _ exn: csOutExn) -> csObject
    public typealias Constructor = @convention(c) (_ values: UnsafePointer<csObject>, _ exn: csOutExn) -> csObject

    let getMethods: [GetMethod]
    let constructor: Constructor

    static var infos: [ObjectIdentifier: TupleInfo] = [:]
}

@_cdecl("FishyJoesCommonRuntime_Tuple2Converter_setup")
public func tuple2_cSharp_setup(
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

extension Tuple2Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }),
            T1.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) })
        )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toCSharpObject(value.0)
        defer { Env.deleteRef(v0) }
        let v1 = try T1.toCSharpObject(value.1)
        defer { Env.deleteRef(v1) }
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1], exn) }
    }
}

@_cdecl("FishyJoesCommonRuntime_Tuple3Converter_setup")
public func tuple3_cSharp_setup(
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

extension Tuple3Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter, T2: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }),
            T1.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }),
            T2.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) })
        )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toCSharpObject(value.0)
        defer { Env.deleteRef(v0) }
        let v1 = try T1.toCSharpObject(value.1)
        defer { Env.deleteRef(v1) }
        let v2 = try T2.toCSharpObject(value.2)
        defer { Env.deleteRef(v2) }
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2], exn) }
    }
}

@_cdecl("FishyJoesCommonRuntime_Tuple4Converter_setup")
public func tuple4_cSharp_setup(
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

extension Tuple4Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter, T2: CSharpConverter, T3: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }),
            T1.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }),
            T2.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }),
            T3.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[3])(value, exn) })
        )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toCSharpObject(value.0)
        defer { Env.deleteRef(v0) }
        let v1 = try T1.toCSharpObject(value.1)
        defer { Env.deleteRef(v1) }
        let v2 = try T2.toCSharpObject(value.2)
        defer { Env.deleteRef(v2) }
        let v3 = try T3.toCSharpObject(value.3)
        defer { Env.deleteRef(v3) }
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2, v3], exn) }
    }
}

@_cdecl("FishyJoesCommonRuntime_Tuple5Converter_setup")
public func tuple5_cSharp_setup(
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

extension Tuple5Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter, T2: CSharpConverter, T3: CSharpConverter, T4: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }),
            T1.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }),
            T2.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }),
            T3.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[3])(value, exn) }),
            T4.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[4])(value, exn) })
        )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toCSharpObject(value.0)
        defer { Env.deleteRef(v0) }
        let v1 = try T1.toCSharpObject(value.1)
        defer { Env.deleteRef(v1) }
        let v2 = try T2.toCSharpObject(value.2)
        defer { Env.deleteRef(v2) }
        let v3 = try T3.toCSharpObject(value.3)
        defer { Env.deleteRef(v3) }
        let v4 = try T4.toCSharpObject(value.4)
        defer { Env.deleteRef(v4) }
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2, v3, v4], exn) }
    }
}

@_cdecl("FishyJoesCommonRuntime_Tuple6Converter_setup")
public func tuple6_cSharp_setup(
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

extension Tuple6Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter, T2: CSharpConverter, T3: CSharpConverter, T4: CSharpConverter, T5: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }),
            T1.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }),
            T2.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }),
            T3.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[3])(value, exn) }),
            T4.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[4])(value, exn) }),
            T5.consumeCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[5])(value, exn) })
        )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toCSharpObject(value.0)
        defer { Env.deleteRef(v0) }
        let v1 = try T1.toCSharpObject(value.1)
        defer { Env.deleteRef(v1) }
        let v2 = try T2.toCSharpObject(value.2)
        defer { Env.deleteRef(v2) }
        let v3 = try T3.toCSharpObject(value.3)
        defer { Env.deleteRef(v3) }
        let v4 = try T4.toCSharpObject(value.4)
        defer { Env.deleteRef(v4) }
        let v5 = try T5.toCSharpObject(value.5)
        defer { Env.deleteRef(v5) }
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2, v3, v4, v5], exn) }
    }
}
