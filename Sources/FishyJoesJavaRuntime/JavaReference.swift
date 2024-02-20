import FishyJoesCommonRuntime
import Foundation
import JNI

public class JavaReference {
    public private(set) var object: jobject?
    private let vm: UnsafeMutablePointer<JavaVM?>?
    @inline(__always)
    private var fns: JavaVM.Pointee {
        vm!.pointee!.pointee
    }

    public init(local: jobject?, env: Env) throws {
        self.object = try local.map { try env.globalRef($0) }
        vm = try env.GetJavaVM()
    }

    deinit {
        try? destroy()
    }

    public func createLocalRef(env: Env) -> jobject? {
        object.flatMap { env.NewLocalRef($0) }
    }

    public func destroy() throws {
        if let object = object {
            let javaEnv = try Env.acquireJVMThread(on: vm)
            defer { try! Env.relinquishJVMThread(on: vm) }
            javaEnv.DeleteGlobalRef(object)
            self.object = nil
        }
    }

    /// Gets or creates the JNI environment associated with the current thread
    public func currentThreadEnv() throws -> Env {
        var envRaw: UnsafeMutableRawPointer?

        switch fns.GetEnv(vm, &envRaw, JNI_VERSION_1_4) {
        case JNI_EDETACHED:
            print("attaching thread \(Thread.current) to JVM")
            let opaquePtr = OpaquePointer(envRaw)
            var envUnraw = UnsafeMutablePointer<JNIEnv?>(opaquePtr)
            try javaOk(fns.AttachCurrentThread(vm, &envUnraw, nil))
        case let retCode:
            try javaOk(retCode)
        }
        let env = UnsafeMutablePointer<JNIEnv?>(OpaquePointer(envRaw))
        return Env(env: try javaNonNull(env))
    }
}
