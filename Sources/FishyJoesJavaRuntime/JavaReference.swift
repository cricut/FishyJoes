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

    public convenience init<T: JavaConverter>(local: T, env: Env) throws where T.SwiftType == T, T.CType == T {
        try self.init(
            local: T.toJavaObject(
                local,
                env: env
            ),
            env: env
        )
    }

    deinit {
        try? destroy()
    }

    public func createLocalRef(env: Env) -> jobject? {
        env.NewLocalRef(object)
    }

    public func destroy() throws {
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
