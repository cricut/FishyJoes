import FishyJoesCommonRuntime
import Foundation

public struct IotaSwiftFuture {
    public typealias Constructor = @convention(c) (
        _ context: OpaquePointer,
        _ outPromise: UnsafeMutablePointer<HostObject>,
        _ exn: OutHostException
    ) -> HostObject
    public typealias SinkFutureMethod = @convention(c) (
        _ context: OpaquePointer,
        _ future: HostObject,
        _ handlerContext: HostObject,
        _ exn: OutHostException
    ) -> Void
    public typealias ResolveRejectMethod = @convention(c) (
        _ context: OpaquePointer,
        _ promise: HostObject,
        _ result: HostObject,
        _ exn: OutHostException
    ) -> Void

    static var interfaces = Env.CallbackMap<[ObjectIdentifier: IotaSwiftFuture]>()

    typealias SinkContext = (Result<HostObject, any Error>, Env) -> Void

    var constructor: Constructor
    var sinkFutureMethod: SinkFutureMethod
    var resolveMethod: ResolveRejectMethod
    var rejectMethod: ResolveRejectMethod
    var context: OpaquePointer

    public func construct(env: Env) throws -> (HostObject, HostObject) {
        var promise: HostObject = nil
        let future = try env.check { exn in constructor(context, &promise, exn) }
        return (future, promise)
    }

    public func sink(future: HostObject, handlerContext: HostObject, env: Env) throws {
        try env.check { exn in sinkFutureMethod(context, future, handlerContext, exn) }
    }

    public func resolve(promise: HostObject, _ value: HostObject, env: Env) throws {
        try env.check { exn in resolveMethod(context, promise, value, exn) }
    }
    public func reject(promise: HostObject, _ error: HostObject, env: Env) throws {
        try env.check { exn in rejectMethod(context, promise, error, exn) }
    }
}

private struct SendableForeignObject: @unchecked Sendable {
    let value: HostObject
}

@_cdecl("FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler")
public func FutureConverter_invokeSinkHandler(
    envRef: EnvRef,
    context: HostObject,
    success: UInt32,
    result: HostObject,
    exn: OutHostException
) {
    let env = Env(envRef)
    env.catching(to: exn) {
        let context = try Box<IotaSwiftFuture.SinkContext>.consumeIota(context, env: env)
        if success != 0 {
            context.value(.success(result), env)
        } else {
            context.value(.failure(IotaException(consuming: result, env: env)), env)
        }
    }
}

@_cdecl("FishyJoesCommonRuntime_FutureConverter_setup")
public func FutureConverter_iota_setup(
    envRef: EnvRef,
    name: UnsafePointer<unichar>,
    constructor: @escaping IotaSwiftFuture.Constructor,
    sinkFutureMethod: @escaping IotaSwiftFuture.SinkFutureMethod,
    resolveMethod: @escaping IotaSwiftFuture.ResolveRejectMethod,
    rejectMethod: @escaping IotaSwiftFuture.ResolveRejectMethod,
    context: OpaquePointer,
    exn: OutHostException
) {
    let env = Env(envRef)
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeID(name: name),
          let identifier = Env.objectID(typeID: typeID)
    else {
        fatalError("unregistered typeID \(name)")
    }
    IotaSwiftFuture.interfaces[env, default: [:]][identifier] = IotaSwiftFuture(
        constructor: constructor,
        sinkFutureMethod: sinkFutureMethod,
        resolveMethod: resolveMethod,
        rejectMethod: rejectMethod,
        context: context
    )
}

extension FutureConverter: IotaConverter where OutputConverter: IotaConverter {
    public static func peekIota(_ value: HostObject, env: Env) throws -> SwiftType {
        guard let interface = IotaSwiftFuture.interfaces[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let (future, promise) = Future<OutputConverter.SwiftType>.make()
        let sinkContextBox = Box<IotaSwiftFuture.SinkContext> { result, env in
            let convertedResult = result.flatMap { value in
                Result {
                    try OutputConverter.consumeIota(object: value, env: env)
                }
            }
            promise.handle(convertedResult)
        }
        try interface.sink(
            future: value,
            handlerContext: sinkContextBox.toIota(env: env),
            env: env
        )
        return future
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> HostObject {
        guard let interface = IotaSwiftFuture.interfaces[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let (future, promise) = try interface.construct(env: env)
        let sendablePromise = SendableForeignObject(value: promise)
        value.sink { result in
            env.onThread {
                // Any errors before `resolution` will be passed to the promise.
                // Any errors inside `resolution` are fatal, as the promise is potentially used-up.
                let resolution: () throws -> Void
                do {
                    let iotaSuccess = try OutputConverter.toIotaObject(result.get(), env: env)
                    resolution = { try interface.resolve(promise: sendablePromise.value, iotaSuccess, env: env) }
                } catch {
                    let iotaError = env.newError(error)
                    resolution = { try interface.reject(promise: sendablePromise.value, iotaError, env: env) }
                }
                do {
                    try resolution()
                } catch {
                    fatalError("Error while resolving promise, unrecoverable. \(error)")
                }
            }
        }
        return future
    }
}
