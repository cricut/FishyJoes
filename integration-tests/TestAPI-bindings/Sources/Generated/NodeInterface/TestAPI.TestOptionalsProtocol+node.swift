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

    var flarp: Optional<String> {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let flarp = try env.getNamedProperty(napiValue, "flarp")
                return try OptionalConverter<Swift.String>.fromNode(flarp, env: env)
            }
        }
    }
    public func wombat(zxc: Optional<Int>) throws -> Optional<Double> {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let wombat = try env.getNamedProperty(napiValue, "wombat")
            let result = try env.callFunction(napiValue, wombat, [try OptionalConverter<Swift.Int>.toNode(zxc, env: env)])
            return try OptionalConverter<Swift.Double>.fromNode(result, env: env)
        }
    }
    public func spqr(_ pippo: AssociatedDataEnum) throws -> Int {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let spqr = try env.getNamedProperty(napiValue, "spqr")
            let result = try env.callFunction(napiValue, spqr, [try TestAPI.AssociatedDataEnum.toNode(pippo, env: env)])
            return try Swift.Int.fromNode(result, env: env)
        }
    }
}

extension TestAPI_CommonInterface._TestOptionalsProtocolConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestOptionalsProtocol", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.TestOptionalsProtocol, got nil")
                }
                return try Box<TestAPI.TestOptionalsProtocol>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeTestOptionalsProtocol(
                    _nodeWitness: try NodeReference(env: env, value: value)
                )
            }
        }}
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestOptionalsProtocol", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let fromCoreClass = try NodeClass(
            env: env,
            name: "TestOptionalsProtocol",
            properties: [
                "fromCore": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "fromCore", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let coreArg = try env.argument(at: 0)

                            let env = env.env
                            let global = try env.getGlobal()
                            let object = try env.getNamedProperty(global, "Object")
                            let create = try env.getNamedProperty(object, "create")

                            let result = try env.callFunction(object, create, [coreArg])

                            return result
                        }
                    },
                    isStatic: true
                )
            ],
            constructor: { env, info in
                fatalError("Constructor should not be called on fromCoreClass")
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestOptionalsProtocol",
            nodeClass: fromCoreClass.constructor.value(env: env)
        )

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
