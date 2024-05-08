// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestLeadingUnderscoredProp: TestAPI.TestLeadingUnderscoredProp {
    let _nodeWitness: NodeReference

    var _leadingUnderscoreProp: String {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let _leadingUnderscoreProp = try env.getNamedProperty(napiValue, "_leadingUnderscoreProp")
                return try Swift.String.fromNode(_leadingUnderscoreProp, env: env)
            }
        }
    }
}

extension TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestLeadingUnderscoredProp", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.TestLeadingUnderscoredProp, got nil")
                }
                return try Box<TestAPI.TestLeadingUnderscoredProp>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeTestLeadingUnderscoredProp(
                    _nodeWitness: try NodeReference(env: env, value: value)
                )
            }
        }}
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestLeadingUnderscoredProp", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let coreObject = try env.createFunction(
            "TestLeadingUnderscoredProp", { env, info in
                fatalError("Constructor should not be called on \"TestLeadingUnderscoredProp\", only the \"fromCore\" static method ought to be called.")
            },
            nil
        )
        let fromCoreFunctionCallback: NAPI.Callback = { env, info in
            FishyJoesNodeRuntime.callbackBody(env, info, name: "fromCore", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                let coreArg = try env.argument(at: 0)

                let env = env.env
                let global = try env.getGlobal()
                let object = try env.getNamedProperty(global, "Object")
                let create = try env.getNamedProperty(object, "create")

                let result = try env.callFunction(object, create, [coreArg])

                return result
            }
        }
        let fromCoreFunction = try env.createFunction("fromCore", fromCoreFunctionCallback, nil)
        try env.setNamedProperty(fromCoreFunction, "static", env.getBoolean(true))
        try env.setNamedProperty(coreObject, "fromCore", fromCoreFunction)
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestLeadingUnderscoredProp",
            nodeClass: coreObject
        )

        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_TestLeadingUnderscoredProp",
            properties: [
                "_leadingUnderscoreProp": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "_leadingUnderscoreProp", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(env.this(converter: TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter.self)._leadingUnderscoreProp, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_TestLeadingUnderscoredProp_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestLeadingUnderscoredProp>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_TestLeadingUnderscoredProp",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
