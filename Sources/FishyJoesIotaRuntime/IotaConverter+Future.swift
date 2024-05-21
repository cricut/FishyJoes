import FishyJoesCommonRuntime
import Foundation

public struct IotaSwiftFuture {
    public typealias Constructor = @convention(c) (
        _ context: OpaquePointer,
        _ outPromise: UnsafeMutablePointer<foreignObject>,
        _ exn: foreignOutExn
    ) -> foreignObject
    public typealias SinkFutureMethod = @convention(c) (
        _ context: OpaquePointer,
        _ future: foreignObject,
        _ handlerContext: foreignObject,
        _ exn: foreignOutExn
    ) -> Void
    public typealias ResolveRejectMethod = @convention(c) (
        _ context: OpaquePointer,
        _ promise: foreignObject,
        _ result: foreignObject,
        _ exn: foreignOutExn
    ) -> Void

    static var interfaces = Env.CallbackMap<[ObjectIdentifier: IotaSwiftFuture]>()

    typealias SinkContext = (Result<foreignObject, any Error>, Env) -> Void

    var constructor: Constructor
    var sinkFutureMethod: SinkFutureMethod
    var resolveMethod: ResolveRejectMethod
    var rejectMethod: ResolveRejectMethod
    var context: OpaquePointer

    public func construct(env: Env) throws -> (foreignObject, foreignObject) {
        var promise: foreignObject = nil
        let future = try env.check { exn in constructor(context, &promise, exn) }
        return (future, promise)
    }

    public func sink(future: foreignObject, handlerContext: foreignObject, env: Env) throws {
        try env.check { exn in sinkFutureMethod(context, future, handlerContext, exn) }
    }

    public func resolve(promise: foreignObject, _ value: foreignObject, env: Env) throws {
        try env.check { exn in resolveMethod(context, promise, value, exn) }
    }
    public func reject(promise: foreignObject, _ error: foreignObject, env: Env) throws {
        try env.check { exn in rejectMethod(context, promise, error, exn) }
    }
}

@_cdecl("FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler")
public func FutureConverter_invokeSinkHandler(
    envRef: EnvRef,
    context: foreignObject,
    success: UInt32,
    result: foreignObject,
    exn: foreignOutExn
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
    exn: foreignOutExn
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
    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
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

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        guard let interface = IotaSwiftFuture.interfaces[env][ObjectIdentifier(Self.self)] else {
            fatalError("Type \(SwiftType.self) improperly set up")
        }
        let (future, promise) = try interface.construct(env: env)
        value.sink { result in
            env.onThread {
                // Any errors before `resolution` will be passed to the promise.
                // Any errors inside `resolution` are fatal, as the promise is potentially used-up.
                let resolution: () throws -> Void
                do {
                    let iotaSuccess = try OutputConverter.toIotaObject(result.get(), env: env)
                    resolution = { try interface.resolve(promise: promise, iotaSuccess, env: env) }
                } catch {
                    let iotaError = env.newError(error)
                    resolution = { try interface.reject(promise: promise, iotaError, env: env) }
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
