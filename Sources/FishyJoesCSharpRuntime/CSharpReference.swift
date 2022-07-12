import FishyJoesCommonRuntime
import Foundation

class CSharpReference {
    let object: csObject

    init(_ object: csObject) {
        self.object = object.flatMap(Env.newRef)
    }

    init(take object: csObject) {
        self.object = object
    }

    deinit {
        if let object = object {
            Env.deleteRef(object)
        }
    }
}
