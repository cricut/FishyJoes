// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.TestNonExportedProtocolEnum: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        switch try String.fromNode(value, env: env) {
        case "hogehoge": return Self.hogehoge
        case let unknown: fatalError("invalid enum string '\(unknown)' for TestAPI.TestNonExportedProtocolEnum")
        }
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        switch value {
        case .hogehoge:
            return try String.toNode("hogehoge", env: env)
        }
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let object = try env.createObject()
        let props = try NodeClass.descriptorsFor(properties: [
            "hoge": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "hoge", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                        let result = try Swift.Double.toNode(
                            env.argument(at: 0, converter: TestAPI.TestNonExportedProtocolEnum.self).hoge(
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
            "getFuga": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "fuga", expectedArgumentCount: 1) { env in
                        return try Swift.Double.toNode(env.argument(at: 0, converter: TestAPI.TestNonExportedProtocolEnum.self).fuga, env: env.env)
                    }
                },
                isStatic: true
            ),
        ], env: env)
        try env.defineProperties(object, properties: props)
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestNonExportedProtocolEnum",
            nodeClass: object
        )
    }
}
