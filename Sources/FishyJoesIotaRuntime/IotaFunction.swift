import FishyJoesCommonRuntime
import Foundation

public enum SwiftFunctionImpl {
    public typealias Constructor = @convention(c) (_ ref: UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject
    // For invoke methods, C# side is responsible for consuming all arguments except the first one
    public typealias Invoke0 = @convention(c) (_ fn: csObject, _ exn: csOutExn) -> csObject
    public typealias Invoke1 = @convention(c) (_ fn: csObject, csObject, _ exn: csOutExn) -> csObject
    public typealias Invoke2 = @convention(c) (_ fn: csObject, csObject, csObject, _ exn: csOutExn) -> csObject
    public typealias Invoke3 = @convention(c) (_ fn: csObject, csObject, csObject, csObject, _ exn: csOutExn) -> csObject
    public typealias Invoke4 = @convention(c) (_ fn: csObject, csObject, csObject, csObject, csObject, _ exn: csOutExn) -> csObject
    public typealias Invoke5 = @convention(c) (_ fn: csObject, csObject, csObject, csObject, csObject, csObject, _ exn: csOutExn) -> csObject
    public typealias Invoke6 = @convention(c) (_ fn: csObject, csObject, csObject, csObject, csObject, csObject, csObject, _ exn: csOutExn) -> csObject
    static var constructors: [ObjectIdentifier: Constructor] = [:]
    static var invoke0s: [ObjectIdentifier: Invoke0] = [:]
    static var invoke1s: [ObjectIdentifier: Invoke1] = [:]
    static var invoke2s: [ObjectIdentifier: Invoke2] = [:]
    static var invoke3s: [ObjectIdentifier: Invoke3] = [:]
    static var invoke4s: [ObjectIdentifier: Invoke4] = [:]
    static var invoke5s: [ObjectIdentifier: Invoke5] = [:]
    static var invoke6s: [ObjectIdentifier: Invoke6] = [:]
}

@_cdecl("FishyJoesRuntime_Function0Converter_setup")
public func FishyJoesRuntime_Function0Converter_setup(
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke0,
    exn: csOutExn
) {
    Env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeIDsByName[name],
              let identifier = Env.typeIDsByID[typeID]
        else {
            fatalError("unregistered typeID \(name)")
        }
        SwiftFunctionImpl.constructors[identifier] = constructor
        SwiftFunctionImpl.invoke0s[identifier] = invoke
    }
}

@_cdecl("FishyJoesRuntime_Function1Converter_setup")
public func FishyJoesRuntime_Function1Converter_setup(
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke1,
    exn: csOutExn
) {
    Env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeIDsByName[name],
              let identifier = Env.typeIDsByID[typeID]
        else {
            fatalError("unregistered typeID \(name)")
        }
        SwiftFunctionImpl.constructors[identifier] = constructor
        SwiftFunctionImpl.invoke1s[identifier] = invoke
    }
}

@_cdecl("FishyJoesRuntime_Function2Converter_setup")
public func FishyJoesRuntime_Function2Converter_setup(
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke2,
    exn: csOutExn
) {
    Env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeIDsByName[name],
              let identifier = Env.typeIDsByID[typeID]
        else {
            fatalError("unregistered typeID \(name)")
        }
        SwiftFunctionImpl.constructors[identifier] = constructor
        SwiftFunctionImpl.invoke2s[identifier] = invoke
    }
}

@_cdecl("FishyJoesRuntime_Function3Converter_setup")
public func FishyJoesRuntime_Function3Converter_setup(
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke3,
    exn: csOutExn
) {
    Env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeIDsByName[name],
              let identifier = Env.typeIDsByID[typeID]
        else {
            fatalError("unregistered typeID \(name)")
        }
        SwiftFunctionImpl.constructors[identifier] = constructor
        SwiftFunctionImpl.invoke3s[identifier] = invoke
    }
}

@_cdecl("FishyJoesRuntime_Function4Converter_setup")
public func FishyJoesRuntime_Function4Converter_setup(
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke4,
    exn: csOutExn
) {
    Env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeIDsByName[name],
              let identifier = Env.typeIDsByID[typeID]
        else {
            fatalError("unregistered typeID \(name)")
        }
        SwiftFunctionImpl.constructors[identifier] = constructor
        SwiftFunctionImpl.invoke4s[identifier] = invoke
    }
}

@_cdecl("FishyJoesRuntime_Function5Converter_setup")
public func FishyJoesRuntime_Function5Converter_setup(
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke5,
    exn: csOutExn
) {
    Env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeIDsByName[name],
              let identifier = Env.typeIDsByID[typeID]
        else {
            fatalError("unregistered typeID \(name)")
        }
        SwiftFunctionImpl.constructors[identifier] = constructor
        SwiftFunctionImpl.invoke5s[identifier] = invoke
    }
}

@_cdecl("FishyJoesRuntime_Function6Converter_setup")
public func FishyJoesRuntime_Function6Converter_setup(
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke6,
    exn: csOutExn
) {
    Env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeIDsByName[name],
              let identifier = Env.typeIDsByID[typeID]
        else {
            fatalError("unregistered typeID \(name)")
        }
        SwiftFunctionImpl.constructors[identifier] = constructor
        SwiftFunctionImpl.invoke6s[identifier] = invoke
    }
}

