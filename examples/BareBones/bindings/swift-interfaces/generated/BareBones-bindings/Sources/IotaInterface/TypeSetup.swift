// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import BareBones
import BareBones_CommonInterface
import FishyJoesIotaRuntime
import Foundation

@_cdecl("FishyJoes_BareBones_registerTypes")
public func FishyJoes_BareBones_registerTypes() {
    Env.registerType(BareBones.Skeleton.self, as: "BareBones.Skeleton")
    Env.registerType(Swift.Int.self, as: "Swift.Int")
}
