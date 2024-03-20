// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestMutatingCounterProtocol: TestAPI.TestMutatingCounterProtocol {
    let _nodeWitness: NodeReference

    var count: Int
    var tickImpl: (() -> Void)?
    public func tick() throws {
        tickImpl!()
    }
    var witnessImpl: (() -> TestMutatingCounterProtocol)?
    public func witness() throws -> TestMutatingCounterProtocol {
        witnessImpl!()
    }
    var tickTwiceImpl: (() -> Void)?
    public func tickTwice() throws {
        tickTwiceImpl!()
    }
}
extension TestAPI_CommonInterface._TestMutatingCounterProtocolConverter: NodeMutator {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        return _NodeTestMutatingCounterProtocol(
            _nodeWitness: try NodeReference(env: env, value: value),
            count: Int()
        )
    }
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestMutatingCounterProtocol", env: env)
        let args: [NAPI.Value] = [
            try Swift.Int.toNode(value.count, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: SwiftType, this: NAPI.Value, env: NAPI.Env) throws {
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestMutatingCounterProtocol",
            properties: [
                "tick": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "tick", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: TestAPI_CommonInterface._TestMutatingCounterProtocolConverter.self)
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                mutatingSelf.tick(
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "witness": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "witness", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI_CommonInterface._TestMutatingCounterProtocolConverter.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMutatingCounterProtocolConverter.self).witness(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "tickTwice": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "tickTwice", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: TestAPI_CommonInterface._TestMutatingCounterProtocolConverter.self)
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                mutatingSelf.tickTwice(
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "count": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "count", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(env.this(converter: TestAPI_CommonInterface._TestMutatingCounterProtocolConverter.self).count, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestMutatingCounterProtocol_constructor", expectedArgumentCount: 1) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "count", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestMutatingCounterProtocol",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
