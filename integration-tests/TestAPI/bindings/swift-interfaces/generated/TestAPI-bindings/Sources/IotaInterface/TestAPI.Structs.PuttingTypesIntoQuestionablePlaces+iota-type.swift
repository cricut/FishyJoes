// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup")
public func TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup(
    envRef: EnvRef,
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.Structs.PuttingTypesIntoQuestionablePlaces._constructorMethod.isInitialized(env) { return }
    TestAPI.Structs.PuttingTypesIntoQuestionablePlaces._constructorMethod[env] = constructorMethod
}

extension TestAPI.Structs.PuttingTypesIntoQuestionablePlaces: IotaReferenceMutator {
    fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> TestAPI.Structs.PuttingTypesIntoQuestionablePlaces {
        try Box<TestAPI.Structs.PuttingTypesIntoQuestionablePlaces>.peekIota(value, env: env).value
    }

    public static func toIota(_ value: TestAPI.Structs.PuttingTypesIntoQuestionablePlaces, env: Env) throws -> foreignObject {
        let ptr = Box(value).retainedOpaque()
        return try env.check { exn in _constructorMethod[env](ptr, exn) }
    }
}
