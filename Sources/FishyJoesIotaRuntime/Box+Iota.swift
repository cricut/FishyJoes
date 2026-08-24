import FishyJoesCommonRuntime
import Foundation

extension Box {
    public static func peekIota(_ value: HostObject, env: Env) throws -> Box<T> {
        try Box(inner: AnyBox.peekIota(value, env: env))
    }

    public static func consumeIota(_ value: HostObject, env: Env) throws -> Box<T> {
        try Box(inner: AnyBox.consumeIota(value, env: env))
    }

    public func toIota(env: Env) throws -> HostObject {
        try box.toIota(env: env)
    }
}

@_cdecl("FishyJoesCommonRuntime_AnyBox_setup")
public func AnyBoxSetup(
    envRef: EnvRef,
    constructor: @escaping IotaSwiftReferenceConstructor,
    refGetter: @escaping IotaSwiftReferencePointerGetter
) {
    let env = Env(envRef)
    if AnyBox.refGetter.isInitialized(env) { return }
    AnyBox.constructor[env] = constructor
    AnyBox.refGetter[env] = refGetter
}

@_cdecl("FishyJoesCommonRuntime_AnyBox_releaseRef")
public func AnyBoxRelease(envRef: EnvRef, ptr: UnsafeMutableRawPointer?, _ exn: OutHostException) {
    let env = Env(envRef)
    env.catching(to: exn) {
        AnyBox.releaseOpaque(try Env.unwrap(ptr))
    }
}

@_cdecl("FishyJoesCommonRuntime_AnyBox_toString")
public func toString(envRef: EnvRef, ptr: UnsafeMutableRawPointer?, _ exn: OutHostException) -> HostObject {
    let env = Env(envRef)
    return env.catching(to: exn) {
        try String.toIota("\(AnyBox.takeUnretainedOpaque(try Env.unwrap(ptr)).value)", env: env)
    }
}

/// Type of iota callback for creating a host-side wrapper around a swift object. Specific subclass of host's SwiftReference type will vary.
public typealias IotaSwiftReferenceConstructor = @convention(c) (UnsafeMutableRawPointer?, _ exn: OutHostException) -> HostObject
/// Type of iota callback for getting the swift pointer back out of a host-side reference wrapper.
public typealias IotaSwiftReferencePointerGetter = @convention(c) (HostObject, _ exn: OutHostException) -> UnsafeMutableRawPointer?

extension AnyBox {
    fileprivate static var constructor = Env.CallbackMap<IotaSwiftReferenceConstructor>()
    fileprivate static var refGetter = Env.CallbackMap<IotaSwiftReferencePointerGetter>()

    public static func peekIota(_ value: HostObject, env: Env) throws -> AnyBox {
        let ref = try env.check { exn in refGetter[env](value, exn) }
        return takeUnretainedOpaque(try Env.unwrap(ref))
    }

    public static func consumeIota(_ value: HostObject, env: Env) throws -> AnyBox {
        defer { env.deleteRef(value) }
        return try peekIota(value, env: env)
    }

    public func toIota(env: Env) throws -> HostObject {
        let ptr = retainedOpaque()
        return try env.check { exn in AnyBox.constructor[env](ptr, exn) }
    }
}
