import FishyJoesCommonRuntime
import Foundation

public struct FunctionInfo {
    public typealias Constructor = @convention(c) (
        _ context: OpaquePointer,
        _ ref: UnsafeMutableRawPointer,
        _ exn: foreignOutExn
    ) -> foreignObject
    // For invoke methods, Iota side is responsible for consuming args
    public typealias InvokeMethod = @convention(c) (
        _ context: OpaquePointer,
        _ fn: foreignObject,
        _ args: UnsafePointer<foreignObject>?,
        _ exn: foreignOutExn
    ) -> foreignObject

    var invokeMethod: InvokeMethod
    var constructor: Constructor
    var context: OpaquePointer

    static let infos = Env.CallbackMap<[ObjectIdentifier: FunctionInfo]>()

    static subscript(env: Env, type: Any.Type) -> FunctionInfo {
        guard let info = infos[env]?[ObjectIdentifier(type)] else {
            fatalError("type \(type) not set up properly in this isolate")
        }
        return info
    }

    func invoke(
        _ fnObject: foreignObject,
        _ args: [foreignObject],
        env: Env
    ) throws -> foreignObject {
        try env.check { exn in
            args.withUnsafeBufferPointer { buffer in
                invokeMethod(
                    context,
                    fnObject,
                    buffer.baseAddress,
                    exn
                )
            }
        }
    }

    func construct(
        _ ref: UnsafeMutableRawPointer,
        env: Env
    ) throws -> foreignObject {
        try env.check { exn in
            constructor(context, ref, exn)
        }
    }
}

