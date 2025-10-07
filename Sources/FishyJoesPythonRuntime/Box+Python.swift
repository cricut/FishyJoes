import FishyJoesCommonRuntime
import Foundation

extension Box {
    public static func peekPython(_ value: PyObjectPtr, env: Env) throws -> Box<T> {
        try Box(inner: AnyBox.peekPython(value, env: env))
    }

    public static func consumePython(_ value: PyObjectPtr, env: Env) throws -> Box<T> {
        try Box(inner: AnyBox.consumePython(value, env: env))
    }

    public func toPython(env: Env) throws -> PyObjectPtr {
        try box.toPython(env: env)
    }
}

@_cdecl("FishyJoesPythonRuntime_AnyBox_setup")
public func AnyBoxSetup(
    envRef: EnvRef,
    constructor: @escaping AnyBox.Constructor,
    refGetter: @escaping AnyBox.RefGetter
) {
    let env = Env(envRef)
    if AnyBox.refGetter.isInitialized(env) { return }
    AnyBox.constructor[env] = constructor
    AnyBox.refGetter[env] = refGetter
}

@_cdecl("FishyJoesPythonRuntime_AnyBox_releaseRef")
public func AnyBoxRelease(envRef: EnvRef, ptr: UnsafeMutableRawPointer?, _ exn: PyOutExn) {
    let env = Env(envRef)
    env.catching(to: exn) {
        AnyBox.releaseOpaque(try Env.unwrap(ptr))
    }
}

@_cdecl("FishyJoesPythonRuntime_AnyBox_toString")
public func toString(envRef: EnvRef, ptr: UnsafeMutableRawPointer?, _ exn: PyOutExn) -> PyObjectPtr {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try String.toPython("\(AnyBox.takeUnretainedOpaque(try Env.unwrap(ptr)).value)", env: env)
    }
}

extension AnyBox {
    public typealias Constructor = @convention(c) (UnsafeMutableRawPointer?, _ exn: PyOutExn) -> PyObjectPtr
    public typealias RefGetter = @convention(c) (PyObjectPtr, _ exn: PyOutExn) -> UnsafeMutableRawPointer?
    fileprivate static var constructor = Env.CallbackMap<Constructor>()
    fileprivate static var refGetter = Env.CallbackMap<RefGetter>()

    public static func peekPython(_ value: PyObjectPtr, env: Env) throws -> AnyBox {
        let ref = try env.check { exn in refGetter[env](value, exn) }
        return takeUnretainedOpaque(try Env.unwrap(ref))
    }

    public static func consumePython(_ value: PyObjectPtr, env: Env) throws -> AnyBox {
        defer { env.deleteRef(value) }
        return try peekPython(value, env: env)
    }

    public func toPython(env: Env) throws -> PyObjectPtr {
        let ptr = retainedOpaque()
        return try env.check { exn in AnyBox.constructor[env](ptr, exn) }
    }
}
