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
        try? destory()
    }
    
    public func createLocalRef(env: Env) -> jobject? {
        env.NewLocalRef(object)
    }

    public func destory() throws {
        if let object = object {
            let javaEnv = try Env.aquireJVMThread(on: vm)
            defer {
                try? Env.relenquishJVMThread(on: vm)
            }
            javaEnv.DeleteGlobalRef(object)
            self.object = nil
        }
    }
}
