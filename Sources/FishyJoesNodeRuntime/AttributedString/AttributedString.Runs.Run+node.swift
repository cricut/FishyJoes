import Foundation

extension AttributedString.Runs.Run: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedString.Runs.Run {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedString.Runs.Run, got nil")
        }
        return try Box<AttributedString.Runs.Run>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedString.Runs.Run, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "AttributedString.Runs.Run", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedString.Runs.Run, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedString.Runs.Run, got nil")
        }
        try Box<AttributedString.Runs.Run>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedString.Runs.Run",
            properties: [
                "range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "range", expectedArgumentCount: 0) { env in
                                try RangeConverter<AttributedString.Index>.toNode(env.this(converter: AttributedString.Runs.Run.self).range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "attributes": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "attributes", expectedArgumentCount: 0) { env in
                                try AttributeContainer.toNode(env.this(converter: AttributedString.Runs.Run.self).attributes, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "equals": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "equals", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            guard let lhs = try? env.this(converter: AttributedString.Runs.Run.self),
                                  let rhs = try? env.argument(at: 0, converter: AttributedString.Runs.Run.self) else {
                                return try Bool.toNode(false, env: env.env)
                            }
                            let equal = lhs == rhs
                            return try Bool.toNode(equal, env: env.env)
                        }
                    },
                    isStatic: false
                ),
                "hashCode": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "hashCode", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let hashValue = AttributedString("", attributes: try env.this(converter: AttributedString.Runs.Run.self).attributes).hashValue
                            return try Int32.toNode(Int32(truncatingIfNeeded: hashValue), env: env.env)
                        }
                    },
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.Runs.Run_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedString.Runs.Run>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString.Runs.Run",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
