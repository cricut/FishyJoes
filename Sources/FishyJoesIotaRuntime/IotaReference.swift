import FishyJoesCommonRuntime
import Foundation

class IotaReference {
    let object: foreignObject
    private let env: Env

    init(_ object: foreignObject, env: Env) throws {
        self.env = env
        self.object = object.flatMap(env.newRef)
    }

    init(take object: foreignObject, env: Env) {
        self.env = env
        self.object = object
    }

    deinit {
        if let object = object {
            env.deleteRef(object)
        }
    }
}
