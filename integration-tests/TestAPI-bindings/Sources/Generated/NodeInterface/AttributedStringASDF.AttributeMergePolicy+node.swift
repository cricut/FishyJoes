// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension AttributedStringASDF.AttributeMergePolicy: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedStringASDF.AttributeMergePolicy {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedStringASDF.AttributeMergePolicy, got nil")
        }
        return try Box<AttributedStringASDF.AttributeMergePolicy>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedStringASDF.AttributeMergePolicy, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "AttributedString.AttributeMergePolicy", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedStringASDF.AttributeMergePolicy, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedStringASDF.AttributeMergePolicy, got nil")
        }
        try Box<AttributedStringASDF.AttributeMergePolicy>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedString.AttributeMergePolicy",
            properties: [
                :
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.AttributeMergePolicy_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedStringASDF.AttributeMergePolicy>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString.AttributeMergePolicy",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
