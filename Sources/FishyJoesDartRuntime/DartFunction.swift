import FishyJoesCommonRuntime
import Foundation

public enum SwiftFunctionImpl {
    public typealias Constructor = @convention(c) (_ ref: UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject
    // For invoke methods, C# side is responsible for consuming all arguments except the first one
    public typealias Invoke0 = @convention(c) (_ fn: foreignObject, _ exn: foreignOutExn) -> foreignObject
    public typealias Invoke1 = @convention(c) (_ fn: foreignObject, foreignObject, _ exn: foreignOutExn) -> foreignObject
    public typealias Invoke2 = @convention(c) (_ fn: foreignObject, foreignObject, foreignObject, _ exn: foreignOutExn) -> foreignObject
    public typealias Invoke3 = @convention(c) (_ fn: foreignObject, foreignObject, foreignObject, foreignObject, _ exn: foreignOutExn) -> foreignObject
    public typealias Invoke4 = @convention(c) (_ fn: foreignObject, foreignObject, foreignObject, foreignObject, foreignObject, _ exn: foreignOutExn) -> foreignObject
    public typealias Invoke5 = @convention(c) (_ fn: foreignObject, foreignObject, foreignObject, foreignObject, foreignObject, foreignObject, _ exn: foreignOutExn) -> foreignObject
    public typealias Invoke6 = @convention(c) (_ fn: foreignObject, foreignObject, foreignObject, foreignObject, foreignObject, foreignObject, foreignObject, _ exn: foreignOutExn) -> foreignObject
    static var constructors: Env.SynchronizedDictionary<ObjectIdentifier, Env.CallbackMap<Constructor>> = [:]
    static var invoke0s: Env.SynchronizedDictionary<ObjectIdentifier, Env.CallbackMap<Invoke0>> = [:]
    static var invoke1s: Env.SynchronizedDictionary<ObjectIdentifier, Env.CallbackMap<Invoke1>> = [:]
    static var invoke2s: Env.SynchronizedDictionary<ObjectIdentifier, Env.CallbackMap<Invoke2>> = [:]
    static var invoke3s: Env.SynchronizedDictionary<ObjectIdentifier, Env.CallbackMap<Invoke3>> = [:]
    static var invoke4s: Env.SynchronizedDictionary<ObjectIdentifier, Env.CallbackMap<Invoke4>> = [:]
    static var invoke5s: Env.SynchronizedDictionary<ObjectIdentifier, Env.CallbackMap<Invoke5>> = [:]
    static var invoke6s: Env.SynchronizedDictionary<ObjectIdentifier, Env.CallbackMap<Invoke6>> = [:]
}

@_cdecl("FishyJoesRuntime_Function0Converter_setup")
public func FishyJoesRuntime_Function0Converter_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke0,
    exn: foreignOutExn
) {
    let env = Env(envRef)
    env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeID(name: name),
              let identifier = Env.objectID(typeID: typeID)
        else {
            fatalError("unregistered typeID '\(name)'")
        }
        SwiftFunctionImpl.constructors[identifier, default: Env.CallbackMap()][env] = constructor
        SwiftFunctionImpl.invoke0s[identifier, default: Env.CallbackMap()][env] = invoke
    }
}

@_cdecl("FishyJoesRuntime_Function1Converter_setup")
public func FishyJoesRuntime_Function1Converter_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke1,
    exn: foreignOutExn
) {
    let env = Env(envRef)
    env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeID(name: name),
              let identifier = Env.objectID(typeID: typeID)
        else {
            fatalError("unregistered typeID '\(name)'")
        }
        SwiftFunctionImpl.constructors[identifier, default: Env.CallbackMap()][env] = constructor
        SwiftFunctionImpl.invoke1s[identifier, default: Env.CallbackMap()][env] = invoke
    }
}

@_cdecl("FishyJoesRuntime_Function2Converter_setup")
public func FishyJoesRuntime_Function2Converter_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke2,
    exn: foreignOutExn
) {
    let env = Env(envRef)
    env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeID(name: name),
              let identifier = Env.objectID(typeID: typeID)
        else {
            fatalError("unregistered typeID '\(name)'")
        }
        SwiftFunctionImpl.constructors[identifier, default: Env.CallbackMap()][env] = constructor
        SwiftFunctionImpl.invoke2s[identifier, default: Env.CallbackMap()][env] = invoke
    }
}

