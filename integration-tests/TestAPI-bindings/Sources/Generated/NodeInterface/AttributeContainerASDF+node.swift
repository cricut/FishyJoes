// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension AttributeContainerASDF: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributeContainerASDF {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributeContainerASDF, got nil")
        }
        return try Box<AttributeContainerASDF>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributeContainerASDF, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "AttributeContainer", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributeContainerASDF, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributeContainerASDF, got nil")
        }
        try Box<AttributeContainerASDF>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributeContainer",
            properties: [
                "createEmpty": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "createEmpty", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try AttributeContainerASDF.toNode(
                                AttributeContainerASDF(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "merge": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "merge", expectedArgumentCount: 1, hasNamedOptions: true) { env in
                            var mutatingSelf = try env.this(converter: AttributeContainerASDF.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.merge(
                                    try env.argument(at: 0, converter: AttributeContainerASDF.self),
                                    mergePolicy: try env.argument(named: "mergePolicy", default: nil, converter: OptionalConverter<AttributedStringASDF.AttributeMergePolicy>.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "attributes": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "attributes", expectedArgumentCount: 0) { env in
                                try DictionaryConverter<Swift.String, Swift.String>.toNode(env.this(converter: AttributeContainerASDF.self).attributes, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributeContainer_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributeContainerASDF>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributeContainer",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