// Shared setup for all 7 function converters
@_cdecl("FishyJoesRuntime_FunctionConverter_setup")
public func FunctionConverter_setup(
    _ envRef: EnvRef,
    _ name: UnsafePointer<unichar>,
    _ constructor: @escaping FunctionInfo.Constructor,
    _ invoke: @escaping FunctionInfo.InvokeMethod,
    _ context: OpaquePointer,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    env.catching(to: exn) {
        let name = String(decodingCString: name, as: Unicode.UTF16.self)
        guard let typeID = Env.typeID(name: name),
              let identifier = Env.objectID(typeID: typeID)
        else {
            fatalError("unregistered typeID '\(name)'")
        }
        FunctionInfo.infos[env, default: [:]][identifier] = FunctionInfo(
            invokeMethod: invoke,
            constructor: constructor,
            context: context
        )
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

extension Function0Converter: IotaConverter where R: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try IotaReference(value, env: env)
        let initThread = Thread.current
        return {
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            return try R.consumeIota(
                object: FunctionInfo[env, Self.self].invoke(
                    escapingRef.object,
                    [
                    ],
                    env: env
                ),
                env: env
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction0 { env in
            try R.toIotaObject(value(), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try FunctionInfo[env, self].construct(ptr, env: env)
    }
}

extension Function1Converter: IotaConverter where R: IotaConverter, P0: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try IotaReference(value, env: env)
        let initThread = Thread.current
        return { p0 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }

            return try R.consumeIota(
                object: FunctionInfo[env, Self.self].invoke(
                    escapingRef.object,
                    [
                        P0.toIotaObject(p0, env: env),
                    ],
                    env: env
                ),
                env: env
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction1 { p0, env in
            let v0 = try P0.peekIota(object: p0, env: env)
            return try R.toIotaObject(value(v0), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try FunctionInfo[env, self].construct(ptr, env: env)
    }
}

extension Function2Converter: IotaConverter where R: IotaConverter, P0: IotaConverter, P1: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try IotaReference(value, env: env)
        let initThread = Thread.current
        return { p0, p1 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }

            return try R.consumeIota(
                object: FunctionInfo[env, Self.self].invoke(
                    escapingRef.object,
                    [
                        P0.toIotaObject(p0, env: env),
                        P1.toIotaObject(p1, env: env),
                    ],
                    env: env
                ),
                env: env
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction2 { p0, p1, env in
            let v0 = try P0.peekIota(object: p0, env: env)
            let v1 = try P1.peekIota(object: p1, env: env)
            return try R.toIotaObject(value(v0, v1), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try FunctionInfo[env, self].construct(ptr, env: env)
    }
}

extension Function3Converter: IotaConverter where R: IotaConverter, P0: IotaConverter, P1: IotaConverter, P2: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try IotaReference(value, env: env)
        let initThread = Thread.current
        return { p0, p1, p2 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }

            return try R.consumeIota(
                object: FunctionInfo[env, Self.self].invoke(
                    escapingRef.object,
                    [
                        P0.toIotaObject(p0, env: env),
                        P1.toIotaObject(p1, env: env),
                        P2.toIotaObject(p2, env: env),
                    ],
                    env: env
                ),
                env: env
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction3 { p0, p1, p2, env in
            let v0 = try P0.peekIota(object: p0, env: env)
            let v1 = try P1.peekIota(object: p1, env: env)
            let v2 = try P2.peekIota(object: p2, env: env)
            return try R.toIotaObject(value(v0, v1, v2), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try FunctionInfo[env, self].construct(ptr, env: env)
    }
}

extension Function4Converter: IotaConverter where R: IotaConverter, P0: IotaConverter, P1: IotaConverter, P2: IotaConverter, P3: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try IotaReference(value, env: env)
        let initThread = Thread.current
        return { p0, p1, p2, p3 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }

            return try R.consumeIota(
                object: FunctionInfo[env, Self.self].invoke(
                    escapingRef.object,
                    [
                        P0.toIotaObject(p0, env: env),
                        P1.toIotaObject(p1, env: env),
                        P2.toIotaObject(p2, env: env),
                        P3.toIotaObject(p3, env: env),
                    ],
                    env: env
                ),
                env: env
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction4 { p0, p1, p2, p3, env in
            let v0 = try P0.peekIota(object: p0, env: env)
            let v1 = try P1.peekIota(object: p1, env: env)
            let v2 = try P2.peekIota(object: p2, env: env)
            let v3 = try P3.peekIota(object: p3, env: env)
            return try R.toIotaObject(value(v0, v1, v2, v3), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try FunctionInfo[env, self].construct(ptr, env: env)
    }
}

extension Function5Converter: IotaConverter where R: IotaConverter, P0: IotaConverter, P1: IotaConverter, P2: IotaConverter, P3: IotaConverter, P4: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try IotaReference(value, env: env)
        let initThread = Thread.current
        return { p0, p1, p2, p3, p4 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }

            return try R.consumeIota(
                object: FunctionInfo[env, Self.self].invoke(
                    escapingRef.object,
                    [
                        P0.toIotaObject(p0, env: env),
                        P1.toIotaObject(p1, env: env),
                        P2.toIotaObject(p2, env: env),
                        P3.toIotaObject(p3, env: env),
                        P4.toIotaObject(p4, env: env),
                    ],
                    env: env
                ),
                env: env
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction5 { p0, p1, p2, p3, p4, env in
            let v0 = try P0.peekIota(object: p0, env: env)
            let v1 = try P1.peekIota(object: p1, env: env)
            let v2 = try P2.peekIota(object: p2, env: env)
            let v3 = try P3.peekIota(object: p3, env: env)
            let v4 = try P4.peekIota(object: p4, env: env)
            return try R.toIotaObject(value(v0, v1, v2, v3, v4), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try FunctionInfo[env, self].construct(ptr, env: env)
    }
}

extension Function6Converter: IotaConverter where R: IotaConverter, P0: IotaConverter, P1: IotaConverter, P2: IotaConverter, P3: IotaConverter, P4: IotaConverter, P5: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        let escapingRef = try IotaReference(value, env: env)
        let initThread = Thread.current
        return { p0, p1, p2, p3, p4, p5 in
            guard initThread == Thread.current else {
                fatalError("Callback invoked on different thread")
            }
            return try R.consumeIota(
                object: FunctionInfo[env, Self.self].invoke(
                    escapingRef.object,
                    [
                        P0.toIotaObject(p0, env: env),
                        P1.toIotaObject(p1, env: env),
                        P2.toIotaObject(p2, env: env),
                        P3.toIotaObject(p3, env: env),
                        P4.toIotaObject(p4, env: env),
                        P5.toIotaObject(p5, env: env),
                    ],
                    env: env
                ),
                env: env
            )
        }
    }

    public static func toIota(_ value: @escaping SwiftType, env: Env) throws -> foreignObject {
        let erased = AnyFunction6 { p0, p1, p2, p3, p4, p5, env in
            let v0 = try P0.peekIota(object: p0, env: env)
            let v1 = try P1.peekIota(object: p1, env: env)
            let v2 = try P2.peekIota(object: p2, env: env)
            let v3 = try P3.peekIota(object: p3, env: env)
            let v4 = try P4.peekIota(object: p4, env: env)
            let v5 = try P5.peekIota(object: p5, env: env)
            return try R.toIotaObject(value(v0, v1, v2, v3, v4, v5), env: env)
        }
        let ptr = Box(erased).retainedOpaque()
        return try FunctionInfo[env, self].construct(ptr, env: env)
    }
}
