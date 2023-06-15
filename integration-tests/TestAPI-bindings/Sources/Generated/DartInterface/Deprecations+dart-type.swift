// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesDartRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Deprecations_setup")
public func TestAPI_Deprecations_setup(
    envRef: EnvRef
) {
}

extension Deprecations: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> Self {
        throw UninhabitedTypeCreationError(self)
    }

    public static func toDart(_ value: Self, env: Env) throws -> foreignObject {
    }
}
