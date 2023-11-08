// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AttributedStrings_setup")
public func TestAPI_AttributedStrings_setup(
    envRef: EnvRef
) {
}

extension TestAPI.AttributedStrings: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        throw UninhabitedTypeCreationError(self)
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
    }
}
