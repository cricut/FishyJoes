// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Functions_setup")
public func TestAPI_Functions_setup(
) {
}

extension TestAPI.Functions: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> Self {
        throw UninhabitedTypeCreationError(self)
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
    }
}
