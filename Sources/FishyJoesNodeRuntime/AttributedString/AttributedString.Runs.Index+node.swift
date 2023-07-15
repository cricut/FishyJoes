import Foundation

extension AttributedString.Runs.Index: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedString.Runs.Index {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedString.Runs.Index, got nil")
        }
        return try Box<AttributedString.Runs.Index>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedString.Runs.Index, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "AttributedString.Runs.Index", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedString.Runs.Index, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedString.Runs.Index, got nil")
        }
        try Box<AttributedString.Runs.Index>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedString.Runs.Index",
            properties: [
                :
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.Runs.Index_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedString.Runs.Index>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString.Runs.Index",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
