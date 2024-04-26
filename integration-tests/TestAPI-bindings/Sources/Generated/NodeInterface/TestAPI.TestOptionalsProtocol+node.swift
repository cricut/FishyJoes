// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestOptionalsProtocol: TestAPI.TestOptionalsProtocol {
    let _nodeWitness: NodeReference

    var flarp: Optional<String>
    var wombatImpl: (() -> Optional<Double>)?
    public func wombat(zxc: Optional<Int>) throws -> Optional<Double> {
        wombatImpl!()
    }
    var spqrImpl: (() -> Int)?
    public func spqr(_ pippo: AssociatedDataEnum) throws -> Int {
        spqrImpl!()
    }
}

extension TestAPI_CommonInterface._TestOptionalsProtocolConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            guard let nonNilPointer = try env.unwrap(value) else {
                throw JSException(message: "expected TestAPI.TestOptionalsProtocol, got nil")
            }
            return try Box<TestAPI.TestOptionalsProtocol>.takeUnretainedOpaque(nonNilPointer).value
        } catch {
            return _NodeTestOptionalsProtocol(
                _nodeWitness: try NodeReference(env: env, value: value),
                flarp: String()
            )
        }
    }
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestOptionalsProtocol", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_TestOptionalsProtocol",
            properties: [
                "wombat": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "wombat", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Double>.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestOptionalsProtocolConverter.self).wombat(
                                    zxc: try env.argument(at: 0, converter: OptionalConverter<Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "spqr": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "spqr", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestOptionalsProtocolConverter.self).spqr(
                                    try env.argument(at: 0, converter: TestAPI.AssociatedDataEnum.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "flarp": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "flarp", expectedArgumentCount: 0) { env in
                                try OptionalConverter<Swift.String>.toNode(env.this(converter: TestAPI_CommonInterface._TestOptionalsProtocolConverter.self).flarp, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_TestOptionalsProtocol_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestOptionalsProtocol>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_TestOptionalsProtocol",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