@_cdecl("FishyJoesRuntime_Function3Converter_setup")
public func FishyJoesRuntime_Function3Converter_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke3,
    exn: foreignOutExn
) {
    let env = Env(envRef)
    env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeID(name: name),
              let identifier = Env.objectID(typeID: typeID)
        else {
            fatalError("unregistered typeID '\(name)'")
        }
        SwiftFunctionImpl.constructors[identifier, default: Env.CallbackMap()][env] = constructor
        SwiftFunctionImpl.invoke3s[identifier, default: Env.CallbackMap()][env] = invoke
    }
}

@_cdecl("FishyJoesRuntime_Function4Converter_setup")
public func FishyJoesRuntime_Function4Converter_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke4,
    exn: foreignOutExn
) {
    let env = Env(envRef)
    env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeID(name: name),
              let identifier = Env.objectID(typeID: typeID)
        else {
            fatalError("unregistered typeID '\(name)'")
        }
        SwiftFunctionImpl.constructors[identifier, default: Env.CallbackMap()][env] = constructor
        SwiftFunctionImpl.invoke4s[identifier, default: Env.CallbackMap()][env] = invoke
    }
}

@_cdecl("FishyJoesRuntime_Function5Converter_setup")
public func FishyJoesRuntime_Function5Converter_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke5,
    exn: foreignOutExn
) {
    let env = Env(envRef)
    env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeID(name: name),
              let identifier = Env.objectID(typeID: typeID)
        else {
            fatalError("unregistered typeID '\(name)'")
        }
        SwiftFunctionImpl.constructors[identifier, default: Env.CallbackMap()][env] = constructor
        SwiftFunctionImpl.invoke5s[identifier, default: Env.CallbackMap()][env] = invoke
    }
}

@_cdecl("FishyJoesRuntime_Function6Converter_setup")
public func FishyJoesRuntime_Function6Converter_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    constructor: @escaping SwiftFunctionImpl.Constructor,
    invoke: @escaping SwiftFunctionImpl.Invoke6,
    exn: foreignOutExn
) {
    let env = Env(envRef)
    env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeID(name: name),
              let identifier = Env.objectID(typeID: typeID)
        else {
            fatalError("unregistered typeID '\(name)'")
        }
        SwiftFunctionImpl.constructors[identifier, default: Env.CallbackMap()][env] = constructor
        SwiftFunctionImpl.invoke6s[identifier, default: Env.CallbackMap()][env] = invoke
    }
}

// This code is really repetitive, but I'm not sure how it could be made better...

