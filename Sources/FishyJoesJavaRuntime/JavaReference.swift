import FishyJoesCommonRuntime
import Foundation
import JNI

public class JavaReference {
    public private(set) var object: jobject?
    private let vm: UnsafeMutablePointer<JavaVM?>?

    public init(local: jobject?, env: Env) throws {
        self.object = try env.globalRef(local)
        vm = try env.GetJavaVM()
    }

    deinit {
        try? destroy()
    }

    public func createLocalRef(env: Env) -> jobject? {
        env.NewLocalRef(object)
    }

    public func destroy() throws {
        if let object = object {
            let javaEnv = try Env.acquireJVMThread(on: vm)
            defer {
                try! Env.relinquishJVMThread(on: vm)
            }
            javaEnv.DeleteGlobalRef(object)
            self.object = nil
        }
    }
}
