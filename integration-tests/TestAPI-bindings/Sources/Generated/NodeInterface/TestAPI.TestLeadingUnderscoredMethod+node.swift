// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestLeadingUnderscoredMethod: TestAPI.TestLeadingUnderscoredMethod {
    let _nodeWitness: NodeReference

    var _leadingUnderscoreMethodImpl: (() -> String)?
    public func _leadingUnderscoreMethod() throws -> String {
        _leadingUnderscoreMethodImpl!()
    }
}
extension TestAPI_CommonInterface._TestLeadingUnderscoredMethodConverter: NodeMutator {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        return _NodeTestLeadingUnderscoredMethod(
            _nodeWitness: try NodeReference(env: env, value: value)
        )
    }
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestLeadingUnderscoredMethod", env: env)
        let args: [NAPI.Value] = [
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: SwiftType, this: NAPI.Value, env: NAPI.Env) throws {
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestLeadingUnderscoredMethod",
            properties: [
                "_leadingUnderscoreMethod": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "_leadingUnderscoreMethod", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestLeadingUnderscoredMethodConverter.self)._leadingUnderscoreMethod(
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
                callbackBody(env, info, name: "TestLeadingUnderscoredMethod_constructor", expectedArgumentCount: 0) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestLeadingUnderscoredMethod",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