private struct AnyFunction0 {
    let invoke: (Env) throws -> foreignObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke0")
public func SwiftFunctionImpl_invoke0(
    envRef: EnvRef,
    this: UnsafeMutableRawPointer,
    exn: foreignOutExn
) -> foreignObject {
    let env = Env(envRef)
    return env.catching(to: exn) {
        return try Box<AnyFunction0>.takeUnretainedOpaque(this).value.invoke(env)
    }
}

private struct AnyFunction1 {
    let invoke: (foreignObject, Env) throws -> foreignObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke1")
public func SwiftFunctionImpl_invoke1(
    envRef: EnvRef,
    this: UnsafeMutableRawPointer,
    p0: foreignObject,
    exn: foreignOutExn
) -> foreignObject {
    let env = Env(envRef)
    return env.catching(to: exn) { try Box<AnyFunction1>.takeUnretainedOpaque(this).value.invoke(p0, env) }
}

private struct AnyFunction2 {
    let invoke: (foreignObject, foreignObject, Env) throws -> foreignObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke2")
public func SwiftFunctionImpl_invoke2(
    envRef: EnvRef,
    this: UnsafeMutableRawPointer,
    p0: foreignObject,
    p1: foreignObject,
    exn: foreignOutExn
) -> foreignObject {
    let env = Env(envRef)
    return env.catching(to: exn) { try Box<AnyFunction2>.takeUnretainedOpaque(this).value.invoke(p0, p1, env) }
}

private struct AnyFunction3 {
    let invoke: (foreignObject, foreignObject, foreignObject, Env) throws -> foreignObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke3")
public func SwiftFunctionImpl_invoke3(
    envRef: EnvRef,
    this: UnsafeMutableRawPointer,
    p0: foreignObject,
    p1: foreignObject,
    p2: foreignObject,
    exn: foreignOutExn
) -> foreignObject {
    let env = Env(envRef)
    return env.catching(to: exn) { try Box<AnyFunction3>.takeUnretainedOpaque(this).value.invoke(p0, p1, p2, env) }
}

private struct AnyFunction4 {
    let invoke: (foreignObject, foreignObject, foreignObject, foreignObject, Env) throws -> foreignObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke4")
public func SwiftFunctionImpl_invoke4(
    envRef: EnvRef,
    this: UnsafeMutableRawPointer,
    p0: foreignObject,
    p1: foreignObject,
    p2: foreignObject,
    p3: foreignObject,
    exn: foreignOutExn
) -> foreignObject {
    let env = Env(envRef)
    return env.catching(to: exn) { try Box<AnyFunction4>.takeUnretainedOpaque(this).value.invoke(p0, p1, p2, p3, env) }
}

private struct AnyFunction5 {
    let invoke: (foreignObject, foreignObject, foreignObject, foreignObject, foreignObject, Env) throws -> foreignObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke5")
public func SwiftFunctionImpl_invoke5(
    envRef: EnvRef,
    this: UnsafeMutableRawPointer,
    p0: foreignObject,
    p1: foreignObject,
    p2: foreignObject,
    p3: foreignObject,
    p4: foreignObject,
    exn: foreignOutExn
) -> foreignObject {
    let env = Env(envRef)
    return env.catching(to: exn) { try Box<AnyFunction5>.takeUnretainedOpaque(this).value.invoke(p0, p1, p2, p3, p4, env) }
}

private struct AnyFunction6 {
    let invoke: (foreignObject, foreignObject, foreignObject, foreignObject, foreignObject, foreignObject, Env) throws -> foreignObject
}
@_cdecl("FishyJoesRuntime_SwiftFunctionImpl_invoke6")
public func SwiftFunctionImpl_invoke6(
    envRef: EnvRef,
    this: UnsafeMutableRawPointer,
    p0: foreignObject,
    p1: foreignObject,
    p2: foreignObject,
    p3: foreignObject,
    p4: foreignObject,
    p5: foreignObject,
    exn: foreignOutExn
) -> foreignObject {
    let env = Env(envRef)
    return env.catching(to: exn) { try Box<AnyFunction6>.takeUnretainedOpaque(this).value.invoke(p0, p1, p2, p3, p4, p5, env) }
}

extension Function0Converter: DartConverter where R: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try DartReference(value, env: env)
        let initThread = Thread.current
        return {
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke0s[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeDart(
                object: env.check { exn in
                    invoke(escapingRef.object, exn)
                },
                env: env
            )
        }
    }