// This code is really repetitive, but I'm not sure how it could be made better...

private struct AnyFunction0 {
    let invoke: () throws -> csObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke0")
public func SwiftFunctionImpl_invoke0(this: UnsafeMutableRawPointer, exn: csOutExn) -> csObject {
    Env.catching(to: exn) {
        return try Box<AnyFunction0>.takeUnretainedOpaque(this).value.invoke()
    }
}

private struct AnyFunction1 {
    let invoke: (csObject) throws -> csObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke1")
public func SwiftFunctionImpl_invoke1(this: UnsafeMutableRawPointer, p0: csObject, exn: csOutExn) -> csObject {
    Env.catching(to: exn) { try Box<AnyFunction1>.takeUnretainedOpaque(this).value.invoke(p0) }
}

private struct AnyFunction2 {
    let invoke: (csObject, csObject) throws -> csObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke2")
public func SwiftFunctionImpl_invoke2(this: UnsafeMutableRawPointer, p0: csObject, p1: csObject, exn: csOutExn) -> csObject {
    Env.catching(to: exn) { try Box<AnyFunction2>.takeUnretainedOpaque(this).value.invoke(p0, p1) }
}

private struct AnyFunction3 {
    let invoke: (csObject, csObject, csObject) throws -> csObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke3")
public func SwiftFunctionImpl_invoke3(this: UnsafeMutableRawPointer, p0: csObject, p1: csObject, p2: csObject, exn: csOutExn) -> csObject {
    Env.catching(to: exn) { try Box<AnyFunction3>.takeUnretainedOpaque(this).value.invoke(p0, p1, p2) }
}

private struct AnyFunction4 {
    let invoke: (csObject, csObject, csObject, csObject) throws -> csObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke4")
public func SwiftFunctionImpl_invoke4(this: UnsafeMutableRawPointer, p0: csObject, p1: csObject, p2: csObject, p3: csObject, exn: csOutExn) -> csObject {
    Env.catching(to: exn) { try Box<AnyFunction4>.takeUnretainedOpaque(this).value.invoke(p0, p1, p2, p3) }
}

private struct AnyFunction5 {
    let invoke: (csObject, csObject, csObject, csObject, csObject) throws -> csObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke5")
public func SwiftFunctionImpl_invoke5(this: UnsafeMutableRawPointer, p0: csObject, p1: csObject, p2: csObject, p3: csObject, p4: csObject, exn: csOutExn) -> csObject {
    Env.catching(to: exn) { try Box<AnyFunction5>.takeUnretainedOpaque(this).value.invoke(p0, p1, p2, p3, p4) }
}

private struct AnyFunction6 {
    let invoke: (csObject, csObject, csObject, csObject, csObject, csObject) throws -> csObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke6")
public func SwiftFunctionImpl_invoke6(this: UnsafeMutableRawPointer, p0: csObject, p1: csObject, p2: csObject, p3: csObject, p4: csObject, p5: csObject, exn: csOutExn) -> csObject {
    Env.catching(to: exn) { try Box<AnyFunction6>.takeUnretainedOpaque(this).value.invoke(p0, p1, p2, p3, p4, p5) }
}

extension Function0Converter: IotaConverter where R: IotaConverter {
    public static func peekIota(_ value: csObject) throws -> SwiftType {
        let escapingRef = try IotaReference(value)
        let initThread = Thread.current
        return {
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke0s[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeIota(
                object: Env.check {exn in
                    invoke(escapingRef.object, exn)
                }
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType) throws -> csObject {
        let erased = AnyFunction0 {
            try R.toIotaObject(value())
        }
        let ptr = Box(erased).retainedOpaque()
        return try Env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}

extension Function1Converter: IotaConverter where R: IotaConverter, P0: IotaConverter {
    public static func peekIota(_ value: csObject) throws -> SwiftType {
        let escapingRef = try IotaReference(value)
        let initThread = Thread.current
        return { p0 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke1s[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeIota(
                object: Env.check { exn in
                    invoke(
                        escapingRef.object,
                        try P0.toIotaObject(p0),
                        exn
                    )
                }
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType) throws -> csObject {
        let erased = AnyFunction1 { p0 in
            let v0 = try P0.peekIota(object: p0)
            return try R.toIotaObject(value(v0))
        }
        let ptr = Box(erased).retainedOpaque()
        return try Env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}

extension Function2Converter: IotaConverter where R: IotaConverter, P0: IotaConverter, P1: IotaConverter {
    public static func peekIota(_ value: csObject) throws -> SwiftType {
        let escapingRef = try IotaReference(value)
        let initThread = Thread.current
        return { p0, p1 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke2s[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeIota(
                object: Env.check { exn in
                    invoke(
                        escapingRef.object,
                        try P0.toIotaObject(p0),
                        try P1.toIotaObject(p1),
                        exn
                    )
                }
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType) throws -> csObject {
        let erased = AnyFunction2 { p0, p1 in
            let v0 = try P0.peekIota(object: p0)
            let v1 = try P1.peekIota(object: p1)
            return try R.toIotaObject(value(v0, v1))
        }
        let ptr = Box(erased).retainedOpaque()
        return try Env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}

extension Function3Converter: IotaConverter where R: IotaConverter, P0: IotaConverter, P1: IotaConverter, P2: IotaConverter {
    public static func peekIota(_ value: csObject) throws -> SwiftType {
        let escapingRef = try IotaReference(value)
        let initThread = Thread.current
        return { p0, p1, p2 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke3s[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeIota(
                object: Env.check { exn in
                    invoke(
                        escapingRef.object,
                        try P0.toIotaObject(p0),
                        try P1.toIotaObject(p1),
                        try P2.toIotaObject(p2),
                        exn
                    )
                }
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType) throws -> csObject {
        let erased = AnyFunction3 { p0, p1, p2 in
            let v0 = try P0.peekIota(object: p0)
            let v1 = try P1.peekIota(object: p1)
            let v2 = try P2.peekIota(object: p2)
            return try R.toIotaObject(value(v0, v1, v2))
        }
        let ptr = Box(erased).retainedOpaque()
        return try Env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}

extension Function4Converter: IotaConverter where R: IotaConverter, P0: IotaConverter, P1: IotaConverter, P2: IotaConverter, P3: IotaConverter {
    public static func peekIota(_ value: csObject) throws -> SwiftType {
        let escapingRef = try IotaReference(value)
        let initThread = Thread.current
        return { p0, p1, p2, p3 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke4s[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeIota(
                object: Env.check { exn in
                    invoke(
                        escapingRef.object,
                        try P0.toIotaObject(p0),
                        try P1.toIotaObject(p1),
                        try P2.toIotaObject(p2),
                        try P3.toIotaObject(p3),
                        exn
                    )
                }
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType) throws -> csObject {
        let erased = AnyFunction4 { p0, p1, p2, p3 in
            let v0 = try P0.peekIota(object: p0)
            let v1 = try P1.peekIota(object: p1)
            let v2 = try P2.peekIota(object: p2)
            let v3 = try P3.peekIota(object: p3)
            return try R.toIotaObject(value(v0, v1, v2, v3))
        }
        let ptr = Box(erased).retainedOpaque()
        return try Env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}

extension Function5Converter: IotaConverter where R: IotaConverter, P0: IotaConverter, P1: IotaConverter, P2: IotaConverter, P3: IotaConverter, P4: IotaConverter {
    public static func peekIota(_ value: csObject) throws -> SwiftType {
        let escapingRef = try IotaReference(value)
        let initThread = Thread.current
        return { p0, p1, p2, p3, p4 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke5s[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeIota(
                object: Env.check { exn in
                    invoke(
                        escapingRef.object,
                        try P0.toIotaObject(p0),
                        try P1.toIotaObject(p1),
                        try P2.toIotaObject(p2),
                        try P3.toIotaObject(p3),
                        try P4.toIotaObject(p4),
                        exn
                    )
                }
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType) throws -> csObject {
        let erased = AnyFunction5 { p0, p1, p2, p3, p4 in
            let v0 = try P0.peekIota(object: p0)
            let v1 = try P1.peekIota(object: p1)
            let v2 = try P2.peekIota(object: p2)
            let v3 = try P3.peekIota(object: p3)
            let v4 = try P4.peekIota(object: p4)
            return try R.toIotaObject(value(v0, v1, v2, v3, v4))
        }
        let ptr = Box(erased).retainedOpaque()
        return try Env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}

extension Function6Converter: IotaConverter where R: IotaConverter, P0: IotaConverter, P1: IotaConverter, P2: IotaConverter, P3: IotaConverter, P4: IotaConverter, P5: IotaConverter {
    public static func peekIota(_ value: csObject) throws -> SwiftType {
        let escapingRef = try IotaReference(value)
        let initThread = Thread.current
        return { p0, p1, p2, p3, p4, p5 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke6s[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeIota(
                object: Env.check { exn in
                    invoke(
                        escapingRef.object,
                        try P0.toIotaObject(p0),
                        try P1.toIotaObject(p1),
                        try P2.toIotaObject(p2),
                        try P3.toIotaObject(p3),
                        try P4.toIotaObject(p4),
                        try P5.toIotaObject(p5),
                        exn
                    )
                }
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType) throws -> csObject {
        let erased = AnyFunction6 { p0, p1, p2, p3, p4, p5 in
            let v0 = try P0.peekIota(object: p0)
            let v1 = try P1.peekIota(object: p1)
            let v2 = try P2.peekIota(object: p2)
            let v3 = try P3.peekIota(object: p3)
            let v4 = try P4.peekIota(object: p4)
            let v5 = try P5.peekIota(object: p5)
            return try R.toIotaObject(value(v0, v1, v2, v3, v4, v5))
        }
        let ptr = Box(erased).retainedOpaque()
        return try Env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}
