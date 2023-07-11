// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesDartRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Bytes_setup")
public func TestAPI_Bytes_setup(
    envRef: EnvRef
) {
}

extension Bytes: DartConverter {
    public static func peekDart(_ value: foreignObject, env: Env) throws -> Self {
        throw UninhabitedTypeCreationError(self)
    }

    public static func toDart(_ value: Self, env: Env) throws -> foreignObject {
    }
}
