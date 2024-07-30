import Foundation

extension AttributedString.Index: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedString.Index {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedString.Index, got nil")
        }
        return try Box<AttributedString.Index>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedString.Index, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "AttributedString.Index", module: "FishyJoesCommonRuntime", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedString.Index, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedString.Index, got nil")
        }
        try Box<AttributedString.Index>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            module: "FishyJoesCommonRuntime",
            name: "AttributedString.Index",
            properties: [
                "equals": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "equals", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            guard let lhs = try? env.this(converter: AttributedString.Index.self),
                                  let rhs = try? env.argument(at: 0, converter: AttributedString.Index.self) else {
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
                            var index = try env.this(converter: AttributedString.Index.self)
                            // TODO: Switch to using hashValue when available, as Comparable should be, but is not guaranteed to be, compatible with this hash value
                            // let hashValue = index.hashValue
                            let hashValue = withUnsafeBytes(of: &index) { (bytes: UnsafeRawBufferPointer) -> Int in
                                var hasher = Hasher()
                                hasher.combine(bytes: bytes)
                                return hasher.finalize()
                            }
                            return try Int32.toNode(Int32(truncatingIfNeeded: hashValue), env: env.env)
                        }
                    },
                    isStatic: false
                ),
                "compare": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "compare", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            guard let lhs = try? env.this(converter: AttributedString.Index.self),
                                  let rhs = try? env.argument(at: 0, converter: AttributedString.Index.self) else {
                                return try Bool.toNode(false, env: env.env)
                            }
                            let comparison = lhs < rhs ? -1 : lhs > rhs ? 1 : 0
                            return try Int.toNode(comparison, env: env.env)
                        }
                    },
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.Index_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedString.Index>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString.Index",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
