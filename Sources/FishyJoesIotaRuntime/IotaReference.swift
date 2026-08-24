import FishyJoesCommonRuntime
import Foundation

public class IotaReference {
    public let object: HostObject
    public let env: Env

    public init(_ object: HostObject, env: Env) throws {
        self.env = env
        self.object = object.flatMap(env.newRef)
    }

    public init(take object: HostObject, env: Env) {
        self.env = env
        self.object = object
    }

    deinit {
        if let object = object {
            env.onThread { [env] in
                env.deleteRef(object)
            }
        }
    }
}
