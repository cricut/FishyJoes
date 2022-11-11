// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Bytes_setup")
public func TestAPI_Bytes_setup(
) {
}

extension Bytes: IotaConverter {
    public static func peekIota(_ value: csObject) throws -> Self {
        throw UninhabitedTypeCreationError(self)
    }

    public static func toIota(_ value: Self) throws -> csObject {
    }
}
