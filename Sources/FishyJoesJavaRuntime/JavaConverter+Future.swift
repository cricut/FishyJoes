import FishyJoesCommonRuntime
import Foundation
import JNI

enum JavaFutureImpl {
    static var deferredClass: jclass!

    static var completableDeferredClass: jclass!
    static var completeMethod: jmethodID!
    static var completeExceptionallyMethod: jmethodID!

    static var futureImplClass: jclass!
    static var createCompletableMethod: jmethodID!
    static var sinkFutureMethod: jmethodID!

    typealias SinkContext = (Result<jobject?, any Error>, Env) -> Void
    static let cSinkResult: @convention(c) (UnsafeMutablePointer<JNIEnv?>, jobject, jobject?, jboolean, jobject?) -> Void = { env, _, context, success, result in
        callbackBody(env) { env in
            let context = try Box<SinkContext>.fromJava(context, env: env)
            if success != JNI_FALSE {
                context.value(.success(result), env)
            } else {
                context.value(.failure(try JavaThrowableError(local: result, env: env)), env)
            }
        }
    }

    static func javaSetup(env: Env) throws {
        guard deferredClass == nil else { return }

        completableDeferredClass = try env.globalRef(env.FindClass("kotlinx/coroutines/CompletableDeferred"))
        completeMethod = try env.GetMethodID(completableDeferredClass, "complete", "(Ljava/lang/Object;)Z")
        completeExceptionallyMethod = try env.GetMethodID(completableDeferredClass, "completeExceptionally", "(Ljava/lang/Throwable;)Z")

        futureImplClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/SwiftFutureImpl"))
        createCompletableMethod = try env.GetStaticMethodID(futureImplClass, "createCompletable", "()Lkotlinx/coroutines/CompletableDeferred;")
        sinkFutureMethod = try env.GetStaticMethodID(futureImplClass, "sinkFuture", "(Lkotlinx/coroutines/Deferred;Ljava/lang/Object;)V")

        let bag = CStringBag()
        try env.RegisterNatives(
            futureImplClass,
            JNINativeMethod(
                name: bag.add("sinkResult"),
                signature: bag.add("(Ljava/lang/Object;ZLjava/lang/Object;)V"),
                fnPtr: unsafeBitCast(cSinkResult, to: UnsafeMutableRawPointer.self)
            )
        )
    }
}

// Convert from a Future<JavaReference> to a jobject?. Slightly lower level than `FutureConverter`
extension Future where Output == JavaReference {
    public func toJava(env: Env) throws -> jobject? {
        let jFuture = try env.CallStaticObjectMethod(
            JavaFutureImpl.futureImplClass,
            JavaFutureImpl.createCompletableMethod
        )
        let jFutureRef = try JavaReference(local: jFuture, env: env)
        let jvm = try env.GetJavaVM()
        sink { result in
            do {
                let env = try Env.acquireJVMThread(on: jvm)
                defer { try! Env.relinquishJVMThread(on: jvm) }

                let didComplete: jboolean
                switch result {
                case .success(let success):
                    didComplete = try env.CallBooleanMethod(
                        jFutureRef.object,
                        JavaFutureImpl.completeMethod,
                        jvalue(l: success.object)
                    )
                case .failure(let error):
                    didComplete = try env.CallBooleanMethod(
                        jFutureRef.object,
                        JavaFutureImpl.completeExceptionallyMethod,
                        jvalue(l: javaError(error: error, env: env))
                    )
                }
                if didComplete == JNI_FALSE {
                    print("WARNING: future completed twice!")
                }
            } catch {
                fatalError("unrecoverable failure while handling Future result: \(error)")
            }
        }
        return jFutureRef.createLocalRef(env: env)
    }
}

extension FutureConverter: JavaConverter where OutputConverter: JavaConverter {
    public static var javaClass: jclass? {
        JavaFutureImpl.completableDeferredClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let (future, promise) = Future<OutputConverter.SwiftType>.make()
        let sinkContextBox = Box<JavaFutureImpl.SinkContext> { result, env in
            let convertedResult = result.flatMap { value in
                Result {
                    try OutputConverter.fromJava(object: value, env: env)
                }
            }
            promise.handle(convertedResult)
        }
        try env.CallStaticVoidMethod(
            JavaFutureImpl.futureImplClass,
            JavaFutureImpl.sinkFutureMethod,
            jvalue(l: value),
            jvalue(l: sinkContextBox.toJava(env: env))
        )
        return future
    }

    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        let jFuture = try env.CallStaticObjectMethod(
            JavaFutureImpl.futureImplClass,
            JavaFutureImpl.createCompletableMethod
        )
        let jFutureRef = try JavaReference(local: jFuture, env: env)
        let jvm = try env.GetJavaVM()
        value.sink { result in
            do {
                let env = try Env.acquireJVMThread(on: jvm)
                defer { try! Env.relinquishJVMThread(on: jvm) }

                let didComplete: jboolean
                switch result {
                case .success(let success):
                    didComplete = try env.CallBooleanMethod(
                        jFutureRef.object,
                        JavaFutureImpl.completeMethod,
                        jvalue(l: OutputConverter.toJavaObject(success, env: env))
                    )
                case .failure(let error):
                    didComplete = try env.CallBooleanMethod(
                        jFutureRef.object,
                        JavaFutureImpl.completeExceptionallyMethod,
                        jvalue(l: javaError(error: error, env: env))
                    )
                }
                if didComplete == JNI_FALSE {
                    print("WARNING: future completed twice!")
                }
            } catch {
                fatalError("unrecoverable failure while handling Future result: \(error)")
            }
        }
        return jFutureRef.createLocalRef(env: env)
    }

    public static func javaSetup(env: Env) throws {
        try OutputConverter.javaSetup(env: env)
        try JavaFutureImpl.javaSetup(env: env)
    }
}
