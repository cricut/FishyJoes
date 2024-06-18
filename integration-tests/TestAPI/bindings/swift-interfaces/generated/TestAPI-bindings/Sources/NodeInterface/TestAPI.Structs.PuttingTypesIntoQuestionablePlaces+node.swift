// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.Structs.PuttingTypesIntoQuestionablePlaces: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.Structs.PuttingTypesIntoQuestionablePlaces {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.Structs.PuttingTypesIntoQuestionablePlaces, got nil")
        }
        return try Box<TestAPI.Structs.PuttingTypesIntoQuestionablePlaces>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.Structs.PuttingTypesIntoQuestionablePlaces, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "Structs_PuttingTypesIntoQuestionablePlaces", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.Structs.PuttingTypesIntoQuestionablePlaces, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.Structs.PuttingTypesIntoQuestionablePlaces, got nil")
        }
        try Box<TestAPI.Structs.PuttingTypesIntoQuestionablePlaces>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Structs_PuttingTypesIntoQuestionablePlaces",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.Structs.PuttingTypesIntoQuestionablePlaces.toNode(
                                TestAPI.Structs.PuttingTypesIntoQuestionablePlaces(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "testCall": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "testCall", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                env.this(converter: TestAPI.Structs.PuttingTypesIntoQuestionablePlaces.self).testCall(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Structs_PuttingTypesIntoQuestionablePlaces_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.Structs.PuttingTypesIntoQuestionablePlaces>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Structs_PuttingTypesIntoQuestionablePlaces",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
