import FishyJoesCommonRuntime
import Foundation

public struct TupleInfo {
    public typealias GetMethod = @convention(c) (_ tuple: csObject, _ exn: csOutExn) -> csObject
    public typealias Constructor = @convention(c) (_ values: UnsafePointer<csObject>, _ exn: csOutExn) -> csObject

    let getMethods: [GetMethod]
    let constructor: Constructor

    static var infos: [ObjectIdentifier: TupleInfo] = [:]
}

@_cdecl("FishyJoesRuntime_Tuple2Converter_setup")
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
    typealias Get0Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get1Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Constructor = @convention(c) (csObject, csObject, csOutExn) -> csObject

    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }, consuming: true),
            T1.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }, consuming: true)
        )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toCSharpObject(value.0)
        let v1 = try T1.toCSharpObject(value.1)
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1], exn) }
    }
}

@_cdecl("FishyJoesRuntime_Tuple3Converter_setup")
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
    typealias Get0Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get1Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get2Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Constructor = @convention(c) (csObject, csObject, csObject, csOutExn) -> csObject

    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }, consuming: true),
            T1.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }, consuming: true),
            T2.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }, consuming: true)
        )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toCSharpObject(value.0)
        let v1 = try T1.toCSharpObject(value.1)
        let v2 = try T2.toCSharpObject(value.2)
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2], exn) }
    }
}

@_cdecl("FishyJoesRuntime_Tuple4Converter_setup")
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
    typealias Get0Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get1Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get2Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get3Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Constructor = @convention(c) (csObject, csObject, csObject, csObject, csOutExn) -> csObject

    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }, consuming: true),
            T1.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }, consuming: true),
            T2.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }, consuming: true),
            T3.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[3])(value, exn) }, consuming: true)
        )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toCSharpObject(value.0)
        let v1 = try T1.toCSharpObject(value.1)
        let v2 = try T2.toCSharpObject(value.2)
        let v3 = try T3.toCSharpObject(value.3)
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2, v3], exn) }
    }
}

@_cdecl("FishyJoesRuntime_Tuple5Converter_setup")
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
    typealias Get0Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get1Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get2Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get3Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get4Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Constructor = @convention(c) (csObject, csObject, csObject, csObject, csObject, csOutExn) -> csObject

    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }, consuming: true),
            T1.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }, consuming: true),
            T2.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }, consuming: true),
            T3.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[3])(value, exn) }, consuming: true),
            T4.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[4])(value, exn) }, consuming: true)
        )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toCSharpObject(value.0)
        let v1 = try T1.toCSharpObject(value.1)
        let v2 = try T2.toCSharpObject(value.2)
        let v3 = try T3.toCSharpObject(value.3)
        let v4 = try T4.toCSharpObject(value.4)
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2, v3, v4], exn) }
    }
}

@_cdecl("FishyJoesRuntime_Tuple6Converter_setup")
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
    typealias Get0Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get1Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get2Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get3Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get4Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Get5Method = @convention(c) (csObject, csOutExn) -> csObject
    typealias Constructor = @convention(c) (csObject, csObject, csObject, csObject, csObject, csObject, csOutExn) -> csObject

    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        return try (
            T0.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[0])(value, exn) }, consuming: true),
            T1.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[1])(value, exn) }, consuming: true),
            T2.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[2])(value, exn) }, consuming: true),
            T3.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[3])(value, exn) }, consuming: true),
            T4.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[4])(value, exn) }, consuming: true),
            T5.fromCSharp(object: Env.check { exn in try Env.unwrap(info.getMethods[5])(value, exn) }, consuming: true)
        )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        guard let info = TupleInfo.infos[ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let v0 = try T0.toCSharpObject(value.0)
        let v1 = try T1.toCSharpObject(value.1)
        let v2 = try T2.toCSharpObject(value.2)
        let v3 = try T3.toCSharpObject(value.3)
        let v4 = try T4.toCSharpObject(value.4)
        let v5 = try T5.toCSharpObject(value.5)
        return try Env.check { exn in try Env.unwrap(info.constructor)([v0, v1, v2, v3, v4, v5], exn) }
    }
}
