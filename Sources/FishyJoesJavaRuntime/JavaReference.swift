import Foundation
import JNI
import FishyJoesCommonRuntime

public class JavaReference {
    public let object: jobject?
    public let vm: JVM

    public init(local: jobject?, env: Env) throws {
        self.object = try env.globalRef(local)
        self.vm = try env.jvm()
    }

    deinit {
        if let object = object {
            try! vm.currentThreadEnv().DeleteGlobalRef(object)
        }
    }
}
