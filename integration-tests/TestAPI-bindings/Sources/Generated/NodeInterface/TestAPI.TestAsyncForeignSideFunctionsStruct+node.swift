// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.TestAsyncForeignSideFunctionsStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            const42: try { () -> () async -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "const42")
                return try AsyncFunction0Converter<Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            iabs: try { () -> (Swift.Int) async -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "iabs")
                return try AsyncFunction1Converter<Swift.Int, Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            intCompose: try { () -> ((Swift.Int) async -> Swift.Int, (Swift.Int) async -> Swift.Int) -> (Swift.Int) async -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "intCompose")
                return try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.fromNode(fieldValue, env: env)
            }(),
            add3Things: try { () -> (Swift.Float, Swift.Double, Swift.Int) async -> Swift.Double in
                let fieldValue = try env.getNamedProperty(value, "add3Things")
                return try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.fromNode(fieldValue, env: env)
            }(),
            makeList: try { () -> (Swift.String, Swift.String, Swift.String, Swift.String) async -> Array<Swift.String> in
                let fieldValue = try env.getNamedProperty(value, "makeList")
                return try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.fromNode(fieldValue, env: env)
            }(),
            fifthThing: try { () -> (Swift.String, Swift.Int, Swift.Double, Swift.String, () async -> Swift.Int) async -> () async -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "fifthThing")
                return try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.fromNode(fieldValue, env: env)
            }(),
            six: try { () -> (Swift.String, Swift.Int, Swift.Double, Swift.String, () async -> Swift.Int, Swift.Int) async -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "six")
                return try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            willThrow: try { () -> () async -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "willThrow")
                return try AsyncFunction0Converter<Swift.Int>.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestAsyncForeignSideFunctionsStruct", env: env)
        let args: [NAPI.Value] = [
            try AsyncFunction0Converter<Swift.Int>.toNode(value.const42, env: env),
            try AsyncFunction1Converter<Swift.Int, Swift.Int>.toNode(value.iabs, env: env),
            try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toNode(value.intCompose, env: env),
            try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(value.add3Things, env: env),
            try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(value.makeList, env: env),
            try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toNode(value.fifthThing, env: env),
            try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(value.six, env: env),
            try AsyncFunction0Converter<Swift.Int>.toNode(value.willThrow, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestAsyncForeignSideFunctionsStruct",
            properties: [
                "const42": (.stored(mutable: true), isStatic: false),
                "iabs": (.stored(mutable: true), isStatic: false),
                "intCompose": (.stored(mutable: true), isStatic: false),
                "add3Things": (.stored(mutable: true), isStatic: false),
                "makeList": (.stored(mutable: true), isStatic: false),
                "fifthThing": (.stored(mutable: true), isStatic: false),
                "six": (.stored(mutable: true), isStatic: false),
                "willThrow": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestAsyncForeignSideFunctionsStruct_constructor", expectedArgumentCount: 8) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "const42", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "iabs", env.argument(at: 1))
                    try env.env.setNamedProperty(this, "intCompose", env.argument(at: 2))
                    try env.env.setNamedProperty(this, "add3Things", env.argument(at: 3))
                    try env.env.setNamedProperty(this, "makeList", env.argument(at: 4))
                    try env.env.setNamedProperty(this, "fifthThing", env.argument(at: 5))
                    try env.env.setNamedProperty(this, "six", env.argument(at: 6))
                    try env.env.setNamedProperty(this, "willThrow", env.argument(at: 7))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestAsyncForeignSideFunctionsStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
