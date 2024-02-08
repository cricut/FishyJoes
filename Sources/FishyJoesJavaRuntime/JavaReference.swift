import FishyJoesCommonRuntime
import Foundation
import JNI

public class JavaReference {
    public private(set) var object: jobject?
    public let vm: UnsafeMutablePointer<JavaVM?>?

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
}
