import FishyJoesCommonRuntime
import Foundation
import JNI

class JavaReference {
    let object: jobject?
    private var vm: UnsafeMutablePointer<JavaVM?>?

    init(local: jobject?, env: Env) throws {
        self.object = try env.globalRef(local)
        vm = try env.GetJavaVM()
    }

    deinit {
        if let object = object {
            var envRaw: UnsafeMutableRawPointer?
            guard vm!.pointee!.pointee.GetEnv(vm, &envRaw, JNI_VERSION_1_4) == JNI_OK else {
                fatalError("Couldn't obtain jvm environment")
            }
            let env = Env(env: UnsafeMutablePointer<JNIEnv?>(OpaquePointer(envRaw))!)
            env.DeleteGlobalRef(object)
        }
    }
}
