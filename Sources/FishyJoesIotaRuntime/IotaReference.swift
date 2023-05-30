import FishyJoesCommonRuntime
import Foundation

class IotaReference {
    let object: foreignObject

    init(_ object: foreignObject) throws {
        self.object = object.flatMap(Env.newRef)
    }

    init(take object: foreignObject) {
        self.object = object
    }

    deinit {
        if let object = object {
            Env.deleteRef(object)
        }
    }
}
