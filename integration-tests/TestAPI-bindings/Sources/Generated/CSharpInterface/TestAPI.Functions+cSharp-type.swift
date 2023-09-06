<<<<<<<< HEAD:integration-tests/TestAPI-bindings/Sources/Generated/IotaInterface/Functions+iota-type.swift
// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
========
// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
>>>>>>>> origin/main:integration-tests/TestAPI-bindings/Sources/Generated/CSharpInterface/TestAPI.Functions+cSharp-type.swift
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Functions_setup")
public func TestAPI_Functions_setup(
    envRef: EnvRef
) {
}

<<<<<<<< HEAD:integration-tests/TestAPI-bindings/Sources/Generated/IotaInterface/Functions+iota-type.swift
extension Functions: IotaConverter {
    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
========
extension TestAPI.Functions: CSharpConverter {
    public static func peekCSharp(_ value: csObject) throws -> Self {
>>>>>>>> origin/main:integration-tests/TestAPI-bindings/Sources/Generated/CSharpInterface/TestAPI.Functions+cSharp-type.swift
        throw UninhabitedTypeCreationError(self)
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
    }
}
