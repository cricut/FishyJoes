// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.TestProtocolEnum: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        switch try String.fromNode(value, env: env) {
        case "qux": return Self.qux
        case let unknown: fatalError("invalid enum string '\(unknown)' for TestAPI.TestProtocolEnum")
        }
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        switch value {
        case .qux:
            return try String.toNode("qux", env: env)
        }
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let object = try env.createObject()
        let props = try NodeClass.descriptorsFor(properties: [
            "foo": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "foo", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                        let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                            env.argument(at: 0, converter: TestAPI.TestProtocolEnum.self).foo(
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
            "bar": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "bar", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                        let result = try Swift.Bool.toNode(
                            env.argument(at: 0, converter: TestAPI.TestProtocolEnum.self).bar(
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
            "baz": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "baz", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                        let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                            env.argument(at: 0, converter: TestAPI.TestProtocolEnum.self).baz(
                                qux: try env.argument(at: 1, converter: Swift.Bool.self)
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
            "garply": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "garply", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                        let result = try Swift.String.toNode(
                            env.argument(at: 0, converter: TestAPI.TestProtocolEnum.self).garply(
                                try env.argument(at: 1, converter: Swift.String.self)
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
            "xyzzy": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "xyzzy", expectedArgumentCount: 3, hasNamedOptions: false) { env in
                        let result = try Swift.String.toNode(
                            env.argument(at: 0, converter: TestAPI.TestProtocolEnum.self).xyzzy(
                                thud: try env.argument(at: 1, converter: Swift.Int.self),
                                grault: try env.argument(at: 2, converter: ArrayConverter<Swift.Double>.self)
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
            "plugh": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "plugh", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                        let result = try Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.toNode(
                            env.argument(at: 0, converter: TestAPI.TestProtocolEnum.self).plugh(
                                fred: try env.argument(at: 1, converter: Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.self)
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
        ], env: env)
        try env.defineProperties(object, properties: props)
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestProtocolEnum",
            nodeClass: object
        )
    }
}
