// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestLeadingUnderscoredProp: TestAPI.TestLeadingUnderscoredProp {
    let _nodeWitness: NodeReference

    var _leadingUnderscoreProp: String
}
extension TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter: NodeMutator {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        return _NodeTestLeadingUnderscoredProp(
            _nodeWitness: try NodeReference(env: env, value: value),
            _leadingUnderscoreProp: String()
        )
    }
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestLeadingUnderscoredProp", env: env)
        let args: [NAPI.Value] = [
            try Swift.String.toNode(value._leadingUnderscoreProp, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: SwiftType, this: NAPI.Value, env: NAPI.Env) throws {
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestLeadingUnderscoredProp",
            properties: [
                "_leadingUnderscoreProp": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "_leadingUnderscoreProp", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(env.this(converter: TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter.self)._leadingUnderscoreProp, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestLeadingUnderscoredProp_constructor", expectedArgumentCount: 1) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "_leadingUnderscoreProp", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestLeadingUnderscoredProp",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
