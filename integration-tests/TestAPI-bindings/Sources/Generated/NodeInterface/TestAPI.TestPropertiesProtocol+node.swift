// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestPropertiesProtocol: TestAPI.TestPropertiesProtocol {
    let _nodeWitness: NodeReference

    var corge: String
    var frob: Array<Double>
}

extension TestAPI_CommonInterface._TestPropertiesProtocolConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            guard let nonNilPointer = try env.unwrap(value) else {
                throw JSException(message: "expected TestAPI.TestPropertiesProtocol, got nil")
            }
            return try Box<TestAPI.TestPropertiesProtocol>.takeUnretained(value, env: env).value
        } catch {
            return _NodeTestPropertiesProtocol(
                _nodeWitness: try NodeReference(env: env, value: value),
                corge: String(),
                frob: [Double]()
            )
        }
    }
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestPropertiesProtocol", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_TestPropertiesProtocol",
            properties: [
                "corge": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "corge", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(env.this(converter: TestAPI_CommonInterface._TestPropertiesProtocolConverter.self).corge, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "frob": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "frob", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.Double>.toNode(env.this(converter: TestAPI_CommonInterface._TestPropertiesProtocolConverter.self).frob, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_TestPropertiesProtocol_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestPropertiesProtocol>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_TestPropertiesProtocol",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
