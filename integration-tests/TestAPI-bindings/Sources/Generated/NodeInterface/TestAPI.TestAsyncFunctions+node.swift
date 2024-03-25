// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestAsyncFunctions: TestAPI.TestAsyncFunctions {
    let _nodeWitness: NodeReference

    var const42: () async -> Int
}
extension TestAPI_CommonInterface._TestAsyncFunctionsConverter: NodeMutator {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        return _NodeTestAsyncFunctions(
            _nodeWitness: try NodeReference(env: env, value: value),
            const42: AsyncFunctions.AFun0()
        )
    }
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestAsyncFunctions", env: env)
        let args: [NAPI.Value] = [
            try AsyncFunction0Converter<Swift.Int>.toNode(value.const42, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: SwiftType, this: NAPI.Value, env: NAPI.Env) throws {
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestAsyncFunctions",
            properties: [
                "const42": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "const42", expectedArgumentCount: 0) { env in
                                try AsyncFunction0Converter<Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).const42, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestAsyncFunctions_constructor", expectedArgumentCount: 1) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "const42", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestAsyncFunctions",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
