// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Collections_setup")
public func TestAPI_Collections_setup(
) {
}

extension Collections: IotaConverter {
    public static func peekIota(_ value: foreignObject) throws -> Self {
        throw UninhabitedTypeCreationError(self)
    }

    public static func toIota(_ value: Self) throws -> foreignObject {
    }
}
