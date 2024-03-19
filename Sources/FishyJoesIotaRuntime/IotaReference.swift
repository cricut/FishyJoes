import FishyJoesCommonRuntime
import Foundation

public class IotaReference {
    public let object: foreignObject
    public let env: Env

    public init(_ object: foreignObject, env: Env) throws {
        self.env = env
        self.object = object.flatMap(env.newRef)
    }

    public init(take object: foreignObject, env: Env) {
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