    public static func toDart(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction0 { env in
            try R.toDartObject(value(), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}

extension Function1Converter: DartConverter where R: DartConverter, P0: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try DartReference(value, env: env)
        let initThread = Thread.current
        return { p0 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke1s[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeDart(
                object: env.check { exn in
                    invoke(
                        escapingRef.object,
                        try P0.toDartObject(p0, env: env),
                        exn
                    )
                },
                env: env
            )
        }
    }

    public static func toDart(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction1 { p0, env in
            let v0 = try P0.peekDart(object: p0, env: env)
            return try R.toDartObject(value(v0), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}

extension Function2Converter: DartConverter where R: DartConverter, P0: DartConverter, P1: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try DartReference(value, env: env)
        let initThread = Thread.current
        return { p0, p1 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke2s[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeDart(
                object: env.check { exn in
                    invoke(
                        escapingRef.object,
                        try P0.toDartObject(p0, env: env),
                        try P1.toDartObject(p1, env: env),
                        exn
                    )
                },
                env: env
            )
        }
    }

    public static func toDart(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction2 { p0, p1, env in
            let v0 = try P0.peekDart(object: p0, env: env)
            let v1 = try P1.peekDart(object: p1, env: env)
            return try R.toDartObject(value(v0, v1), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}

extension Function3Converter: DartConverter where R: DartConverter, P0: DartConverter, P1: DartConverter, P2: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try DartReference(value, env: env)
        let initThread = Thread.current
        return { p0, p1, p2 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke3s[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeDart(
                object: env.check { exn in
                    invoke(
                        escapingRef.object,
                        try P0.toDartObject(p0, env: env),
                        try P1.toDartObject(p1, env: env),
                        try P2.toDartObject(p2, env: env),
                        exn
                    )
                },
                env: env
            )
        }
    }

    public static func toDart(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction3 { p0, p1, p2, env in
            let v0 = try P0.peekDart(object: p0, env: env)
            let v1 = try P1.peekDart(object: p1, env: env)
            let v2 = try P2.peekDart(object: p2, env: env)
            return try R.toDartObject(value(v0, v1, v2), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}

extension Function4Converter: DartConverter where R: DartConverter, P0: DartConverter, P1: DartConverter, P2: DartConverter, P3: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try DartReference(value, env: env)
        let initThread = Thread.current
        return { p0, p1, p2, p3 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke4s[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeDart(
                object: env.check { exn in
                    invoke(
                        escapingRef.object,
                        try P0.toDartObject(p0, env: env),
                        try P1.toDartObject(p1, env: env),
                        try P2.toDartObject(p2, env: env),
                        try P3.toDartObject(p3, env: env),
                        exn
                    )
                },
                env: env
            )
        }
    }

    public static func toDart(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction4 { p0, p1, p2, p3, env in
            let v0 = try P0.peekDart(object: p0, env: env)
            let v1 = try P1.peekDart(object: p1, env: env)
            let v2 = try P2.peekDart(object: p2, env: env)
            let v3 = try P3.peekDart(object: p3, env: env)
            return try R.toDartObject(value(v0, v1, v2, v3), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}

extension Function5Converter: DartConverter where R: DartConverter, P0: DartConverter, P1: DartConverter, P2: DartConverter, P3: DartConverter, P4: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try DartReference(value, env: env)
        let initThread = Thread.current
        return { p0, p1, p2, p3, p4 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke5s[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeDart(
                object: env.check { exn in
                    invoke(
                        escapingRef.object,
                        try P0.toDartObject(p0, env: env),
                        try P1.toDartObject(p1, env: env),
                        try P2.toDartObject(p2, env: env),
                        try P3.toDartObject(p3, env: env),
                        try P4.toDartObject(p4, env: env),
                        exn
                    )
                },
                env: env
            )
        }
    }

    public static func toDart(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction5 { p0, p1, p2, p3, p4, env in
            let v0 = try P0.peekDart(object: p0, env: env)
            let v1 = try P1.peekDart(object: p1, env: env)
            let v2 = try P2.peekDart(object: p2, env: env)
            let v3 = try P3.peekDart(object: p3, env: env)
            let v4 = try P4.peekDart(object: p4, env: env)
            return try R.toDartObject(value(v0, v1, v2, v3, v4), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}

extension Function6Converter: DartConverter where R: DartConverter, P0: DartConverter, P1: DartConverter, P2: DartConverter, P3: DartConverter, P4: DartConverter, P5: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try DartReference(value, env: env)
        let initThread = Thread.current
        return { p0, p1, p2, p3, p4, p5 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            guard let invoke = SwiftFunctionImpl.invoke6s[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return try R.consumeDart(
                object: env.check { exn in
                    invoke(
                        escapingRef.object,
                        try P0.toDartObject(p0, env: env),
                        try P1.toDartObject(p1, env: env),
                        try P2.toDartObject(p2, env: env),
                        try P3.toDartObject(p3, env: env),
                        try P4.toDartObject(p4, env: env),
                        try P5.toDartObject(p5, env: env),
                        exn
                    )
                },
                env: env
            )
        }
    }

    public static func toDart(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction6 { p0, p1, p2, p3, p4, p5, env in
            let v0 = try P0.peekDart(object: p0, env: env)
            let v1 = try P1.peekDart(object: p1, env: env)
            let v2 = try P2.peekDart(object: p2, env: env)
            let v3 = try P3.peekDart(object: p3, env: env)
            let v4 = try P4.peekDart(object: p4, env: env)
            let v5 = try P5.peekDart(object: p5, env: env)
            return try R.toDartObject(value(v0, v1, v2, v3, v4, v5), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try env.check { exn in
            guard let constructor = SwiftFunctionImpl.constructors[ObjectIdentifier(Self.self)]?[env] else {
                fatalError("type \(Self.self) not set up properly")
            }
            return constructor(ptr, exn)
        }
    }
}
