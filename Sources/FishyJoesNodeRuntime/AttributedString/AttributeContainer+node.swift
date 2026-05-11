import Foundation

extension AttributeContainer: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributeContainer {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributeContainer, got nil")
        }
        return try Box<AttributeContainer>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributeContainer, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "AttributeContainer", module: "FishyJoesCommonRuntime", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributeContainer, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributeContainer, got nil")
        }
        try Box<AttributeContainer>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            module: "FishyJoesCommonRuntime",
            name: "AttributeContainer",
            properties: [
                (
                    name: "merge",
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "merge", expectedArgumentCount: 1, hasNamedOptions: true) { env in
                            var mutatingSelf = try env.this(converter: AttributeContainer.self)
                            let keepCurrent = try env.argument(named: "keepCurrent", default: false, converter: Bool.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.merge(
                                    try env.argument(at: 0, converter: AttributeContainer.self),
                                    mergePolicy: keepCurrent ? .keepCurrent : .keepNew
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                (
                    name: "equals",
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "equals", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            guard let lhs = try? env.this(converter: AttributeContainer.self),
                                  let rhs = try? env.argument(at: 0, converter: AttributeContainer.self) else {
                                return try Bool.toNode(false, env: env.env)
                            }
                            let equal = lhs == rhs
                            return try Bool.toNode(equal, env: env.env)
                        }
                    },
                    isStatic: false
                ),
                (
                    name: "hashCode",
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "hashCode", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let hashValue = AttributedString("HASH", attributes: try env.this(converter: AttributeContainer.self)).hashValue
                            return try Int32.toNode(Int32(truncatingIfNeeded: hashValue), env: env.env)
                        }
                    },
                    isStatic: false
                ),
                (
                    name: "createEmpty",
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "createEmpty", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try AttributeContainer.toNode(
                                AttributeContainer(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributeContainer_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributeContainer>.construct(env: env)
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
