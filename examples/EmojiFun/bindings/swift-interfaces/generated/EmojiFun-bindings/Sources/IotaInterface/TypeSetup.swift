// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import EmojiFun
import EmojiFun_CommonInterface
import FishyJoesIotaRuntime
import Foundation

@_cdecl("FishyJoes_EmojiFun_registerTypes")
public func FishyJoes_EmojiFun_registerTypes() {
    Env.registerType(Function1Converter<Swift.String, Swift.Bool>.self, as: "Function1Converter<Swift.String, Swift.Bool>")
    Env.registerType(Function1Converter<Swift.String, Swift.Bool>.self, as: "Function1Converter<Swift.String, Swift.Bool>")
    Env.registerType(FutureConverter<Swift.Bool>.self, as: "FutureConverter<Swift.Bool>")
    Env.registerType(OptionalConverter<Swift.String>.self, as: "OptionalConverter<Swift.String>")
    Env.registerType(SetConverter<Swift.String>.self, as: "SetConverter<Swift.String>")
    Env.registerType(EmojiFun.EmojiExplorer.self, as: "EmojiFun.EmojiExplorer")
    Env.registerType(Swift.Bool.self, as: "Swift.Bool")
    Env.registerType(Swift.Int.self, as: "Swift.Int")
    Env.registerType(Swift.String.self, as: "Swift.String")
    Env.registerType(FishyJoesCommonRuntime.VoidConverter.self, as: "FishyJoesCommonRuntime.VoidConverter")
}
