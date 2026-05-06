// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import BareBones
import BareBones_CommonInterface
import FishyJoesNodeRuntime
import Foundation

// MARK: - NodeInterface/BareBones.Skeleton+node.swift

extension BareBones.Skeleton: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> BareBones.Skeleton {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected BareBones.Skeleton, got nil")
        }
        return try Box<BareBones.Skeleton>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: BareBones.Skeleton, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "Skeleton", module: "BareBones", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: BareBones.Skeleton, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected BareBones.Skeleton, got nil")
        }
        try Box<BareBones.Skeleton>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            module: "BareBones",
            name: "Skeleton",
            properties: [
                (
                    name: "boneCount",
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "boneCount", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(BareBones.Skeleton.boneCount, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                (
                    name: "toString",
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "toString", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                "\(env.this(converter: BareBones.Skeleton.self))",
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                )
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Skeleton_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<BareBones.Skeleton>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Skeleton",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
