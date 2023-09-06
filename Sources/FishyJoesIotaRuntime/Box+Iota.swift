import FishyJoesCommonRuntime
import Foundation

extension Box {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> Box<T> {
        try Box(inner: AnyBox.peekIota(value, env: env))
    }
}

@_cdecl("FishyJoesCommonRuntime_AnyBox_setup")
public func AnyBoxSetup(envRef: EnvRef, refGetter: @escaping AnyBox.RefGetter) {
    let env = Env(envRef)
    if AnyBox.refGetter.isInitialized(env) { return }
    AnyBox.refGetter[env] = refGetter
}

@_cdecl("FishyJoesCommonRuntime_AnyBox_releaseRef")
public func AnyBoxRelease(envRef: EnvRef, ptr: UnsafeMutableRawPointer?, _ exn: foreignOutExn) {
    let env = Env(envRef)
    env.catching(to: exn) {
        AnyBox.releaseOpaque(try Env.unwrap(ptr))
    }
}

@_cdecl("FishyJoesCommonRuntime_AnyBox_toString")
public func toString(envRef: EnvRef, ptr: UnsafeMutableRawPointer?, _ exn: foreignOutExn) -> foreignObject {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try String.toIota("\(AnyBox.takeUnretainedOpaque(try Env.unwrap(ptr)).value)", env: env)
    }
}

extension AnyBox {
    public typealias RefGetter = @convention(c) (foreignObject, _ exn: foreignOutExn) -> UnsafeMutableRawPointer?
    fileprivate static var refGetter = Env.CallbackMap<RefGetter>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> AnyBox {
        let ref = try env.check { exn in refGetter[env](value, exn) }
        return takeUnretainedOpaque(try Env.unwrap(ref))
    }
}
