// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import NodeAPI
import TestAPI
import TestAPI_CommonInterface

// MARK: - Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces+node.swift
extension Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            x: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "x")
                return try Swift.String.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "AttributedString_PuttingTypesIntoQuestionablePlaces", env: env)
        let args: [NAPI.Value] = [
            try Swift.String.toNode(value.x, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedString_PuttingTypesIntoQuestionablePlaces",
            properties: [
                "testCall": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "testCall", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                env.this(converter: Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces.self).testCall(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "x": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "AttributedString_PuttingTypesIntoQuestionablePlaces_constructor", expectedArgumentCount: 1) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "x", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString_PuttingTypesIntoQuestionablePlaces",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - Swift.String.PuttingTypesIntoQuestionablePlaces+node.swift
extension Swift.String.PuttingTypesIntoQuestionablePlaces: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            x: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "x")
                return try Swift.String.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "String_PuttingTypesIntoQuestionablePlaces", env: env)
        let args: [NAPI.Value] = [
            try Swift.String.toNode(value.x, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "String_PuttingTypesIntoQuestionablePlaces",
            properties: [
                "testCall": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "testCall", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                env.this(converter: Swift.String.PuttingTypesIntoQuestionablePlaces.self).testCall(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "x": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "String_PuttingTypesIntoQuestionablePlaces_constructor", expectedArgumentCount: 1) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "x", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "String_PuttingTypesIntoQuestionablePlaces",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces+node.swift
extension Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        switch try String.fromNode(value, env: env) {
        case "thing": return Self.thing
        case let unknown: fatalError("invalid enum string '\(unknown)' for Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces")
        }
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        switch value {
        case .thing:
            return try String.toNode("thing", env: env)
        }
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let object = try env.createObject()
        let props = try NodeClass.descriptorsFor(properties: [
            "testCall": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "testCall", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                        let result = try Swift.Int.toNode(
                            env.argument(at: 0, converter: Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.self).testCall(
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
            path: "UnicodeScalar_PuttingTypesIntoQuestionablePlaces",
            nodeClass: object
        )
    }
}

// MARK: - TestAPI.AProtocol+node.swift
struct _NodeAProtocol: TestAPI.AProtocol {
    let _nodeWitness: NodeReference

    var baz: Bool {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let baz = try env.getNamedProperty(napiValue, "baz")
                return try Swift.Bool.fromNode(baz, env: env)
            }
        }
    }
    var foo: String {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let foo = try env.getNamedProperty(napiValue, "foo")
                return try Swift.String.fromNode(foo, env: env)
            }
        }
    }
    public func bar(x: Int, y: Int) throws -> AProtocol {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let bar = try env.getNamedProperty(napiValue, "bar")
            let result = try env.callFunction(napiValue, bar, [try Swift.Int.toNode(x, env: env), try Swift.Int.toNode(y, env: env)])
            return try TestAPI_CommonInterface._AProtocolConverter.fromNode(result, env: env)
        }
    }
    public func hasADefaultImplementation(x: Int, y: Double) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let hasADefaultImplementation = try env.getNamedProperty(napiValue, "hasADefaultImplementation")
            let result = try env.callFunction(napiValue, hasADefaultImplementation, [try Swift.Int.toNode(x, env: env), try Swift.Double.toNode(y, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func hasADefaultImplementation2(_ a: String, b: Bool, _ c: String) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let hasADefaultImplementation2 = try env.getNamedProperty(napiValue, "hasADefaultImplementation2")
            let result = try env.callFunction(napiValue, hasADefaultImplementation2, [try Swift.String.toNode(a, env: env), try Swift.Bool.toNode(b, env: env), try Swift.String.toNode(c, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
}

extension TestAPI_CommonInterface._AProtocolConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_AProtocol", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.AProtocol, got nil")
                }
                return try Box<TestAPI.AProtocol>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeAProtocol(
                    _nodeWitness: try NodeReference(env: env, value: value)
                )
            }
        }}
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_AProtocol", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let coreObject = try env.createObject()
        let fromCoreFunctionCallback: NAPI.Callback = { env, info in
            FishyJoesNodeRuntime.callbackBody(env, info, name: "fromCore", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                let coreArg = try env.argument(at: 0)

                let env = env.env
                let global = try env.getGlobal()
                let object = try env.getNamedProperty(global, "Object")
                let create = try env.getNamedProperty(object, "create")

                let result = try env.callFunction(object, create, [coreArg])

                let hasADefaultImplementationFunctionCallback: NAPI.Callback = { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "hasADefaultImplementation", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                        let _wrappedSwiftSelf = TestAPI_CommonInterface.AProtocol_sans_hasADefaultImplementation(wrapped: try FishyJoesCommonRuntime.silenceTryWarning(env.this(converter: TestAPI_CommonInterface._AProtocolConverter.self)))
                        let result = try Swift.String.toNode(
                            _wrappedSwiftSelf.hasADefaultImplementation(
                                x: try env.argument(at: 0, converter: Swift.Int.self),
                                y: try env.argument(at: 1, converter: Swift.Double.self)
                            ),
                            env: env.env
                        )
                        return result
                    }
                }
                let hasADefaultImplementationFunction = try env.createFunction(
                    "hasADefaultImplementation",
                    hasADefaultImplementationFunctionCallback,
                    nil
                )
                if !(try env.hasNamedProperty(result, "hasADefaultImplementation")) {
                    try env.setNamedProperty(result, "hasADefaultImplementation", hasADefaultImplementationFunction)
                }

                let hasADefaultImplementation2FunctionCallback: NAPI.Callback = { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "hasADefaultImplementation2", expectedArgumentCount: 3, hasNamedOptions: false) { env in
                        let _wrappedSwiftSelf = TestAPI_CommonInterface.AProtocol_sans_hasADefaultImplementation2(wrapped: try FishyJoesCommonRuntime.silenceTryWarning(env.this(converter: TestAPI_CommonInterface._AProtocolConverter.self)))
                        let result = try Swift.String.toNode(
                            _wrappedSwiftSelf.hasADefaultImplementation2(
                                try env.argument(at: 0, converter: Swift.String.self),
                                b: try env.argument(at: 1, converter: Swift.Bool.self),
                                try env.argument(at: 2, converter: Swift.String.self)
                            ),
                            env: env.env
                        )
                        return result
                    }
                }
                let hasADefaultImplementation2Function = try env.createFunction(
                    "hasADefaultImplementation2",
                    hasADefaultImplementation2FunctionCallback,
                    nil
                )
                if !(try env.hasNamedProperty(result, "hasADefaultImplementation2")) {
                    try env.setNamedProperty(result, "hasADefaultImplementation2", hasADefaultImplementation2Function)
                }

                return result
            }
        }
        let fromCoreFunction = try env.createFunction("fromCore", fromCoreFunctionCallback, nil)
        try env.setNamedProperty(fromCoreFunction, "static", env.getBoolean(true))
        try env.setNamedProperty(coreObject, "fromCore", fromCoreFunction)
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "AProtocol",
            nodeClass: coreObject
        )

        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_AProtocol",
            properties: [
                "bar": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "bar", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try TestAPI_CommonInterface._AProtocolConverter.toNode(
                                env.this(converter: TestAPI_CommonInterface._AProtocolConverter.self).bar(
                                    x: try env.argument(at: 0, converter: Swift.Int.self),
                                    y: try env.argument(at: 1, converter: Swift.Int.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "hasADefaultImplementation": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "hasADefaultImplementation", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let _wrappedSwiftSelf = TestAPI_CommonInterface.AProtocol_sans_hasADefaultImplementation(wrapped: try FishyJoesCommonRuntime.silenceTryWarning(env.this(converter: TestAPI_CommonInterface._AProtocolConverter.self)))
                            let result = try Swift.String.toNode(
                                _wrappedSwiftSelf.hasADefaultImplementation(
                                    x: try env.argument(at: 0, converter: Swift.Int.self),
                                    y: try env.argument(at: 1, converter: Swift.Double.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "hasADefaultImplementation2": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "hasADefaultImplementation2", expectedArgumentCount: 3, hasNamedOptions: false) { env in
                            let _wrappedSwiftSelf = TestAPI_CommonInterface.AProtocol_sans_hasADefaultImplementation2(wrapped: try FishyJoesCommonRuntime.silenceTryWarning(env.this(converter: TestAPI_CommonInterface._AProtocolConverter.self)))
                            let result = try Swift.String.toNode(
                                _wrappedSwiftSelf.hasADefaultImplementation2(
                                    try env.argument(at: 0, converter: Swift.String.self),
                                    b: try env.argument(at: 1, converter: Swift.Bool.self),
                                    try env.argument(at: 2, converter: Swift.String.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "baz": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "baz", expectedArgumentCount: 0) { env in
                                return try Swift.Bool.toNode(env.this(converter: TestAPI_CommonInterface._AProtocolConverter.self).baz, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "foo": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "foo", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI_CommonInterface._AProtocolConverter.self).foo, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_AProtocol_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.AProtocol>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_AProtocol",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.AProtocolImplementation+node.swift
extension TestAPI.AProtocolImplementation: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            foo: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "foo")
                return try Swift.String.fromNode(fieldValue, env: env)
            }(),
            baz: try { () -> Swift.Bool in
                let fieldValue = try env.getNamedProperty(value, "baz")
                return try Swift.Bool.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "AProtocolImplementation", env: env)
        let args: [NAPI.Value] = [
            try Swift.String.toNode(value.foo, env: env),
            try Swift.Bool.toNode(value.baz, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "foo", Swift.String.toNode(value.foo, env: env))
        try env.setNamedProperty(this, "baz", Swift.Bool.toNode(value.baz, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AProtocolImplementation",
            properties: [
                "bar": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "bar", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try TestAPI_CommonInterface._AProtocolConverter.toNode(
                                env.this(converter: TestAPI.AProtocolImplementation.self).bar(
                                    x: try env.argument(at: 0, converter: Swift.Int.self),
                                    y: try env.argument(at: 1, converter: Swift.Int.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "hasADefaultImplementation": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "hasADefaultImplementation", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.AProtocolImplementation.self).hasADefaultImplementation(
                                    x: try env.argument(at: 0, converter: Swift.Int.self),
                                    y: try env.argument(at: 1, converter: Swift.Double.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "hasADefaultImplementation2": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "hasADefaultImplementation2", expectedArgumentCount: 3, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.AProtocolImplementation.self).hasADefaultImplementation2(
                                    try env.argument(at: 0, converter: Swift.String.self),
                                    b: try env.argument(at: 1, converter: Swift.Bool.self),
                                    try env.argument(at: 2, converter: Swift.String.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "foo": (.stored(mutable: true), isStatic: false),
                "baz": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "AProtocolImplementation_constructor", expectedArgumentCount: 2) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "foo", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "baz", env.argument(at: 1))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "AProtocolImplementation",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Actors+node.swift
extension TestAPI.Actors: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Actors")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Actors",
            properties: [
                :
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Actors_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Actors",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Actors.TemperatureLogger+node.swift
extension TestAPI.Actors.TemperatureLogger: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.Actors.TemperatureLogger {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.Actors.TemperatureLogger, got nil")
        }
        return try Box<TestAPI.Actors.TemperatureLogger>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.Actors.TemperatureLogger, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "Actors.TemperatureLogger", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.Actors.TemperatureLogger, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.Actors.TemperatureLogger, got nil")
        }
        try Box<TestAPI.Actors.TemperatureLogger>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Actors.TemperatureLogger",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try TestAPI.Actors.TemperatureLogger.toNode(
                                TestAPI.Actors.TemperatureLogger(
                                    label: try env.argument(at: 0, converter: Swift.String.self),
                                    measurement: try env.argument(at: 1, converter: Swift.Int.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "update": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "update", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Swift.Int.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Actors.TemperatureLogger.self))
                            Task {
                                do {
                                    let taskResult: Void = await swiftSelf.value.update(
                                        with: arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try FishyJoesCommonRuntime.VoidConverter.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "min": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "min", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Actors.TemperatureLogger.self))
                            Task {
                                do {
                                    let taskResult: Int = await swiftSelf.value.min(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "extensionIsolatedGetLabel": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "extensionIsolatedGetLabel", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Actors.TemperatureLogger.self))
                            Task {
                                do {
                                    let taskResult: String = await swiftSelf.value.extensionIsolatedGetLabel(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "extensionNonisolatedGetLabel": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "extensionNonisolatedGetLabel", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.Actors.TemperatureLogger.self).extensionNonisolatedGetLabel(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "backwardsLabel": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "backwardsLabel", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.Actors.TemperatureLogger.self).backwardsLabel, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "extensionNonisolatedVarLabel": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "extensionNonisolatedVarLabel", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.Actors.TemperatureLogger.self).extensionNonisolatedVarLabel, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "label": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "label", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.Actors.TemperatureLogger.self).label, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "toString": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "toString", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                "\(env.this(converter: TestAPI.Actors.TemperatureLogger.self))",
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                )
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Actors.TemperatureLogger_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.Actors.TemperatureLogger>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Actors.TemperatureLogger",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.AssociatedDataEnum+node.swift
extension TestAPI.AssociatedDataEnum: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        if try env.instanceof(value, NodeClass.constructor(for: "AssociatedDataEnum.Thing", env: env)) {
            let _value = try env.getNamedProperty(value, "value")
            return Self.thing(
                value: try Swift.Int.fromNode(_value, env: env)
            )
        }

        if try env.instanceof(value, NodeClass.constructor(for: "AssociatedDataEnum.Other", env: env)) {
            let _unnamed = try env.getNamedProperty(value, "unnamed")
            let __1 = try env.getNamedProperty(value, "_1")
            return Self.other(
                try Swift.String.fromNode(_unnamed, env: env),
                try Swift.Int.fromNode(__1, env: env)
            )
        }

        if try env.instanceof(value, NodeClass.constructor(for: "AssociatedDataEnum.Bar", env: env)) {
            let _named = try env.getNamedProperty(value, "named")
            let __1 = try env.getNamedProperty(value, "_1")
            return Self.bar(
                named: try Swift.String.fromNode(_named, env: env),
                try TestAPI.AssociatedDataEnum.fromNode(__1, env: env)
            )
        }

        if try env.instanceof(value, NodeClass.constructor(for: "AssociatedDataEnum.NoValue", env: env)) {
            return noValue
        }

        if try env.instanceof(value, NodeClass.constructor(for: "AssociatedDataEnum.SimpleEnum", env: env)) {
            let _value = try env.getNamedProperty(value, "value")
            return Self.simpleEnum(
                value: try TestAPI.SimpleEnum.fromNode(_value, env: env)
            )
        }

        fatalError("invalid enum for TestAPI.AssociatedDataEnum")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        switch value {
        case let .thing(value):
            return try env.newInstance(
                NodeClass.constructor(for: "AssociatedDataEnum.Thing", env: env),
                [
                    Swift.Int.toNode(value, env: env),
                ]
            )
        case let .other(unnamed, _1):
            return try env.newInstance(
                NodeClass.constructor(for: "AssociatedDataEnum.Other", env: env),
                [
                    Swift.String.toNode(unnamed, env: env),
                    Swift.Int.toNode(_1, env: env),
                ]
            )
        case let .bar(named, _1):
            return try env.newInstance(
                NodeClass.constructor(for: "AssociatedDataEnum.Bar", env: env),
                [
                    Swift.String.toNode(named, env: env),
                    TestAPI.AssociatedDataEnum.toNode(_1, env: env),
                ]
            )
        case .noValue:
            return try env.newInstance(
                NodeClass.constructor(for: "AssociatedDataEnum.NoValue", env: env),
                [
                ]
            )
        case let .simpleEnum(value):
            return try env.newInstance(
                NodeClass.constructor(for: "AssociatedDataEnum.SimpleEnum", env: env),
                [
                    TestAPI.SimpleEnum.toNode(value, env: env),
                ]
            )
        }
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "AssociatedDataEnum",
            properties: [
                "plus": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "plus", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try TestAPI.AssociatedDataEnum.toNode(
                                env.this(converter: TestAPI.AssociatedDataEnum.self).plus(
                                    try env.argument(at: 0, converter: TestAPI.AssociatedDataEnum.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "intValue": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intValue", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(env.this(converter: TestAPI.AssociatedDataEnum.self).intValue, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "staticThing": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticThing", expectedArgumentCount: 0) { env in
                                return try TestAPI.AssociatedDataEnum.toNode(TestAPI.AssociatedDataEnum.staticThing, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "AssociatedDataEnum_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AssociatedDataEnum",
            nodeClass: superclass.constructor.value(env: env)
        )
        let thingClass = try NodeClass(
            env: env,
            name: "AssociatedDataEnum.Thing",
            superclass: superclass,
            properties: [
                "value": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "AssociatedDataEnum.Thing_constructor",
                    expectedArgumentCount: 1
                ) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "value", env.argument(at: 0))
                    return this
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AssociatedDataEnum.Thing",
            nodeClass: thingClass.constructor.value(env: env)
        )
        let otherClass = try NodeClass(
            env: env,
            name: "AssociatedDataEnum.Other",
            superclass: superclass,
            properties: [
                "unnamed": (.stored(mutable: true), isStatic: false),
                "_1": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "AssociatedDataEnum.Other_constructor",
                    expectedArgumentCount: 2
                ) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "unnamed", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "_1", env.argument(at: 1))
                    return this
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AssociatedDataEnum.Other",
            nodeClass: otherClass.constructor.value(env: env)
        )
        let barClass = try NodeClass(
            env: env,
            name: "AssociatedDataEnum.Bar",
            superclass: superclass,
            properties: [
                "named": (.stored(mutable: true), isStatic: false),
                "_1": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "AssociatedDataEnum.Bar_constructor",
                    expectedArgumentCount: 2
                ) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "named", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "_1", env.argument(at: 1))
                    return this
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AssociatedDataEnum.Bar",
            nodeClass: barClass.constructor.value(env: env)
        )
        let noValueClass = try NodeClass(
            env: env,
            name: "AssociatedDataEnum.NoValue",
            superclass: superclass,
            properties: [:],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "AssociatedDataEnum.NoValue_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    let this = try env.this()
                    return this
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AssociatedDataEnum.NoValue",
            nodeClass: noValueClass.constructor.value(env: env)
        )
        let simpleEnumClass = try NodeClass(
            env: env,
            name: "AssociatedDataEnum.SimpleEnum",
            superclass: superclass,
            properties: [
                "value": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "AssociatedDataEnum.SimpleEnum_constructor",
                    expectedArgumentCount: 1
                ) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "value", env.argument(at: 0))
                    return this
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AssociatedDataEnum.SimpleEnum",
            nodeClass: simpleEnumClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.AsyncFunctions+node.swift
extension TestAPI.AsyncFunctions: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.AsyncFunctions")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "AsyncFunctions",
            properties: [
                "exercise0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction0Converter<Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise0(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "exercise1": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise1", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction1Converter<Swift.Int, Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise1(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "exercise2": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise2", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise2(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "exercise3": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise3", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise3(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "exercise4": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise4", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise4(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "exercise5": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise5", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise5(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "exercise6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise6(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "thunkTwiceMaker": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "thunkTwiceMaker", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.toNode(
                                TestAPI.AsyncFunctions.thunkTwiceMaker(
                                    thunk: try env.argument(at: 0, converter: AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "add3Things": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "add3Things", expectedArgumentCount: 0) { env in
                                return try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(TestAPI.AsyncFunctions.add3Things, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "const42": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "const42", expectedArgumentCount: 0) { env in
                                return try AsyncFunction0Converter<Swift.Int>.toNode(TestAPI.AsyncFunctions.const42, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "fifthThing": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "fifthThing", expectedArgumentCount: 0) { env in
                                return try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toNode(TestAPI.AsyncFunctions.fifthThing, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "abs": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "abs", expectedArgumentCount: 0) { env in
                                return try AsyncFunction1Converter<Swift.Int, Swift.Int>.toNode(TestAPI.AsyncFunctions.iabs, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "intCompose": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intCompose", expectedArgumentCount: 0) { env in
                                return try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toNode(TestAPI.AsyncFunctions.intCompose, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "makeList": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "makeList", expectedArgumentCount: 0) { env in
                                return try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(TestAPI.AsyncFunctions.makeList, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "sixthThing": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "sixthThing", expectedArgumentCount: 0) { env in
                                return try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(TestAPI.AsyncFunctions.six, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "willThrow": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "willThrow", expectedArgumentCount: 0) { env in
                                return try AsyncFunction0Converter<Swift.Int>.toNode(TestAPI.AsyncFunctions.willThrow, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "AsyncFunctions_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AsyncFunctions",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.AttributedStrings+node.swift
extension TestAPI.AttributedStrings: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.AttributedStrings")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "AttributedStrings",
            properties: [
                "echo": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echo", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Foundation.AttributedString.toNode(
                                TestAPI.AttributedStrings.echo(
                                    try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "firstIndex": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "firstIndex", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Foundation.AttributedString.Index.toNode(
                                TestAPI.AttributedStrings.firstIndex(
                                    of: try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "lastIndex": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "lastIndex", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Foundation.AttributedString.Index.toNode(
                                TestAPI.AttributedStrings.lastIndex(
                                    of: try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "fullRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "fullRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Foundation.AttributedString.Index>.toNode(
                                TestAPI.AttributedStrings.fullRange(
                                    of: try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "attributedCharacters": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "attributedCharacters", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ArrayConverter<Foundation.AttributedSubstring>.toNode(
                                TestAPI.AttributedStrings.attributedCharacters(
                                    of: try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "attributesPreferringDuplicatesNearerStart": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "attributesPreferringDuplicatesNearerStart", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Foundation.AttributeContainer.toNode(
                                TestAPI.AttributedStrings.attributesPreferringDuplicatesNearerStart(
                                    of: try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "emptyAttributeRuns": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "emptyAttributeRuns", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ArrayConverter<Foundation.AttributedString.Runs.Run>.toNode(
                                TestAPI.AttributedStrings.emptyAttributeRuns(
                                    of: try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "accent": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "accent", expectedArgumentCount: 0) { env in
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.accent, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "chinese": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "chinese", expectedArgumentCount: 0) { env in
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.chinese, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "chineseBMP": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "chineseBMP", expectedArgumentCount: 0) { env in
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.chineseBMP, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "chineseSIP": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "chineseSIP", expectedArgumentCount: 0) { env in
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.chineseSIP, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "emoji": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "emoji", expectedArgumentCount: 0) { env in
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.emoji, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "emojiMulti": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "emojiMulti", expectedArgumentCount: 0) { env in
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.emojiMulti, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "polyglot": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "polyglot", expectedArgumentCount: 0) { env in
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.polyglot, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "script": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "script", expectedArgumentCount: 0) { env in
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.script, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "simple": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "simple", expectedArgumentCount: 0) { env in
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.simple, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "AttributedStrings_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedStrings",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Bytes+node.swift
extension TestAPI.Bytes: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Bytes")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Bytes",
            properties: [
                "echoBytes": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoBytes", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ArrayConverter<Swift.UInt8>.toNode(
                                TestAPI.Bytes.echo(
                                    bytes: try env.argument(at: 0, converter: ArrayConverter<Swift.UInt8>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoData": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoData", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Foundation.Data.toNode(
                                TestAPI.Bytes.echo(
                                    data: try env.argument(at: 0, converter: Foundation.Data.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "bytes": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "bytes", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.UInt8>.toNode(TestAPI.Bytes.bytes, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "data": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "data", expectedArgumentCount: 0) { env in
                                return try Foundation.Data.toNode(TestAPI.Bytes.data, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Bytes_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Bytes",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.ClosedRanges+node.swift
extension TestAPI.ClosedRanges: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.ClosedRanges")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "ClosedRanges",
            properties: [
                "echoUInt8Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt8Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.UInt8>.toNode(
                                TestAPI.ClosedRanges.echoUInt8Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.UInt8>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt16Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt16Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.UInt16>.toNode(
                                TestAPI.ClosedRanges.echoUInt16Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.UInt16>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt32Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt32Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.UInt32>.toNode(
                                TestAPI.ClosedRanges.echoUInt32Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.UInt32>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt64Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt64Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.UInt64>.toNode(
                                TestAPI.ClosedRanges.echoUInt64Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.UInt64>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUIntRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUIntRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.UInt>.toNode(
                                TestAPI.ClosedRanges.echoUIntRange(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.UInt>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt8Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt8Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Int8>.toNode(
                                TestAPI.ClosedRanges.echoInt8Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Int8>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt16Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt16Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Int16>.toNode(
                                TestAPI.ClosedRanges.echoInt16Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Int16>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt32Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt32Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Int32>.toNode(
                                TestAPI.ClosedRanges.echoInt32Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Int32>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt64Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt64Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Int64>.toNode(
                                TestAPI.ClosedRanges.echoInt64Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Int64>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoIntRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoIntRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Int>.toNode(
                                TestAPI.ClosedRanges.echoIntRange(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoFloatRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoFloatRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Float>.toNode(
                                TestAPI.ClosedRanges.echoFloatRange(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Float>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoDoubleRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoDoubleRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Double>.toNode(
                                TestAPI.ClosedRanges.echoDoubleRange(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Double>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoStringRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoStringRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.String>.toNode(
                                TestAPI.ClosedRanges.echoStringRange(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.String>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "doubleRange": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "doubleRange", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.Double>.toNode(TestAPI.ClosedRanges.doubleRange, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "floatRange": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "floatRange", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.Float>.toNode(TestAPI.ClosedRanges.floatRange, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "int16Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int16Range", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.Int16>.toNode(TestAPI.ClosedRanges.int16Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "int32Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int32Range", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.Int32>.toNode(TestAPI.ClosedRanges.int32Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "int64Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int64Range", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.Int64>.toNode(TestAPI.ClosedRanges.int64Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "int8Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int8Range", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.Int8>.toNode(TestAPI.ClosedRanges.int8Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "intRange": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intRange", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.Int>.toNode(TestAPI.ClosedRanges.intRange, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "stringRange": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "stringRange", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.String>.toNode(TestAPI.ClosedRanges.stringRange, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uInt16Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uInt16Range", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.UInt16>.toNode(TestAPI.ClosedRanges.uInt16Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uInt32Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uInt32Range", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.UInt32>.toNode(TestAPI.ClosedRanges.uInt32Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uInt64Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uInt64Range", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.UInt64>.toNode(TestAPI.ClosedRanges.uInt64Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uInt8Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uInt8Range", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.UInt8>.toNode(TestAPI.ClosedRanges.uInt8Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uIntRange": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uIntRange", expectedArgumentCount: 0) { env in
                                return try ClosedRangeConverter<Swift.UInt>.toNode(TestAPI.ClosedRanges.uIntRange, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "ClosedRanges_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "ClosedRanges",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Collections+node.swift
extension TestAPI.Collections: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Collections")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Collections",
            properties: [
                "echoArrayOfInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoArrayOfInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ArrayConverter<Swift.Int>.toNode(
                                TestAPI.Collections.echo(
                                    arrayOfInt: try env.argument(at: 0, converter: ArrayConverter<Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoSetOfInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoSetOfInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try SetConverter<Swift.Int>.toNode(
                                TestAPI.Collections.echo(
                                    setOfInt: try env.argument(at: 0, converter: SetConverter<Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoDictionaryOfIntToInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoDictionaryOfIntToInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try DictionaryConverter<Swift.Int, Swift.Int>.toNode(
                                TestAPI.Collections.echo(
                                    dictionaryOfIntToInt: try env.argument(at: 0, converter: DictionaryConverter<Swift.Int, Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoMaybeArrayOfMaybeInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoMaybeArrayOfMaybeInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>.toNode(
                                TestAPI.Collections.echo(
                                    maybeArrayOfMaybeInt: try env.argument(at: 0, converter: OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoMaybeSetOfMaybeInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoMaybeSetOfMaybeInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<SetConverter<OptionalConverter<Swift.Int>>>.toNode(
                                TestAPI.Collections.echo(
                                    maybeSetOfMaybeInt: try env.argument(at: 0, converter: OptionalConverter<SetConverter<OptionalConverter<Swift.Int>>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoMaybeDictionaryOfIntToMaybeInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoMaybeDictionaryOfIntToMaybeInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>>.toNode(
                                TestAPI.Collections.echo(
                                    maybeDictionaryOfIntToMaybeInt: try env.argument(at: 0, converter: OptionalConverter<DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "collectionMapper": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "collectionMapper", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>.toNode(
                                TestAPI.Collections.collectionMapper(
                                    collection: try env.argument(at: 0, converter: OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>.self),
                                    try env.argument(at: 1, converter: Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "arrayOfBigTuples": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "arrayOfBigTuples", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>>.toNode(TestAPI.Collections.arrayOfBigTuples, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "arrayOfInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "arrayOfInt", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.Int>.toNode(TestAPI.Collections.arrayOfInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "defaultCollectionHolder": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "defaultCollectionHolder", expectedArgumentCount: 0) { env in
                                return try TestAPI.Collections.CollectionHolder.toNode(TestAPI.Collections.defaultCollectionHolder, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "dictionaryOfIntToInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "dictionaryOfIntToInt", expectedArgumentCount: 0) { env in
                                return try DictionaryConverter<Swift.Int, Swift.Int>.toNode(TestAPI.Collections.dictionaryOfIntToInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maybeArrayOfInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeArrayOfInt", expectedArgumentCount: 0) { env in
                                return try OptionalConverter<ArrayConverter<Swift.Int>>.toNode(TestAPI.Collections.maybeArrayOfInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maybeArrayOfMaybeInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeArrayOfMaybeInt", expectedArgumentCount: 0) { env in
                                return try OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>.toNode(TestAPI.Collections.maybeArrayOfMaybeInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maybeDictionaryOfIntToInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeDictionaryOfIntToInt", expectedArgumentCount: 0) { env in
                                return try OptionalConverter<DictionaryConverter<Swift.Int, Swift.Int>>.toNode(TestAPI.Collections.maybeDictionaryOfIntToInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maybeDictionaryOfIntToMaybeInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeDictionaryOfIntToMaybeInt", expectedArgumentCount: 0) { env in
                                return try OptionalConverter<DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>>.toNode(TestAPI.Collections.maybeDictionaryOfIntToMaybeInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maybeSetOfInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeSetOfInt", expectedArgumentCount: 0) { env in
                                return try OptionalConverter<SetConverter<Swift.Int>>.toNode(TestAPI.Collections.maybeSetOfInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maybeSetOfMaybeInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeSetOfMaybeInt", expectedArgumentCount: 0) { env in
                                return try OptionalConverter<SetConverter<OptionalConverter<Swift.Int>>>.toNode(TestAPI.Collections.maybeSetOfMaybeInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "setOfInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "setOfInt", expectedArgumentCount: 0) { env in
                                return try SetConverter<Swift.Int>.toNode(TestAPI.Collections.setOfInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Collections_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Collections",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Collections.CollectionHolder+node.swift
extension TestAPI.Collections.CollectionHolder: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            boolArray: try { () -> Array<Swift.Bool> in
                let fieldValue = try env.getNamedProperty(value, "boolArray")
                return try ArrayConverter<Swift.Bool>.fromNode(fieldValue, env: env)
            }(),
            boolSet: try { () -> Set<Swift.Bool> in
                let fieldValue = try env.getNamedProperty(value, "boolSet")
                return try SetConverter<Swift.Bool>.fromNode(fieldValue, env: env)
            }(),
            boolDictionary: try { () -> Dictionary<Swift.Bool, Swift.Bool> in
                let fieldValue = try env.getNamedProperty(value, "boolDictionary")
                return try DictionaryConverter<Swift.Bool, Swift.Bool>.fromNode(fieldValue, env: env)
            }(),
            integerArray: try { () -> Array<Swift.Int> in
                let fieldValue = try env.getNamedProperty(value, "integerArray")
                return try ArrayConverter<Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            integerSet: try { () -> Set<Swift.Int> in
                let fieldValue = try env.getNamedProperty(value, "integerSet")
                return try SetConverter<Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            integerDictionary: try { () -> Dictionary<Swift.Int, Swift.Int> in
                let fieldValue = try env.getNamedProperty(value, "integerDictionary")
                return try DictionaryConverter<Swift.Int, Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            stringArray: try { () -> Array<Swift.String> in
                let fieldValue = try env.getNamedProperty(value, "stringArray")
                return try ArrayConverter<Swift.String>.fromNode(fieldValue, env: env)
            }(),
            stringSet: try { () -> Set<Swift.String> in
                let fieldValue = try env.getNamedProperty(value, "stringSet")
                return try SetConverter<Swift.String>.fromNode(fieldValue, env: env)
            }(),
            stringDictionary: try { () -> Dictionary<Swift.String, Swift.String> in
                let fieldValue = try env.getNamedProperty(value, "stringDictionary")
                return try DictionaryConverter<Swift.String, Swift.String>.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "Collections.CollectionHolder", env: env)
        let args: [NAPI.Value] = [
            try ArrayConverter<Swift.Bool>.toNode(value.boolArray, env: env),
            try SetConverter<Swift.Bool>.toNode(value.boolSet, env: env),
            try DictionaryConverter<Swift.Bool, Swift.Bool>.toNode(value.boolDictionary, env: env),
            try ArrayConverter<Swift.Int>.toNode(value.integerArray, env: env),
            try SetConverter<Swift.Int>.toNode(value.integerSet, env: env),
            try DictionaryConverter<Swift.Int, Swift.Int>.toNode(value.integerDictionary, env: env),
            try ArrayConverter<Swift.String>.toNode(value.stringArray, env: env),
            try SetConverter<Swift.String>.toNode(value.stringSet, env: env),
            try DictionaryConverter<Swift.String, Swift.String>.toNode(value.stringDictionary, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "boolArray", ArrayConverter<Swift.Bool>.toNode(value.boolArray, env: env))
        try env.setNamedProperty(this, "boolSet", SetConverter<Swift.Bool>.toNode(value.boolSet, env: env))
        try env.setNamedProperty(this, "boolDictionary", DictionaryConverter<Swift.Bool, Swift.Bool>.toNode(value.boolDictionary, env: env))
        try env.setNamedProperty(this, "integerArray", ArrayConverter<Swift.Int>.toNode(value.integerArray, env: env))
        try env.setNamedProperty(this, "integerSet", SetConverter<Swift.Int>.toNode(value.integerSet, env: env))
        try env.setNamedProperty(this, "integerDictionary", DictionaryConverter<Swift.Int, Swift.Int>.toNode(value.integerDictionary, env: env))
        try env.setNamedProperty(this, "stringArray", ArrayConverter<Swift.String>.toNode(value.stringArray, env: env))
        try env.setNamedProperty(this, "stringSet", SetConverter<Swift.String>.toNode(value.stringSet, env: env))
        try env.setNamedProperty(this, "stringDictionary", DictionaryConverter<Swift.String, Swift.String>.toNode(value.stringDictionary, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Collections.CollectionHolder",
            properties: [
                "staticMutableProperty": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticMutableProperty", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.Int>>.toNode(TestAPI.Collections.CollectionHolder.staticMutableProperty, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticMutableProperty", expectedArgumentCount: 1) { env in
                                TestAPI.Collections.CollectionHolder.staticMutableProperty = try env.argument(at: 0, converter: ArrayConverter<OptionalConverter<Swift.Int>>.self)
                                return nil
                            }
                        }),
                    isStatic: true
                ),
                "staticProperty": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticProperty", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.Int>>.toNode(TestAPI.Collections.CollectionHolder.staticProperty, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "boolArray": (.stored(mutable: true), isStatic: false),
                "boolSet": (.stored(mutable: true), isStatic: false),
                "boolDictionary": (.stored(mutable: true), isStatic: false),
                "integerArray": (.stored(mutable: true), isStatic: false),
                "integerSet": (.stored(mutable: true), isStatic: false),
                "integerDictionary": (.stored(mutable: true), isStatic: false),
                "stringArray": (.stored(mutable: true), isStatic: false),
                "stringSet": (.stored(mutable: true), isStatic: false),
                "stringDictionary": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "Collections.CollectionHolder_constructor", expectedArgumentCount: 9) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "boolArray", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "boolSet", env.argument(at: 1))
                    try env.env.setNamedProperty(this, "boolDictionary", env.argument(at: 2))
                    try env.env.setNamedProperty(this, "integerArray", env.argument(at: 3))
                    try env.env.setNamedProperty(this, "integerSet", env.argument(at: 4))
                    try env.env.setNamedProperty(this, "integerDictionary", env.argument(at: 5))
                    try env.env.setNamedProperty(this, "stringArray", env.argument(at: 6))
                    try env.env.setNamedProperty(this, "stringSet", env.argument(at: 7))
                    try env.env.setNamedProperty(this, "stringDictionary", env.argument(at: 8))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "Collections.CollectionHolder",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.DefaultArguments+node.swift
extension TestAPI.DefaultArguments: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.DefaultArguments")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "DefaultArguments",
            properties: [
                "echoDefaults": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoDefaults", expectedArgumentCount: 1, hasNamedOptions: true) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.DefaultArguments.echoDefaults(
                                    y: try env.argument(named: "y", default: nil, converter: OptionalConverter<Swift.Int>.self),
                                    x: try env.argument(at: 0, converter: OptionalConverter<Swift.Int>.self),
                                    theLabelForZ: try env.argument(named: "theLabelForZ", default: 3.14, converter: Swift.Double.self)
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
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "DefaultArguments_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "DefaultArguments",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Deprecations+node.swift
extension TestAPI.Deprecations: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Deprecations")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Deprecations",
            properties: [
                "deprecatedMethod": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "deprecatedMethod", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.Deprecations.deprecatedMethod(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "deprecatedVariable": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "deprecatedVariable", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(TestAPI.Deprecations.deprecatedVariable, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Deprecations_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Deprecations",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.EmptyClass+node.swift
extension TestAPI.EmptyClass: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.EmptyClass {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.EmptyClass, got nil")
        }
        return try Box<TestAPI.EmptyClass>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.EmptyClass, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "EmptyClass1", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.EmptyClass, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.EmptyClass, got nil")
        }
        try Box<TestAPI.EmptyClass>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "EmptyClass1",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.EmptyClass.toNode(
                                TestAPI.EmptyClass(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "shme": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "shme", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyClass.self).shme(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "Gorpers": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "Gorpers", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyClass.self).gorp(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "blarg": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "blarg", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.EmptyClass.self).blarg, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "wibbledyWobbledyTimeyWhimey": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "wibbledyWobbledyTimeyWhimey", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.EmptyClass.self).wibble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "toString": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "toString", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                "\(env.this(converter: TestAPI.EmptyClass.self))",
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                )
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "EmptyClass1_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.EmptyClass>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "EmptyClass1",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.EmptyClass2+node.swift
extension TestAPI.EmptyClass2: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.EmptyClass2 {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.EmptyClass2, got nil")
        }
        return try Box<TestAPI.EmptyClass2>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.EmptyClass2, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "EmptyClass2", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.EmptyClass2, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.EmptyClass2, got nil")
        }
        try Box<TestAPI.EmptyClass2>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "EmptyClass2",
            properties: [
                "make": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "make", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.EmptyClass2.toNode(
                                TestAPI.EmptyClass2(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "shmee": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "shmee", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyClass2.self).shme(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "gorp": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "gorp", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyClass2.self).gorp(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "blorg": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "blorg", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.EmptyClass2.self).blarg, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "wibble": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "wibble", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.EmptyClass2.self).wibble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "toString": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "toString", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                "\(env.this(converter: TestAPI.EmptyClass2.self))",
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                )
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "EmptyClass2_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.EmptyClass2>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "EmptyClass2",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.EmptyEnum+node.swift
extension TestAPI.EmptyEnum: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.EmptyEnum")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "EmptyEnum",
            properties: [
                "notGoingToHappen": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "notGoingToHappen", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            try (
                                TestAPI.EmptyEnum.notGoingToHappen(
                                )
                            )
                        }
                    },
                    isStatic: true
                ),
                "mies": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "mies", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                TestAPI.EmptyEnum.mies(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "noot": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "noot", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(TestAPI.EmptyEnum.noot, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "EmptyEnum_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "EmptyEnum",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.EmptyStruct+node.swift
extension TestAPI.EmptyStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "EmptyStruct", env: env)
        let args: [NAPI.Value] = [
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "EmptyStruct",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.EmptyStruct.toNode(
                                TestAPI.EmptyStruct(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "aap": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "aap", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyStruct.self).aap(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "zxccxz": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "zxccxz", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyStruct.self).zxc(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "tatiana": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tatiana", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.EmptyStruct.self).tata, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "tutu": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tutu", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(env.this(converter: TestAPI.EmptyStruct.self).tutu, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "EmptyStruct_constructor", expectedArgumentCount: 0) { env in
                    let this = try env.this()
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "EmptyStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.EmptyStruct2+node.swift
extension TestAPI.EmptyStruct2: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "EmptyStruct2", env: env)
        let args: [NAPI.Value] = [
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "EmptyStruct2",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.EmptyStruct2.toNode(
                                TestAPI.EmptyStruct2(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "aap": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "aap", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyStruct2.self).aap(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "zxccxz": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "zxccxz", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyStruct2.self).zxc(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "tatiana": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tatiana", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.EmptyStruct2.self).tata, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "tutu": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tutu", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(env.this(converter: TestAPI.EmptyStruct2.self).tutu, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "EmptyStruct2_constructor", expectedArgumentCount: 0) { env in
                    let this = try env.this()
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "EmptyStruct2",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Functions+node.swift
extension TestAPI.Functions: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Functions")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Functions",
            properties: [
                "exercise0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.Functions.exercise0(
                                    try env.argument(at: 0, converter: Function0Converter<Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "exercise1": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise1", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.Functions.exercise1(
                                    try env.argument(at: 0, converter: Function1Converter<Swift.Int, Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "exercise2": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise2", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.Functions.exercise2(
                                    try env.argument(at: 0, converter: Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "exercise3": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise3", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.Functions.exercise3(
                                    try env.argument(at: 0, converter: Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "exercise4": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise4", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.Functions.exercise4(
                                    try env.argument(at: 0, converter: Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "exercise5": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise5", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.Functions.exercise5(
                                    try env.argument(at: 0, converter: Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "exercise6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.Functions.exercise6(
                                    try env.argument(at: 0, converter: Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "willThrow": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "willThrow", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.Functions.willThrow(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "thunkTwiceMaker": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "thunkTwiceMaker", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Function0Converter<FishyJoesCommonRuntime.VoidConverter>.toNode(
                                TestAPI.Functions.thunkTwiceMaker(
                                    thunk: try env.argument(at: 0, converter: Function0Converter<FishyJoesCommonRuntime.VoidConverter>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "add3Things": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "add3Things", expectedArgumentCount: 0) { env in
                                return try Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(TestAPI.Functions.add3Things, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "const42": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "const42", expectedArgumentCount: 0) { env in
                                return try Function0Converter<Swift.Int>.toNode(TestAPI.Functions.const42, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "fifthThing": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "fifthThing", expectedArgumentCount: 0) { env in
                                return try Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>.toNode(TestAPI.Functions.fifthThing, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "abs": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "abs", expectedArgumentCount: 0) { env in
                                return try Function1Converter<Swift.Int, Swift.Int>.toNode(TestAPI.Functions.iabs, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "intCompose": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intCompose", expectedArgumentCount: 0) { env in
                                return try Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>.toNode(TestAPI.Functions.intCompose, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "makeList": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "makeList", expectedArgumentCount: 0) { env in
                                return try Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(TestAPI.Functions.makeList, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "sixthThing": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "sixthThing", expectedArgumentCount: 0) { env in
                                return try Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(TestAPI.Functions.six, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Functions_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Functions",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Methods+node.swift
extension TestAPI.Methods: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.Methods {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.Methods, got nil")
        }
        return try Box<TestAPI.Methods>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.Methods, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "Methods", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.Methods, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.Methods, got nil")
        }
        try Box<TestAPI.Methods>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Methods",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.Methods.toNode(
                                TestAPI.Methods.create(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "doublePlusGood": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "doublePlusGood", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                env.this(converter: TestAPI.Methods.self).doublePlusGood(
                                    a: try env.argument(at: 0, converter: Swift.Int.self),
                                    b: try env.argument(at: 1, converter: Swift.Double.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "async42": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "async42", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Int = await swiftSelf.value.async42(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "asyncYield": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncYield", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Int = await swiftSelf.value.asyncYield(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "asyncSleep": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncSleep", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: UInt = try await swiftSelf.value.asyncSleep(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.UInt.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "asyncVoid": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncVoid", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Void = await swiftSelf.value.asyncVoid(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try FishyJoesCommonRuntime.VoidConverter.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "asyncDouble": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncDouble", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Swift.Double.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Double = await swiftSelf.value.asyncDouble(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Double.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "asyncMultipleArgs": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncMultipleArgs", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Swift.Int.self))
                            let arg1 = UncheckedSendableBox(try env.argument(at: 1, converter: AsyncFunction0Converter<Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Int = try await swiftSelf.value.asyncMultipleArgs(
                                        arg0.value,
                                        j: arg1.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "asyncThrowing": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncThrowing", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Void = try await swiftSelf.value.asyncThrowing(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try FishyJoesCommonRuntime.VoidConverter.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "asyncCallbackFunc0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncCallbackFunc0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction0Converter<Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Int = try await swiftSelf.value.asyncCallbackFunc0(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "staticAsync42": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsync42", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            Task {
                                do {
                                    let taskResult: Int = await TestAPI.Methods.staticAsync42(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "staticAsyncYield": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncYield", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            Task {
                                do {
                                    let taskResult: Int = await TestAPI.Methods.staticAsyncYield(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "staticAsyncSleep": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncSleep", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            Task {
                                do {
                                    let taskResult: UInt = try await TestAPI.Methods.staticAsyncSleep(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.UInt.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "staticAsyncVoid": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncVoid", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            Task {
                                do {
                                    let taskResult: Void = await TestAPI.Methods.staticAsyncVoid(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try FishyJoesCommonRuntime.VoidConverter.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "staticAsyncDouble": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncDouble", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Swift.Double.self))
                            Task {
                                do {
                                    let taskResult: Double = await TestAPI.Methods.staticAsyncDouble(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Double.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "staticAsyncMultipleArgs": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncMultipleArgs", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Swift.Int.self))
                            let arg1 = UncheckedSendableBox(try env.argument(at: 1, converter: AsyncFunction0Converter<Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Methods.staticAsyncMultipleArgs(
                                        arg0.value,
                                        j: arg1.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "staticAsyncThrowing": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncThrowing", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            Task {
                                do {
                                    let taskResult: Void = try await TestAPI.Methods.staticAsyncThrowing(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try FishyJoesCommonRuntime.VoidConverter.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "staticAsyncCallbackFunc0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncCallbackFunc0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction0Converter<Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Methods.staticAsyncCallbackFunc0(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "garply": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "garply", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(env.this(converter: TestAPI.Methods.self).garply, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "instanceGet": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceGet", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(env.this(converter: TestAPI.Methods.self).instanceGet, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "instanceGetMethod": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceGetMethod", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(env.this(converter: TestAPI.Methods.self).instanceGetMethod, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "instanceModifiable": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceModifiable", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(env.this(converter: TestAPI.Methods.self).instanceModifiable, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceModifiable", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: TestAPI.Methods.self)
                                FishyJoesCommonRuntime.silenceMutationWarning(&mutatingSelf)
                                mutatingSelf.instanceModifiable = try env.argument(at: 0, converter: Swift.Int.self)
                                try TestAPI.Methods.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
                "instanceStored": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceStored", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(env.this(converter: TestAPI.Methods.self).instanceStored, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceStored", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: TestAPI.Methods.self)
                                FishyJoesCommonRuntime.silenceMutationWarning(&mutatingSelf)
                                mutatingSelf.instanceStored = try env.argument(at: 0, converter: Swift.Int.self)
                                try TestAPI.Methods.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
                "staticGet": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticGet", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(TestAPI.Methods.staticGet, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "staticGetMethod": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticGetMethod", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(TestAPI.Methods.staticGetMethod, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "staticModifiable": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticModifiable", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(TestAPI.Methods.staticModifiable, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticModifiable", expectedArgumentCount: 1) { env in
                                TestAPI.Methods.staticModifiable = try env.argument(at: 0, converter: Swift.Int.self)
                                return nil
                            }
                        }),
                    isStatic: true
                ),
                "staticStored": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticStored", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(TestAPI.Methods.staticStored, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticStored", expectedArgumentCount: 1) { env in
                                TestAPI.Methods.staticStored = try env.argument(at: 0, converter: Swift.Int.self)
                                return nil
                            }
                        }),
                    isStatic: true
                ),
                "toString": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "toString", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                "\(env.this(converter: TestAPI.Methods.self))",
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                )
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Methods_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.Methods>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Methods",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Primitives+node.swift
extension TestAPI.Primitives: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Primitives")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Primitives",
            properties: [
                "echoBool": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoBool", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Bool.toNode(
                                TestAPI.Primitives.echoBool(
                                    value: try env.argument(at: 0, converter: Swift.Bool.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt8": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt8", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.UInt8.toNode(
                                TestAPI.Primitives.echoUInt8(
                                    value: try env.argument(at: 0, converter: Swift.UInt8.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt16": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt16", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.UInt16.toNode(
                                TestAPI.Primitives.echoUInt16(
                                    value: try env.argument(at: 0, converter: Swift.UInt16.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt32": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt32", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.UInt32.toNode(
                                TestAPI.Primitives.echoUInt32(
                                    value: try env.argument(at: 0, converter: Swift.UInt32.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt64": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt64", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.UInt64.toNode(
                                TestAPI.Primitives.echoUInt64(
                                    value: try env.argument(at: 0, converter: Swift.UInt64.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.UInt.toNode(
                                TestAPI.Primitives.echoUInt(
                                    value: try env.argument(at: 0, converter: Swift.UInt.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt8": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt8", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int8.toNode(
                                TestAPI.Primitives.echoInt8(
                                    value: try env.argument(at: 0, converter: Swift.Int8.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt16": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt16", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int16.toNode(
                                TestAPI.Primitives.echoInt16(
                                    value: try env.argument(at: 0, converter: Swift.Int16.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt32": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt32", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int32.toNode(
                                TestAPI.Primitives.echoInt32(
                                    value: try env.argument(at: 0, converter: Swift.Int32.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt64": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt64", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int64.toNode(
                                TestAPI.Primitives.echoInt64(
                                    value: try env.argument(at: 0, converter: Swift.Int64.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                TestAPI.Primitives.echoInt(
                                    value: try env.argument(at: 0, converter: Swift.Int.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoFloat": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoFloat", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Float.toNode(
                                TestAPI.Primitives.echoFloat(
                                    value: try env.argument(at: 0, converter: Swift.Float.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoDouble": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoDouble", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Double.toNode(
                                TestAPI.Primitives.echoDouble(
                                    value: try env.argument(at: 0, converter: Swift.Double.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoBool": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoBool", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Bool>.toNode(
                                TestAPI.Primitives.maybeEchoBool(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Bool>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoUInt8": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoUInt8", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.UInt8>.toNode(
                                TestAPI.Primitives.maybeEchoUInt8(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.UInt8>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoUInt16": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoUInt16", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.UInt16>.toNode(
                                TestAPI.Primitives.maybeEchoUInt16(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.UInt16>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoUInt32": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoUInt32", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.UInt32>.toNode(
                                TestAPI.Primitives.maybeEchoUInt32(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.UInt32>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoUInt64": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoUInt64", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.UInt64>.toNode(
                                TestAPI.Primitives.maybeEchoUInt64(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.UInt64>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoUInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoUInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.UInt>.toNode(
                                TestAPI.Primitives.maybeEchoUInt(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.UInt>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoInt8": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoInt8", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Int8>.toNode(
                                TestAPI.Primitives.maybeEchoInt8(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Int8>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoInt16": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoInt16", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Int16>.toNode(
                                TestAPI.Primitives.maybeEchoInt16(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Int16>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoInt32": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoInt32", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Int32>.toNode(
                                TestAPI.Primitives.maybeEchoInt32(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Int32>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoInt64": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoInt64", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Int64>.toNode(
                                TestAPI.Primitives.maybeEchoInt64(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Int64>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Int>.toNode(
                                TestAPI.Primitives.maybeEchoInt(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoFloat": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoFloat", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Float>.toNode(
                                TestAPI.Primitives.maybeEchoFloat(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Float>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoDouble": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoDouble", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Double>.toNode(
                                TestAPI.Primitives.maybeEchoDouble(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Double>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "valueMapper": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "valueMapper", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.UInt8>.toNode(
                                TestAPI.Primitives.valueMapper(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.UInt8>.self),
                                    try env.argument(at: 1, converter: Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "bitCountInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "bitCountInt", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(TestAPI.Primitives.bitCountInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "bitCountUInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "bitCountUInt", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(TestAPI.Primitives.bitCountUInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "defaultPrimitiveHolder": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "defaultPrimitiveHolder", expectedArgumentCount: 0) { env in
                                return try TestAPI.Primitives.PrimitiveHolder.toNode(TestAPI.Primitives.defaultPrimitiveHolder, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "falseBool": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "falseBool", expectedArgumentCount: 0) { env in
                                return try Swift.Bool.toNode(TestAPI.Primitives.falseBool, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyBool": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyBool", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.Bool>.toNode(TestAPI.Primitives.manyBool, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyDouble": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyDouble", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.Double>.toNode(TestAPI.Primitives.manyDouble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyFloat": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyFloat", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.Float>.toNode(TestAPI.Primitives.manyFloat, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyInt", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.Int>.toNode(TestAPI.Primitives.manyInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyInt16", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.Int16>.toNode(TestAPI.Primitives.manyInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyInt32", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.Int32>.toNode(TestAPI.Primitives.manyInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyInt64", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.Int64>.toNode(TestAPI.Primitives.manyInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyInt8", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.Int8>.toNode(TestAPI.Primitives.manyInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeBool": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeBool", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.Bool>>.toNode(TestAPI.Primitives.manyMaybeBool, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeDouble": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeDouble", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.Double>>.toNode(TestAPI.Primitives.manyMaybeDouble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeFloat": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeFloat", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.Float>>.toNode(TestAPI.Primitives.manyMaybeFloat, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeInt", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.Int>>.toNode(TestAPI.Primitives.manyMaybeInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeInt16", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.Int16>>.toNode(TestAPI.Primitives.manyMaybeInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeInt32", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.Int32>>.toNode(TestAPI.Primitives.manyMaybeInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeInt64", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.Int64>>.toNode(TestAPI.Primitives.manyMaybeInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeInt8", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.Int8>>.toNode(TestAPI.Primitives.manyMaybeInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeUInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeUInt", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.UInt>>.toNode(TestAPI.Primitives.manyMaybeUInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeUInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeUInt16", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.UInt16>>.toNode(TestAPI.Primitives.manyMaybeUInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeUInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeUInt32", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.UInt32>>.toNode(TestAPI.Primitives.manyMaybeUInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeUInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeUInt64", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.UInt64>>.toNode(TestAPI.Primitives.manyMaybeUInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeUInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeUInt8", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.UInt8>>.toNode(TestAPI.Primitives.manyMaybeUInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyUInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyUInt", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.UInt>.toNode(TestAPI.Primitives.manyUInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyUInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyUInt16", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.UInt16>.toNode(TestAPI.Primitives.manyUInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyUInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyUInt32", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.UInt32>.toNode(TestAPI.Primitives.manyUInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyUInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyUInt64", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.UInt64>.toNode(TestAPI.Primitives.manyUInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyUInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyUInt8", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.UInt8>.toNode(TestAPI.Primitives.manyUInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxDouble": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxDouble", expectedArgumentCount: 0) { env in
                                return try Swift.Double.toNode(TestAPI.Primitives.maxDouble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxFloat": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxFloat", expectedArgumentCount: 0) { env in
                                return try Swift.Float.toNode(TestAPI.Primitives.maxFloat, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxInt", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(TestAPI.Primitives.maxInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxInt16", expectedArgumentCount: 0) { env in
                                return try Swift.Int16.toNode(TestAPI.Primitives.maxInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxInt32", expectedArgumentCount: 0) { env in
                                return try Swift.Int32.toNode(TestAPI.Primitives.maxInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxInt64", expectedArgumentCount: 0) { env in
                                return try Swift.Int64.toNode(TestAPI.Primitives.maxInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxInt8", expectedArgumentCount: 0) { env in
                                return try Swift.Int8.toNode(TestAPI.Primitives.maxInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxUInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxUInt", expectedArgumentCount: 0) { env in
                                return try Swift.UInt.toNode(TestAPI.Primitives.maxUInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxUInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxUInt16", expectedArgumentCount: 0) { env in
                                return try Swift.UInt16.toNode(TestAPI.Primitives.maxUInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxUInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxUInt32", expectedArgumentCount: 0) { env in
                                return try Swift.UInt32.toNode(TestAPI.Primitives.maxUInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxUInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxUInt64", expectedArgumentCount: 0) { env in
                                return try Swift.UInt64.toNode(TestAPI.Primitives.maxUInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxUInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxUInt8", expectedArgumentCount: 0) { env in
                                return try Swift.UInt8.toNode(TestAPI.Primitives.maxUInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minDouble": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minDouble", expectedArgumentCount: 0) { env in
                                return try Swift.Double.toNode(TestAPI.Primitives.minDouble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minFloat": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minFloat", expectedArgumentCount: 0) { env in
                                return try Swift.Float.toNode(TestAPI.Primitives.minFloat, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minInt", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(TestAPI.Primitives.minInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minInt16", expectedArgumentCount: 0) { env in
                                return try Swift.Int16.toNode(TestAPI.Primitives.minInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minInt32", expectedArgumentCount: 0) { env in
                                return try Swift.Int32.toNode(TestAPI.Primitives.minInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minInt64", expectedArgumentCount: 0) { env in
                                return try Swift.Int64.toNode(TestAPI.Primitives.minInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minInt8", expectedArgumentCount: 0) { env in
                                return try Swift.Int8.toNode(TestAPI.Primitives.minInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minUInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minUInt", expectedArgumentCount: 0) { env in
                                return try Swift.UInt.toNode(TestAPI.Primitives.minUInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minUInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minUInt16", expectedArgumentCount: 0) { env in
                                return try Swift.UInt16.toNode(TestAPI.Primitives.minUInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minUInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minUInt32", expectedArgumentCount: 0) { env in
                                return try Swift.UInt32.toNode(TestAPI.Primitives.minUInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minUInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minUInt64", expectedArgumentCount: 0) { env in
                                return try Swift.UInt64.toNode(TestAPI.Primitives.minUInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minUInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minUInt8", expectedArgumentCount: 0) { env in
                                return try Swift.UInt8.toNode(TestAPI.Primitives.minUInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "trueBool": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "trueBool", expectedArgumentCount: 0) { env in
                                return try Swift.Bool.toNode(TestAPI.Primitives.trueBool, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroDouble": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroDouble", expectedArgumentCount: 0) { env in
                                return try Swift.Double.toNode(TestAPI.Primitives.zeroDouble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroFloat": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroFloat", expectedArgumentCount: 0) { env in
                                return try Swift.Float.toNode(TestAPI.Primitives.zeroFloat, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroInt", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(TestAPI.Primitives.zeroInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroInt16", expectedArgumentCount: 0) { env in
                                return try Swift.Int16.toNode(TestAPI.Primitives.zeroInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroInt32", expectedArgumentCount: 0) { env in
                                return try Swift.Int32.toNode(TestAPI.Primitives.zeroInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroInt64", expectedArgumentCount: 0) { env in
                                return try Swift.Int64.toNode(TestAPI.Primitives.zeroInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroInt8", expectedArgumentCount: 0) { env in
                                return try Swift.Int8.toNode(TestAPI.Primitives.zeroInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroUInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroUInt", expectedArgumentCount: 0) { env in
                                return try Swift.UInt.toNode(TestAPI.Primitives.zeroUInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroUInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroUInt16", expectedArgumentCount: 0) { env in
                                return try Swift.UInt16.toNode(TestAPI.Primitives.zeroUInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroUInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroUInt32", expectedArgumentCount: 0) { env in
                                return try Swift.UInt32.toNode(TestAPI.Primitives.zeroUInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroUInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroUInt64", expectedArgumentCount: 0) { env in
                                return try Swift.UInt64.toNode(TestAPI.Primitives.zeroUInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroUInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroUInt8", expectedArgumentCount: 0) { env in
                                return try Swift.UInt8.toNode(TestAPI.Primitives.zeroUInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Primitives_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Primitives",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Primitives.PrimitiveHolder+node.swift
extension TestAPI.Primitives.PrimitiveHolder: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            b: try { () -> Swift.Bool in
                let fieldValue = try env.getNamedProperty(value, "b")
                return try Swift.Bool.fromNode(fieldValue, env: env)
            }(),
            bq: try { () -> Optional<Swift.Bool> in
                let fieldValue = try env.getNamedProperty(value, "bq")
                return try OptionalConverter<Swift.Bool>.fromNode(fieldValue, env: env)
            }(),
            ui8: try { () -> Swift.UInt8 in
                let fieldValue = try env.getNamedProperty(value, "ui8")
                return try Swift.UInt8.fromNode(fieldValue, env: env)
            }(),
            ui8q: try { () -> Optional<Swift.UInt8> in
                let fieldValue = try env.getNamedProperty(value, "ui8q")
                return try OptionalConverter<Swift.UInt8>.fromNode(fieldValue, env: env)
            }(),
            ui16: try { () -> Swift.UInt16 in
                let fieldValue = try env.getNamedProperty(value, "ui16")
                return try Swift.UInt16.fromNode(fieldValue, env: env)
            }(),
            ui16q: try { () -> Optional<Swift.UInt16> in
                let fieldValue = try env.getNamedProperty(value, "ui16q")
                return try OptionalConverter<Swift.UInt16>.fromNode(fieldValue, env: env)
            }(),
            ui32: try { () -> Swift.UInt32 in
                let fieldValue = try env.getNamedProperty(value, "ui32")
                return try Swift.UInt32.fromNode(fieldValue, env: env)
            }(),
            ui32q: try { () -> Optional<Swift.UInt32> in
                let fieldValue = try env.getNamedProperty(value, "ui32q")
                return try OptionalConverter<Swift.UInt32>.fromNode(fieldValue, env: env)
            }(),
            ui64: try { () -> Swift.UInt64 in
                let fieldValue = try env.getNamedProperty(value, "ui64")
                return try Swift.UInt64.fromNode(fieldValue, env: env)
            }(),
            ui64q: try { () -> Optional<Swift.UInt64> in
                let fieldValue = try env.getNamedProperty(value, "ui64q")
                return try OptionalConverter<Swift.UInt64>.fromNode(fieldValue, env: env)
            }(),
            ui: try { () -> Swift.UInt in
                let fieldValue = try env.getNamedProperty(value, "ui")
                return try Swift.UInt.fromNode(fieldValue, env: env)
            }(),
            uiq: try { () -> Optional<Swift.UInt> in
                let fieldValue = try env.getNamedProperty(value, "uiq")
                return try OptionalConverter<Swift.UInt>.fromNode(fieldValue, env: env)
            }(),
            i8: try { () -> Swift.Int8 in
                let fieldValue = try env.getNamedProperty(value, "i8")
                return try Swift.Int8.fromNode(fieldValue, env: env)
            }(),
            i8q: try { () -> Optional<Swift.Int8> in
                let fieldValue = try env.getNamedProperty(value, "i8q")
                return try OptionalConverter<Swift.Int8>.fromNode(fieldValue, env: env)
            }(),
            i16: try { () -> Swift.Int16 in
                let fieldValue = try env.getNamedProperty(value, "i16")
                return try Swift.Int16.fromNode(fieldValue, env: env)
            }(),
            i16q: try { () -> Optional<Swift.Int16> in
                let fieldValue = try env.getNamedProperty(value, "i16q")
                return try OptionalConverter<Swift.Int16>.fromNode(fieldValue, env: env)
            }(),
            i32: try { () -> Swift.Int32 in
                let fieldValue = try env.getNamedProperty(value, "i32")
                return try Swift.Int32.fromNode(fieldValue, env: env)
            }(),
            i32q: try { () -> Optional<Swift.Int32> in
                let fieldValue = try env.getNamedProperty(value, "i32q")
                return try OptionalConverter<Swift.Int32>.fromNode(fieldValue, env: env)
            }(),
            i64: try { () -> Swift.Int64 in
                let fieldValue = try env.getNamedProperty(value, "i64")
                return try Swift.Int64.fromNode(fieldValue, env: env)
            }(),
            i64q: try { () -> Optional<Swift.Int64> in
                let fieldValue = try env.getNamedProperty(value, "i64q")
                return try OptionalConverter<Swift.Int64>.fromNode(fieldValue, env: env)
            }(),
            i: try { () -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "i")
                return try Swift.Int.fromNode(fieldValue, env: env)
            }(),
            iq: try { () -> Optional<Swift.Int> in
                let fieldValue = try env.getNamedProperty(value, "iq")
                return try OptionalConverter<Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            f: try { () -> Swift.Float in
                let fieldValue = try env.getNamedProperty(value, "f")
                return try Swift.Float.fromNode(fieldValue, env: env)
            }(),
            fq: try { () -> Optional<Swift.Float> in
                let fieldValue = try env.getNamedProperty(value, "fq")
                return try OptionalConverter<Swift.Float>.fromNode(fieldValue, env: env)
            }(),
            d: try { () -> Swift.Double in
                let fieldValue = try env.getNamedProperty(value, "d")
                return try Swift.Double.fromNode(fieldValue, env: env)
            }(),
            dq: try { () -> Optional<Swift.Double> in
                let fieldValue = try env.getNamedProperty(value, "dq")
                return try OptionalConverter<Swift.Double>.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "Primitives.PrimitiveHolder", env: env)
        let args: [NAPI.Value] = [
            try Swift.Bool.toNode(value.b, env: env),
            try OptionalConverter<Swift.Bool>.toNode(value.bq, env: env),
            try Swift.UInt8.toNode(value.ui8, env: env),
            try OptionalConverter<Swift.UInt8>.toNode(value.ui8q, env: env),
            try Swift.UInt16.toNode(value.ui16, env: env),
            try OptionalConverter<Swift.UInt16>.toNode(value.ui16q, env: env),
            try Swift.UInt32.toNode(value.ui32, env: env),
            try OptionalConverter<Swift.UInt32>.toNode(value.ui32q, env: env),
            try Swift.UInt64.toNode(value.ui64, env: env),
            try OptionalConverter<Swift.UInt64>.toNode(value.ui64q, env: env),
            try Swift.UInt.toNode(value.ui, env: env),
            try OptionalConverter<Swift.UInt>.toNode(value.uiq, env: env),
            try Swift.Int8.toNode(value.i8, env: env),
            try OptionalConverter<Swift.Int8>.toNode(value.i8q, env: env),
            try Swift.Int16.toNode(value.i16, env: env),
            try OptionalConverter<Swift.Int16>.toNode(value.i16q, env: env),
            try Swift.Int32.toNode(value.i32, env: env),
            try OptionalConverter<Swift.Int32>.toNode(value.i32q, env: env),
            try Swift.Int64.toNode(value.i64, env: env),
            try OptionalConverter<Swift.Int64>.toNode(value.i64q, env: env),
            try Swift.Int.toNode(value.i, env: env),
            try OptionalConverter<Swift.Int>.toNode(value.iq, env: env),
            try Swift.Float.toNode(value.f, env: env),
            try OptionalConverter<Swift.Float>.toNode(value.fq, env: env),
            try Swift.Double.toNode(value.d, env: env),
            try OptionalConverter<Swift.Double>.toNode(value.dq, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "b", Swift.Bool.toNode(value.b, env: env))
        try env.setNamedProperty(this, "bq", OptionalConverter<Swift.Bool>.toNode(value.bq, env: env))
        try env.setNamedProperty(this, "ui8", Swift.UInt8.toNode(value.ui8, env: env))
        try env.setNamedProperty(this, "ui8q", OptionalConverter<Swift.UInt8>.toNode(value.ui8q, env: env))
        try env.setNamedProperty(this, "ui16", Swift.UInt16.toNode(value.ui16, env: env))
        try env.setNamedProperty(this, "ui16q", OptionalConverter<Swift.UInt16>.toNode(value.ui16q, env: env))
        try env.setNamedProperty(this, "ui32", Swift.UInt32.toNode(value.ui32, env: env))
        try env.setNamedProperty(this, "ui32q", OptionalConverter<Swift.UInt32>.toNode(value.ui32q, env: env))
        try env.setNamedProperty(this, "ui64", Swift.UInt64.toNode(value.ui64, env: env))
        try env.setNamedProperty(this, "ui64q", OptionalConverter<Swift.UInt64>.toNode(value.ui64q, env: env))
        try env.setNamedProperty(this, "ui", Swift.UInt.toNode(value.ui, env: env))
        try env.setNamedProperty(this, "uiq", OptionalConverter<Swift.UInt>.toNode(value.uiq, env: env))
        try env.setNamedProperty(this, "i8", Swift.Int8.toNode(value.i8, env: env))
        try env.setNamedProperty(this, "i8q", OptionalConverter<Swift.Int8>.toNode(value.i8q, env: env))
        try env.setNamedProperty(this, "i16", Swift.Int16.toNode(value.i16, env: env))
        try env.setNamedProperty(this, "i16q", OptionalConverter<Swift.Int16>.toNode(value.i16q, env: env))
        try env.setNamedProperty(this, "i32", Swift.Int32.toNode(value.i32, env: env))
        try env.setNamedProperty(this, "i32q", OptionalConverter<Swift.Int32>.toNode(value.i32q, env: env))
        try env.setNamedProperty(this, "i64", Swift.Int64.toNode(value.i64, env: env))
        try env.setNamedProperty(this, "i64q", OptionalConverter<Swift.Int64>.toNode(value.i64q, env: env))
        try env.setNamedProperty(this, "i", Swift.Int.toNode(value.i, env: env))
        try env.setNamedProperty(this, "iq", OptionalConverter<Swift.Int>.toNode(value.iq, env: env))
        try env.setNamedProperty(this, "f", Swift.Float.toNode(value.f, env: env))
        try env.setNamedProperty(this, "fq", OptionalConverter<Swift.Float>.toNode(value.fq, env: env))
        try env.setNamedProperty(this, "d", Swift.Double.toNode(value.d, env: env))
        try env.setNamedProperty(this, "dq", OptionalConverter<Swift.Double>.toNode(value.dq, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Primitives.PrimitiveHolder",
            properties: [
                "staticMutableProperty": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticMutableProperty", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.UInt8>>.toNode(TestAPI.Primitives.PrimitiveHolder.staticMutableProperty, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticMutableProperty", expectedArgumentCount: 1) { env in
                                TestAPI.Primitives.PrimitiveHolder.staticMutableProperty = try env.argument(at: 0, converter: ArrayConverter<OptionalConverter<Swift.UInt8>>.self)
                                return nil
                            }
                        }),
                    isStatic: true
                ),
                "staticProperty": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticProperty", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.UInt8>>.toNode(TestAPI.Primitives.PrimitiveHolder.staticProperty, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "b": (.stored(mutable: true), isStatic: false),
                "bq": (.stored(mutable: true), isStatic: false),
                "ui8": (.stored(mutable: true), isStatic: false),
                "ui8q": (.stored(mutable: true), isStatic: false),
                "ui16": (.stored(mutable: true), isStatic: false),
                "ui16q": (.stored(mutable: true), isStatic: false),
                "ui32": (.stored(mutable: true), isStatic: false),
                "ui32q": (.stored(mutable: true), isStatic: false),
                "ui64": (.stored(mutable: true), isStatic: false),
                "ui64q": (.stored(mutable: true), isStatic: false),
                "ui": (.stored(mutable: true), isStatic: false),
                "uiq": (.stored(mutable: true), isStatic: false),
                "i8": (.stored(mutable: true), isStatic: false),
                "i8q": (.stored(mutable: true), isStatic: false),
                "i16": (.stored(mutable: true), isStatic: false),
                "i16q": (.stored(mutable: true), isStatic: false),
                "i32": (.stored(mutable: true), isStatic: false),
                "i32q": (.stored(mutable: true), isStatic: false),
                "i64": (.stored(mutable: true), isStatic: false),
                "i64q": (.stored(mutable: true), isStatic: false),
                "i": (.stored(mutable: true), isStatic: false),
                "iq": (.stored(mutable: true), isStatic: false),
                "f": (.stored(mutable: true), isStatic: false),
                "fq": (.stored(mutable: true), isStatic: false),
                "d": (.stored(mutable: true), isStatic: false),
                "dq": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "Primitives.PrimitiveHolder_constructor", expectedArgumentCount: 26) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "b", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "bq", env.argument(at: 1))
                    try env.env.setNamedProperty(this, "ui8", env.argument(at: 2))
                    try env.env.setNamedProperty(this, "ui8q", env.argument(at: 3))
                    try env.env.setNamedProperty(this, "ui16", env.argument(at: 4))
                    try env.env.setNamedProperty(this, "ui16q", env.argument(at: 5))
                    try env.env.setNamedProperty(this, "ui32", env.argument(at: 6))
                    try env.env.setNamedProperty(this, "ui32q", env.argument(at: 7))
                    try env.env.setNamedProperty(this, "ui64", env.argument(at: 8))
                    try env.env.setNamedProperty(this, "ui64q", env.argument(at: 9))
                    try env.env.setNamedProperty(this, "ui", env.argument(at: 10))
                    try env.env.setNamedProperty(this, "uiq", env.argument(at: 11))
                    try env.env.setNamedProperty(this, "i8", env.argument(at: 12))
                    try env.env.setNamedProperty(this, "i8q", env.argument(at: 13))
                    try env.env.setNamedProperty(this, "i16", env.argument(at: 14))
                    try env.env.setNamedProperty(this, "i16q", env.argument(at: 15))
                    try env.env.setNamedProperty(this, "i32", env.argument(at: 16))
                    try env.env.setNamedProperty(this, "i32q", env.argument(at: 17))
                    try env.env.setNamedProperty(this, "i64", env.argument(at: 18))
                    try env.env.setNamedProperty(this, "i64q", env.argument(at: 19))
                    try env.env.setNamedProperty(this, "i", env.argument(at: 20))
                    try env.env.setNamedProperty(this, "iq", env.argument(at: 21))
                    try env.env.setNamedProperty(this, "f", env.argument(at: 22))
                    try env.env.setNamedProperty(this, "fq", env.argument(at: 23))
                    try env.env.setNamedProperty(this, "d", env.argument(at: 24))
                    try env.env.setNamedProperty(this, "dq", env.argument(at: 25))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "Primitives.PrimitiveHolder",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Ranges+node.swift
extension TestAPI.Ranges: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Ranges")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Ranges",
            properties: [
                "echoUInt8Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt8Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Swift.UInt8>.toNode(
                                TestAPI.Ranges.echoUInt8Range(
                                    try env.argument(at: 0, converter: RangeConverter<Swift.UInt8>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt16Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt16Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Swift.UInt16>.toNode(
                                TestAPI.Ranges.echoUInt16Range(
                                    try env.argument(at: 0, converter: RangeConverter<Swift.UInt16>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt32Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt32Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Swift.UInt32>.toNode(
                                TestAPI.Ranges.echoUInt32Range(
                                    try env.argument(at: 0, converter: RangeConverter<Swift.UInt32>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt64Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt64Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Swift.UInt64>.toNode(
                                TestAPI.Ranges.echoUInt64Range(
                                    try env.argument(at: 0, converter: RangeConverter<Swift.UInt64>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUIntRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUIntRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Swift.UInt>.toNode(
                                TestAPI.Ranges.echoUIntRange(
                                    try env.argument(at: 0, converter: RangeConverter<Swift.UInt>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt8Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt8Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Swift.Int8>.toNode(
                                TestAPI.Ranges.echoInt8Range(
                                    try env.argument(at: 0, converter: RangeConverter<Swift.Int8>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt16Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt16Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Swift.Int16>.toNode(
                                TestAPI.Ranges.echoInt16Range(
                                    try env.argument(at: 0, converter: RangeConverter<Swift.Int16>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt32Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt32Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Swift.Int32>.toNode(
                                TestAPI.Ranges.echoInt32Range(
                                    try env.argument(at: 0, converter: RangeConverter<Swift.Int32>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt64Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt64Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Swift.Int64>.toNode(
                                TestAPI.Ranges.echoInt64Range(
                                    try env.argument(at: 0, converter: RangeConverter<Swift.Int64>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoIntRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoIntRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Swift.Int>.toNode(
                                TestAPI.Ranges.echoIntRange(
                                    try env.argument(at: 0, converter: RangeConverter<Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "int16Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int16Range", expectedArgumentCount: 0) { env in
                                return try RangeConverter<Swift.Int16>.toNode(TestAPI.Ranges.int16Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "int32Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int32Range", expectedArgumentCount: 0) { env in
                                return try RangeConverter<Swift.Int32>.toNode(TestAPI.Ranges.int32Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "int64Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int64Range", expectedArgumentCount: 0) { env in
                                return try RangeConverter<Swift.Int64>.toNode(TestAPI.Ranges.int64Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "int8Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int8Range", expectedArgumentCount: 0) { env in
                                return try RangeConverter<Swift.Int8>.toNode(TestAPI.Ranges.int8Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "intRange": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intRange", expectedArgumentCount: 0) { env in
                                return try RangeConverter<Swift.Int>.toNode(TestAPI.Ranges.intRange, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uInt16Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uInt16Range", expectedArgumentCount: 0) { env in
                                return try RangeConverter<Swift.UInt16>.toNode(TestAPI.Ranges.uInt16Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uInt32Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uInt32Range", expectedArgumentCount: 0) { env in
                                return try RangeConverter<Swift.UInt32>.toNode(TestAPI.Ranges.uInt32Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uInt64Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uInt64Range", expectedArgumentCount: 0) { env in
                                return try RangeConverter<Swift.UInt64>.toNode(TestAPI.Ranges.uInt64Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uInt8Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uInt8Range", expectedArgumentCount: 0) { env in
                                return try RangeConverter<Swift.UInt8>.toNode(TestAPI.Ranges.uInt8Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uIntRange": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uIntRange", expectedArgumentCount: 0) { env in
                                return try RangeConverter<Swift.UInt>.toNode(TestAPI.Ranges.uIntRange, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Ranges_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Ranges",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Results+node.swift
extension TestAPI.Results: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Results")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Results",
            properties: [
                "processResult": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "processResult", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.Results.processResult(
                                    try env.argument(at: 0, converter: ResultConverter<Swift.String, TestAPI.Results.Error>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "aFailure": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "aFailure", expectedArgumentCount: 0) { env in
                                return try ResultConverter<Swift.Int, TestAPI.Results.Error>.toNode(TestAPI.Results.aFailure, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "aSuccess": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "aSuccess", expectedArgumentCount: 0) { env in
                                return try ResultConverter<Swift.Int, TestAPI.Results.Error>.toNode(TestAPI.Results.aSuccess, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Results_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Results",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Results.Error+node.swift
extension TestAPI.Results.Error: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            message: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "message")
                return try Swift.String.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "Results.Error", env: env)
        let args: [NAPI.Value] = [
            try Swift.String.toNode(value.message, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Results.Error",
            properties: [
                "message": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "Results.Error_constructor", expectedArgumentCount: 1) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "message", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "Results.Error",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.SimpleEnum+node.swift
extension TestAPI.SimpleEnum: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        switch try String.fromNode(value, env: env) {
        case "red": return Self.red
        case "green": return Self.green
        case "blue": return Self.blue
        case let unknown: fatalError("invalid enum string '\(unknown)' for TestAPI.SimpleEnum")
        }
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        switch value {
        case .red:
            return try String.toNode("red", env: env)
        case .green:
            return try String.toNode("green", env: env)
        case .blue:
            return try String.toNode("blue", env: env)
        }
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let object = try env.createObject()
        let props = try NodeClass.descriptorsFor(properties: [
            "pickAColor": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "pickAColor", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                        let result = try OptionalConverter<TestAPI.SimpleEnum>.toNode(
                            TestAPI.SimpleEnum.pickAColor(
                                try env.argument(at: 0, converter: Swift.Int.self)
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
            "hexMethod": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "hexMethod", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                        let result = try Swift.String.toNode(
                            env.argument(at: 0, converter: TestAPI.SimpleEnum.self).hexMethod(
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
            "resetFavoriteColor": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "resetFavoriteColor", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                        let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                            TestAPI.SimpleEnum.resetFavoriteColor(
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
            "favoriteColor": (
                .accessor(
                    getter: { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "favoriteColor", expectedArgumentCount: 0) { env in
                            return try TestAPI.SimpleEnum.toNode(TestAPI.SimpleEnum.favoriteColor, env: env.env)
                        }
                    },
                    setter: { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "favoriteColor", expectedArgumentCount: 1) { env in
                            TestAPI.SimpleEnum.favoriteColor = try env.argument(at: 0, converter: TestAPI.SimpleEnum.self)
                            return nil
                        }
                    }),
                isStatic: true
            ),
            "getHex": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "hex", expectedArgumentCount: 1) { env in
                        return try Swift.Int.toNode(env.argument(at: 0, converter: TestAPI.SimpleEnum.self).hex, env: env.env)
                    }
                },
                isStatic: true
            ),
        ], env: env)
        try env.defineProperties(object, properties: props)
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "SimpleEnum",
            nodeClass: object
        )
    }
}

// MARK: - TestAPI.Strings+node.swift
extension TestAPI.Strings: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Strings")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Strings",
            properties: [
                "echo": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echo", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.Strings.echo(
                                    try env.argument(at: 0, converter: Swift.String.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "accent": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "accent", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(TestAPI.Strings.accent, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "chinese": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "chinese", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(TestAPI.Strings.chinese, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "chineseBMP": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "chineseBMP", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(TestAPI.Strings.chineseBMP, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "chineseSIP": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "chineseSIP", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(TestAPI.Strings.chineseSIP, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "emoji": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "emoji", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(TestAPI.Strings.emoji, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "emojiMulti": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "emojiMulti", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(TestAPI.Strings.emojiMulti, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "script": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "script", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(TestAPI.Strings.script, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "simple": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "simple", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(TestAPI.Strings.simple, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Strings_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Strings",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Structs+node.swift
extension TestAPI.Structs: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Structs")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Structs",
            properties: [
                :
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Structs_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Structs",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Structs.MemberwiseStruct+node.swift
extension TestAPI.Structs.MemberwiseStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            immutable: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "immutable")
                return try Swift.String.fromNode(fieldValue, env: env)
            }(),
            mutable: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "mutable")
                return try Swift.String.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "Structs.MemberwiseStruct", env: env)
        let args: [NAPI.Value] = [
            try Swift.String.toNode(value.immutable, env: env),
            try Swift.String.toNode(value.mutable, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "immutable", Swift.String.toNode(value.immutable, env: env))
        try env.setNamedProperty(this, "mutable", Swift.String.toNode(value.mutable, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Structs.MemberwiseStruct",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.Structs.MemberwiseStruct.toNode(
                                TestAPI.Structs.MemberwiseStruct(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "asyncGetMutable": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncGetMutable", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Structs.MemberwiseStruct.self))
                            Task {
                                do {
                                    let taskResult: String = await swiftSelf.value.asyncGetMutable(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "immutable": (.stored(mutable: true), isStatic: false),
                "mutable": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "Structs.MemberwiseStruct_constructor", expectedArgumentCount: 2) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "immutable", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "mutable", env.argument(at: 1))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "Structs.MemberwiseStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Structs.MutableStruct+node.swift
extension TestAPI.Structs.MutableStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            i: try { () -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "i")
                return try Swift.Int.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "Structs.MutableStruct", env: env)
        let args: [NAPI.Value] = [
            try Swift.Int.toNode(value.i, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "i", Swift.Int.toNode(value.i, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Structs.MutableStruct",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.Structs.MutableStruct.toNode(
                                TestAPI.Structs.MutableStruct(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "increment": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "increment", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: TestAPI.Structs.MutableStruct.self)
                            FishyJoesCommonRuntime.silenceMutationWarning(&mutatingSelf)
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                mutatingSelf.increment(
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "incrementAsync": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "incrementAsync", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let mutatingSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Structs.MutableStruct.self))
                            let jsThis = try env.env.reference(env.this())
                            Task {
                                do {
                                    let taskResult: Void = await mutatingSelf.value.incrementAsync(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try FishyJoesCommonRuntime.VoidConverter.toNode(taskResult, env: env)
                                        } catch {
                                            try Self.mutateNode(mutatingSelf.value, this: jsThis.value(env: env), env: env)
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try Self.mutateNode(mutatingSelf.value, this: jsThis.value(env: env), env: env)
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try Self.mutateNode(mutatingSelf.value, this: jsThis.value(env: env), env: env)
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "asyncGetI": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncGetI", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Structs.MutableStruct.self))
                            Task {
                                do {
                                    let taskResult: Int = await swiftSelf.value.asyncGetI(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "i": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "Structs.MutableStruct_constructor", expectedArgumentCount: 1) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "i", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "Structs.MutableStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Structs.PuttingTypesIntoQuestionablePlaces+node.swift
extension TestAPI.Structs.PuttingTypesIntoQuestionablePlaces: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.Structs.PuttingTypesIntoQuestionablePlaces {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.Structs.PuttingTypesIntoQuestionablePlaces, got nil")
        }
        return try Box<TestAPI.Structs.PuttingTypesIntoQuestionablePlaces>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.Structs.PuttingTypesIntoQuestionablePlaces, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "Structs_PuttingTypesIntoQuestionablePlaces", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.Structs.PuttingTypesIntoQuestionablePlaces, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.Structs.PuttingTypesIntoQuestionablePlaces, got nil")
        }
        try Box<TestAPI.Structs.PuttingTypesIntoQuestionablePlaces>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Structs_PuttingTypesIntoQuestionablePlaces",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.Structs.PuttingTypesIntoQuestionablePlaces.toNode(
                                TestAPI.Structs.PuttingTypesIntoQuestionablePlaces(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "testCall": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "testCall", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                env.this(converter: TestAPI.Structs.PuttingTypesIntoQuestionablePlaces.self).testCall(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "toString": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "toString", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                "\(env.this(converter: TestAPI.Structs.PuttingTypesIntoQuestionablePlaces.self))",
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                )
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Structs_PuttingTypesIntoQuestionablePlaces_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.Structs.PuttingTypesIntoQuestionablePlaces>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Structs_PuttingTypesIntoQuestionablePlaces",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Structs.ReferenceStruct+node.swift
extension TestAPI.Structs.ReferenceStruct: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.Structs.ReferenceStruct {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.Structs.ReferenceStruct, got nil")
        }
        return try Box<TestAPI.Structs.ReferenceStruct>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.Structs.ReferenceStruct, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "Structs.ReferenceStruct", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.Structs.ReferenceStruct, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.Structs.ReferenceStruct, got nil")
        }
        try Box<TestAPI.Structs.ReferenceStruct>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Structs.ReferenceStruct",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.Structs.ReferenceStruct.toNode(
                                TestAPI.Structs.ReferenceStruct(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "asyncGetMutable": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncGetMutable", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Structs.ReferenceStruct.self))
                            Task {
                                do {
                                    let taskResult: String = await swiftSelf.value.asyncGetMutable(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "immutable": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "immutable", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.Structs.ReferenceStruct.self).immutable, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "mutable": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "mutable", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.Structs.ReferenceStruct.self).mutable, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "mutable", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: TestAPI.Structs.ReferenceStruct.self)
                                FishyJoesCommonRuntime.silenceMutationWarning(&mutatingSelf)
                                mutatingSelf.mutable = try env.argument(at: 0, converter: Swift.String.self)
                                try TestAPI.Structs.ReferenceStruct.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
                "toString": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "toString", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                "\(env.this(converter: TestAPI.Structs.ReferenceStruct.self))",
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                )
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Structs.ReferenceStruct_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.Structs.ReferenceStruct>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Structs.ReferenceStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestAsyncForeignSideFunctionsStruct+node.swift
extension TestAPI.TestAsyncForeignSideFunctionsStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            const42: try { () -> () async throws -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "const42")
                return try AsyncFunction0Converter<Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            iabs: try { () -> (Swift.Int) async throws -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "iabs")
                return try AsyncFunction1Converter<Swift.Int, Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            intCompose: try { () -> (@escaping (Swift.Int) async throws -> Swift.Int, @escaping (Swift.Int) async throws -> Swift.Int) throws -> (Swift.Int) async throws -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "intCompose")
                return try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.fromNode(fieldValue, env: env)
            }(),
            add3Things: try { () -> (Swift.Float, Swift.Double, Swift.Int) async throws -> Swift.Double in
                let fieldValue = try env.getNamedProperty(value, "add3Things")
                return try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.fromNode(fieldValue, env: env)
            }(),
            makeList: try { () -> (Swift.String, Swift.String, Swift.String, Swift.String) async throws -> Array<Swift.String> in
                let fieldValue = try env.getNamedProperty(value, "makeList")
                return try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.fromNode(fieldValue, env: env)
            }(),
            fifthThing: try { () -> (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int) async throws -> () async throws -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "fifthThing")
                return try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.fromNode(fieldValue, env: env)
            }(),
            six: try { () -> (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int, Swift.Int) async throws -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "six")
                return try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            willThrow: try { () -> () async throws -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "willThrow")
                return try AsyncFunction0Converter<Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            exercise0Fun: try { () -> (@escaping () async throws -> Swift.Int) async throws -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "exercise0Fun")
                return try AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            exercise1Fun: try { () -> (@escaping (Swift.Int) async throws -> Swift.Int) async throws -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "exercise1Fun")
                return try AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            exercise2Fun: try { () -> (@escaping (@escaping (Swift.Int) async throws -> Swift.Int, @escaping (Swift.Int) async throws -> Swift.Int) throws -> (Swift.Int) async throws -> Swift.Int) async throws -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "exercise2Fun")
                return try AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            exercise3Fun: try { () -> (@escaping (Swift.Float, Swift.Double, Swift.Int) async throws -> Swift.Double) async throws -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "exercise3Fun")
                return try AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            exercise4Fun: try { () -> (@escaping (Swift.String, Swift.String, Swift.String, Swift.String) async throws -> Array<Swift.String>) async throws -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "exercise4Fun")
                return try AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            exercise5Fun: try { () -> (@escaping (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int) async throws -> () async throws -> Swift.Int) async throws -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "exercise5Fun")
                return try AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            exercise6Fun: try { () -> (@escaping (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int, Swift.Int) async throws -> Swift.Int) async throws -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "exercise6Fun")
                return try AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            thunkTwiceMakerFun: try { () -> (@escaping () async throws -> Void) throws -> () async throws -> Void in
                let fieldValue = try env.getNamedProperty(value, "thunkTwiceMakerFun")
                return try Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>.fromNode(fieldValue, env: env)
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
            try AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>.toNode(value.exercise0Fun, env: env),
            try AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>.toNode(value.exercise1Fun, env: env),
            try AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>.toNode(value.exercise2Fun, env: env),
            try AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>.toNode(value.exercise3Fun, env: env),
            try AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>.toNode(value.exercise4Fun, env: env),
            try AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>.toNode(value.exercise5Fun, env: env),
            try AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>.toNode(value.exercise6Fun, env: env),
            try Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>.toNode(value.thunkTwiceMakerFun, env: env),
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
                "exercise0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction0Converter<Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise0(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise1": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise1", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction1Converter<Swift.Int, Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise1(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise2": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise2", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise2(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise3": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise3", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise3(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise4": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise4", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise4(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise5": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise5", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise5(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise6(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "thunkTwiceMaker": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "thunkTwiceMaker", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.toNode(
                                env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self).thunkTwiceMaker(
                                    thunk: try env.argument(at: 0, converter: AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "witness": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "witness", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI_CommonInterface._TestAsyncFunctionsConverter.toNode(
                                env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self).witness(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "defaultExercise6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "defaultExercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.defaultExercise6(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "const42": (.stored(mutable: true), isStatic: false),
                "iabs": (.stored(mutable: true), isStatic: false),
                "intCompose": (.stored(mutable: true), isStatic: false),
                "add3Things": (.stored(mutable: true), isStatic: false),
                "makeList": (.stored(mutable: true), isStatic: false),
                "fifthThing": (.stored(mutable: true), isStatic: false),
                "six": (.stored(mutable: true), isStatic: false),
                "willThrow": (.stored(mutable: true), isStatic: false),
                "exercise0Fun": (.stored(mutable: true), isStatic: false),
                "exercise1Fun": (.stored(mutable: true), isStatic: false),
                "exercise2Fun": (.stored(mutable: true), isStatic: false),
                "exercise3Fun": (.stored(mutable: true), isStatic: false),
                "exercise4Fun": (.stored(mutable: true), isStatic: false),
                "exercise5Fun": (.stored(mutable: true), isStatic: false),
                "exercise6Fun": (.stored(mutable: true), isStatic: false),
                "thunkTwiceMakerFun": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestAsyncForeignSideFunctionsStruct_constructor", expectedArgumentCount: 16) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "const42", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "iabs", env.argument(at: 1))
                    try env.env.setNamedProperty(this, "intCompose", env.argument(at: 2))
                    try env.env.setNamedProperty(this, "add3Things", env.argument(at: 3))
                    try env.env.setNamedProperty(this, "makeList", env.argument(at: 4))
                    try env.env.setNamedProperty(this, "fifthThing", env.argument(at: 5))
                    try env.env.setNamedProperty(this, "six", env.argument(at: 6))
                    try env.env.setNamedProperty(this, "willThrow", env.argument(at: 7))
                    try env.env.setNamedProperty(this, "exercise0Fun", env.argument(at: 8))
                    try env.env.setNamedProperty(this, "exercise1Fun", env.argument(at: 9))
                    try env.env.setNamedProperty(this, "exercise2Fun", env.argument(at: 10))
                    try env.env.setNamedProperty(this, "exercise3Fun", env.argument(at: 11))
                    try env.env.setNamedProperty(this, "exercise4Fun", env.argument(at: 12))
                    try env.env.setNamedProperty(this, "exercise5Fun", env.argument(at: 13))
                    try env.env.setNamedProperty(this, "exercise6Fun", env.argument(at: 14))
                    try env.env.setNamedProperty(this, "thunkTwiceMakerFun", env.argument(at: 15))
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

// MARK: - TestAPI.TestAsyncFunctions+node.swift
struct _NodeTestAsyncFunctions: TestAPI.TestAsyncFunctions {
    let _nodeWitness: NodeReference

    var add3Things: (Float, Double, Int) async throws -> Double {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let add3Things = try env.getNamedProperty(napiValue, "add3Things")
                return try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.fromNode(add3Things, env: env)
            }
        }
    }
    var const42: () async throws -> Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let const42 = try env.getNamedProperty(napiValue, "const42")
                return try AsyncFunction0Converter<Swift.Int>.fromNode(const42, env: env)
            }
        }
    }
    var fifthThing: (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let fifthThing = try env.getNamedProperty(napiValue, "fifthThing")
                return try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.fromNode(fifthThing, env: env)
            }
        }
    }
    var iabs: (Int) async throws -> Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let iabs = try env.getNamedProperty(napiValue, "iabs")
                return try AsyncFunction1Converter<Swift.Int, Swift.Int>.fromNode(iabs, env: env)
            }
        }
    }
    var intCompose: (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let intCompose = try env.getNamedProperty(napiValue, "intCompose")
                return try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.fromNode(intCompose, env: env)
            }
        }
    }
    var makeList: (String, String, String, String) async throws -> Array<String> {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let makeList = try env.getNamedProperty(napiValue, "makeList")
                return try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.fromNode(makeList, env: env)
            }
        }
    }
    var six: (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let six = try env.getNamedProperty(napiValue, "six")
                return try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.fromNode(six, env: env)
            }
        }
    }
    var willThrow: () async throws -> Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let willThrow = try env.getNamedProperty(napiValue, "willThrow")
                return try AsyncFunction0Converter<Swift.Int>.fromNode(willThrow, env: env)
            }
        }
    }
    public func exercise0(_ fn: @escaping () async throws -> Int) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise0 = try env.getNamedProperty(napiValue, "exercise0")
            let result = try env.callFunction(napiValue, exercise0, [try AsyncFunction0Converter<Swift.Int>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func exercise1(_ fn: @escaping (Int) async throws -> Int) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise1 = try env.getNamedProperty(napiValue, "exercise1")
            let result = try env.callFunction(napiValue, exercise1, [try AsyncFunction1Converter<Swift.Int, Swift.Int>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func exercise2(_ fn: @escaping (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise2 = try env.getNamedProperty(napiValue, "exercise2")
            let result = try env.callFunction(napiValue, exercise2, [try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func exercise3(_ fn: @escaping (Float, Double, Int) async throws -> Double) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise3 = try env.getNamedProperty(napiValue, "exercise3")
            let result = try env.callFunction(napiValue, exercise3, [try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func exercise4(_ fn: @escaping (String, String, String, String) async throws -> Array<String>) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise4 = try env.getNamedProperty(napiValue, "exercise4")
            let result = try env.callFunction(napiValue, exercise4, [try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func exercise5(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise5 = try env.getNamedProperty(napiValue, "exercise5")
            let result = try env.callFunction(napiValue, exercise5, [try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func exercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise6 = try env.getNamedProperty(napiValue, "exercise6")
            let result = try env.callFunction(napiValue, exercise6, [try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func thunkTwiceMaker(thunk: @escaping () async throws -> Void) throws -> () async throws -> Void {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let thunkTwiceMaker = try env.getNamedProperty(napiValue, "thunkTwiceMaker")
            let result = try env.callFunction(napiValue, thunkTwiceMaker, [try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.toNode(thunk, env: env)])
            return try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.fromNode(result, env: env)
        }
    }
    public func defaultExercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let defaultExercise6 = try env.getNamedProperty(napiValue, "defaultExercise6")
            let result = try env.callFunction(napiValue, defaultExercise6, [try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func witness() throws -> TestAsyncFunctions {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let witness = try env.getNamedProperty(napiValue, "witness")
            let result = try env.callFunction(napiValue, witness, [])
            return try TestAPI_CommonInterface._TestAsyncFunctionsConverter.fromNode(result, env: env)
        }
    }
}

extension TestAPI_CommonInterface._TestAsyncFunctionsConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestAsyncFunctions", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.TestAsyncFunctions, got nil")
                }
                return try Box<TestAPI.TestAsyncFunctions>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeTestAsyncFunctions(
                    _nodeWitness: try NodeReference(env: env, value: value)
                )
            }
        }}
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestAsyncFunctions", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let coreObject = try env.createObject()
        let fromCoreFunctionCallback: NAPI.Callback = { env, info in
            FishyJoesNodeRuntime.callbackBody(env, info, name: "fromCore", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                let coreArg = try env.argument(at: 0)

                let env = env.env
                let global = try env.getGlobal()
                let object = try env.getNamedProperty(global, "Object")
                let create = try env.getNamedProperty(object, "create")

                let result = try env.callFunction(object, create, [coreArg])

                let defaultExercise6FunctionCallback: NAPI.Callback = { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "defaultExercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                        let (deferred, promise) = try env.env.createPromise()
                        let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.self))
                        let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                        let _wrappedSwiftSelf = TestAPI_CommonInterface.TestAsyncFunctions_sans_defaultExercise6(wrapped: try FishyJoesCommonRuntime.silenceTryWarning(swiftSelf.value))
                        Task {
                            do {
                                let taskResult: String = try await _wrappedSwiftSelf.defaultExercise6(
                                    arg0.value
                                )
                                try onMainThread { env in
                                    let convertedTaskResult: NAPI.Value
                                    do {
                                        convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                    } catch {
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                        return
                                    }
                                    try env.resolveDeferred(deferred, convertedTaskResult)
                                }
                            } catch {
                                try onMainThread { env in
                                    try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                }
                            }
                        }
                        return promise
                    }
                }
                let defaultExercise6Function = try env.createFunction(
                    "defaultExercise6",
                    defaultExercise6FunctionCallback,
                    nil
                )
                if !(try env.hasNamedProperty(result, "defaultExercise6")) {
                    try env.setNamedProperty(result, "defaultExercise6", defaultExercise6Function)
                }

                return result
            }
        }
        let fromCoreFunction = try env.createFunction("fromCore", fromCoreFunctionCallback, nil)
        try env.setNamedProperty(fromCoreFunction, "static", env.getBoolean(true))
        try env.setNamedProperty(coreObject, "fromCore", fromCoreFunction)
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestAsyncFunctions",
            nodeClass: coreObject
        )

        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_TestAsyncFunctions",
            properties: [
                "exercise0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction0Converter<Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise0(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise1": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise1", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction1Converter<Swift.Int, Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise1(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise2": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise2", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise2(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise3": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise3", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise3(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise4": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise4", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise4(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise5": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise5", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise5(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise6(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "thunkTwiceMaker": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "thunkTwiceMaker", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).thunkTwiceMaker(
                                    thunk: try env.argument(at: 0, converter: AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "defaultExercise6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "defaultExercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            let _wrappedSwiftSelf = TestAPI_CommonInterface.TestAsyncFunctions_sans_defaultExercise6(wrapped: try FishyJoesCommonRuntime.silenceTryWarning(swiftSelf.value))
                            Task {
                                do {
                                    let taskResult: String = try await _wrappedSwiftSelf.defaultExercise6(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "witness": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "witness", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI_CommonInterface._TestAsyncFunctionsConverter.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).witness(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "add3Things": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "add3Things", expectedArgumentCount: 0) { env in
                                return try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).add3Things, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "const42": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "const42", expectedArgumentCount: 0) { env in
                                return try AsyncFunction0Converter<Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).const42, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "fifthThing": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "fifthThing", expectedArgumentCount: 0) { env in
                                return try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).fifthThing, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "iabs": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "iabs", expectedArgumentCount: 0) { env in
                                return try AsyncFunction1Converter<Swift.Int, Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).iabs, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "intCompose": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intCompose", expectedArgumentCount: 0) { env in
                                return try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).intCompose, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "makeList": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "makeList", expectedArgumentCount: 0) { env in
                                return try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).makeList, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "six": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "six", expectedArgumentCount: 0) { env in
                                return try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).six, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "willThrow": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "willThrow", expectedArgumentCount: 0) { env in
                                return try AsyncFunction0Converter<Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).willThrow, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_TestAsyncFunctions_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestAsyncFunctions>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_TestAsyncFunctions",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestAsyncSwiftSideFunctionsClass+node.swift
extension TestAPI.TestAsyncSwiftSideFunctionsClass: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.TestAsyncSwiftSideFunctionsClass {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.TestAsyncSwiftSideFunctionsClass, got nil")
        }
        return try Box<TestAPI.TestAsyncSwiftSideFunctionsClass>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.TestAsyncSwiftSideFunctionsClass, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "TestAsyncSwiftSideFunctionsClass", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.TestAsyncSwiftSideFunctionsClass, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.TestAsyncSwiftSideFunctionsClass, got nil")
        }
        try Box<TestAPI.TestAsyncSwiftSideFunctionsClass>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestAsyncSwiftSideFunctionsClass",
            properties: [
                "exercise0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction0Converter<Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise0(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise1": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise1", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction1Converter<Swift.Int, Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise1(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise2": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise2", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise2(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise3": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise3", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise3(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise4": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise4", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise4(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise5": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise5", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise5(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "exercise6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise6(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "thunkTwiceMaker": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "thunkTwiceMaker", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.toNode(
                                env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self).thunkTwiceMaker(
                                    thunk: try env.argument(at: 0, converter: AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "witness": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "witness", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI_CommonInterface._TestAsyncFunctionsConverter.toNode(
                                env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self).witness(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "init": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "init", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.TestAsyncSwiftSideFunctionsClass.toNode(
                                TestAPI.TestAsyncSwiftSideFunctionsClass(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "defaultExercise6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "defaultExercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.defaultExercise6(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "add3Things": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "add3Things", expectedArgumentCount: 0) { env in
                                return try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self).add3Things, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "const42": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "const42", expectedArgumentCount: 0) { env in
                                return try AsyncFunction0Converter<Swift.Int>.toNode(env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self).const42, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "fifthThing": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "fifthThing", expectedArgumentCount: 0) { env in
                                return try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toNode(env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self).fifthThing, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "iabs": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "iabs", expectedArgumentCount: 0) { env in
                                return try AsyncFunction1Converter<Swift.Int, Swift.Int>.toNode(env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self).iabs, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "intCompose": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intCompose", expectedArgumentCount: 0) { env in
                                return try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toNode(env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self).intCompose, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "makeList": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "makeList", expectedArgumentCount: 0) { env in
                                return try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self).makeList, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "six": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "six", expectedArgumentCount: 0) { env in
                                return try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self).six, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "willThrow": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "willThrow", expectedArgumentCount: 0) { env in
                                return try AsyncFunction0Converter<Swift.Int>.toNode(env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self).willThrow, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "toString": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "toString", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                "\(env.this(converter: TestAPI.TestAsyncSwiftSideFunctionsClass.self))",
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                )
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "TestAsyncSwiftSideFunctionsClass_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestAsyncSwiftSideFunctionsClass>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestAsyncSwiftSideFunctionsClass",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestDefaultComputedProperties+node.swift
struct _NodeTestDefaultComputedProperties: TestAPI.TestDefaultComputedProperties {
    let _nodeWitness: NodeReference

    var noot: Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let noot = try env.getNamedProperty(napiValue, "noot")
                return try Swift.Int.fromNode(noot, env: env)
            }
        }
    }
    var pluto: String {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let pluto = try env.getNamedProperty(napiValue, "plutonic")
                return try Swift.String.fromNode(pluto, env: env)
            }
        }
    }
}

extension TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestDefaultComputedProperties", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.TestDefaultComputedProperties, got nil")
                }
                return try Box<TestAPI.TestDefaultComputedProperties>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeTestDefaultComputedProperties(
                    _nodeWitness: try NodeReference(env: env, value: value)
                )
            }
        }}
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestDefaultComputedProperties", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let coreObject = try env.createObject()
        let fromCoreFunctionCallback: NAPI.Callback = { env, info in
            FishyJoesNodeRuntime.callbackBody(env, info, name: "fromCore", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                let coreArg = try env.argument(at: 0)

                let env = env.env
                let global = try env.getGlobal()
                let object = try env.getNamedProperty(global, "Object")
                let create = try env.getNamedProperty(object, "create")

                let result = try env.callFunction(object, create, [coreArg])

                let nootGetterCallback: NAPI.Callback = { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "noot", expectedArgumentCount: 0) { env in
                        let _wrappedSwiftSelf = TestAPI_CommonInterface.TestDefaultComputedProperties_sans_noot(wrapped: try FishyJoesCommonRuntime.silenceTryWarning(env.this(converter: TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter.self)))
                        return try Swift.Int.toNode(_wrappedSwiftSelf.noot, env: env.env)
                    }
                }
                let nootNodeName = try String.toNode("noot", env: env)
                let nootPropertyDesc = napi_property_descriptor(
                    utf8name: nil,
                    name: nootNodeName.ptr,
                    method: nil,
                    getter: nootGetterCallback,
                    setter: nil,
                    value: nil,
                    attributes: napi_default,
                    data: nil
                )

                if !(try env.hasNamedProperty(result, "noot")) {
                    try env.defineProperties(result, properties: [nootPropertyDesc])
                }

                let plutonicGetterCallback: NAPI.Callback = { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "plutonic", expectedArgumentCount: 0) { env in
                        let _wrappedSwiftSelf = TestAPI_CommonInterface.TestDefaultComputedProperties_sans_pluto(wrapped: try FishyJoesCommonRuntime.silenceTryWarning(env.this(converter: TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter.self)))
                        return try Swift.String.toNode(_wrappedSwiftSelf.pluto, env: env.env)
                    }
                }
                let plutonicNodeName = try String.toNode("plutonic", env: env)
                let plutonicPropertyDesc = napi_property_descriptor(
                    utf8name: nil,
                    name: plutonicNodeName.ptr,
                    method: nil,
                    getter: plutonicGetterCallback,
                    setter: nil,
                    value: nil,
                    attributes: napi_default,
                    data: nil
                )

                if !(try env.hasNamedProperty(result, "plutonic")) {
                    try env.defineProperties(result, properties: [plutonicPropertyDesc])
                }

                return result
            }
        }
        let fromCoreFunction = try env.createFunction("fromCore", fromCoreFunctionCallback, nil)
        try env.setNamedProperty(fromCoreFunction, "static", env.getBoolean(true))
        try env.setNamedProperty(coreObject, "fromCore", fromCoreFunction)
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestDefaultComputedProperties",
            nodeClass: coreObject
        )

        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_TestDefaultComputedProperties",
            properties: [
                "noot": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "noot", expectedArgumentCount: 0) { env in
                                let _wrappedSwiftSelf = TestAPI_CommonInterface.TestDefaultComputedProperties_sans_noot(wrapped: try FishyJoesCommonRuntime.silenceTryWarning(env.this(converter: TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter.self)))
                                return try Swift.Int.toNode(_wrappedSwiftSelf.noot, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "plutonic": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "plutonic", expectedArgumentCount: 0) { env in
                                let _wrappedSwiftSelf = TestAPI_CommonInterface.TestDefaultComputedProperties_sans_pluto(wrapped: try FishyJoesCommonRuntime.silenceTryWarning(env.this(converter: TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter.self)))
                                return try Swift.String.toNode(_wrappedSwiftSelf.pluto, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_TestDefaultComputedProperties_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestDefaultComputedProperties>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_TestDefaultComputedProperties",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestDefaultComputedPropertiesClass+node.swift
extension TestAPI.TestDefaultComputedPropertiesClass: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.TestDefaultComputedPropertiesClass {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.TestDefaultComputedPropertiesClass, got nil")
        }
        return try Box<TestAPI.TestDefaultComputedPropertiesClass>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.TestDefaultComputedPropertiesClass, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "TestDefaultComputedPropertiesReference", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.TestDefaultComputedPropertiesClass, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.TestDefaultComputedPropertiesClass, got nil")
        }
        try Box<TestAPI.TestDefaultComputedPropertiesClass>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestDefaultComputedPropertiesReference",
            properties: [
                "init": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "init", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try TestAPI.TestDefaultComputedPropertiesClass.toNode(
                                TestAPI.TestDefaultComputedPropertiesClass(
                                    spam: try env.argument(at: 0, converter: Swift.Bool.self),
                                    noot: try env.argument(at: 1, converter: Swift.Int.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "noot": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "noot", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(env.this(converter: TestAPI.TestDefaultComputedPropertiesClass.self).noot, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "noot", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: TestAPI.TestDefaultComputedPropertiesClass.self)
                                FishyJoesCommonRuntime.silenceMutationWarning(&mutatingSelf)
                                mutatingSelf.noot = try env.argument(at: 0, converter: Swift.Int.self)
                                try TestAPI.TestDefaultComputedPropertiesClass.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
                "plutonic": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "plutonic", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.TestDefaultComputedPropertiesClass.self).pluto, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "spam": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "spam", expectedArgumentCount: 0) { env in
                                return try Swift.Bool.toNode(env.this(converter: TestAPI.TestDefaultComputedPropertiesClass.self).spam, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "spam", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: TestAPI.TestDefaultComputedPropertiesClass.self)
                                FishyJoesCommonRuntime.silenceMutationWarning(&mutatingSelf)
                                mutatingSelf.spam = try env.argument(at: 0, converter: Swift.Bool.self)
                                try TestAPI.TestDefaultComputedPropertiesClass.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
                "toString": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "toString", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                "\(env.this(converter: TestAPI.TestDefaultComputedPropertiesClass.self))",
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                )
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "TestDefaultComputedPropertiesReference_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestDefaultComputedPropertiesClass>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestDefaultComputedPropertiesReference",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestDefaultComputedPropertiesEnum+node.swift
extension TestAPI.TestDefaultComputedPropertiesEnum: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        switch try String.fromNode(value, env: env) {
        case "qux": return Self.qux
        case let unknown: fatalError("invalid enum string '\(unknown)' for TestAPI.TestDefaultComputedPropertiesEnum")
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
            "getNoot": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "noot", expectedArgumentCount: 1) { env in
                        return try Swift.Int.toNode(env.argument(at: 0, converter: TestAPI.TestDefaultComputedPropertiesEnum.self).noot, env: env.env)
                    }
                },
                isStatic: true
            ),
            "getPlutonic": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "plutonic", expectedArgumentCount: 1) { env in
                        return try Swift.String.toNode(env.argument(at: 0, converter: TestAPI.TestDefaultComputedPropertiesEnum.self).pluto, env: env.env)
                    }
                },
                isStatic: true
            ),
            "getSpam": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "spam", expectedArgumentCount: 1) { env in
                        return try Swift.Bool.toNode(env.argument(at: 0, converter: TestAPI.TestDefaultComputedPropertiesEnum.self).spam, env: env.env)
                    }
                },
                isStatic: true
            ),
        ], env: env)
        try env.defineProperties(object, properties: props)
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestDefaultComputedPropertiesEnum",
            nodeClass: object
        )
    }
}

// MARK: - TestAPI.TestDefaultComputedPropertiesStruct+node.swift
extension TestAPI.TestDefaultComputedPropertiesStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            spam: try { () -> Swift.Bool in
                let fieldValue = try env.getNamedProperty(value, "spam")
                return try Swift.Bool.fromNode(fieldValue, env: env)
            }(),
            noot: try { () -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "noot")
                return try Swift.Int.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestDefaultComputedPropertiesStruct", env: env)
        let args: [NAPI.Value] = [
            try Swift.Bool.toNode(value.spam, env: env),
            try Swift.Int.toNode(value.noot, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "spam", Swift.Bool.toNode(value.spam, env: env))
        try env.setNamedProperty(this, "noot", Swift.Int.toNode(value.noot, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestDefaultComputedPropertiesStruct",
            properties: [
                "plutonic": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "plutonic", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.TestDefaultComputedPropertiesStruct.self).pluto, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "spam": (.stored(mutable: true), isStatic: false),
                "noot": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestDefaultComputedPropertiesStruct_constructor", expectedArgumentCount: 2) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "spam", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "noot", env.argument(at: 1))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestDefaultComputedPropertiesStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestDifferingExportNameProtocol+node.swift
struct _NodeTestDifferingExportNameProtocol: TestAPI.TestDifferingExportNameProtocol {
    let _nodeWitness: NodeReference

    var tata: Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let tata = try env.getNamedProperty(napiValue, "tata")
                return try Swift.Int.fromNode(tata, env: env)
            }
        }
    }
}

extension TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestDifferingExportNameProtocolDiffy", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.TestDifferingExportNameProtocol, got nil")
                }
                return try Box<TestAPI.TestDifferingExportNameProtocol>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeTestDifferingExportNameProtocol(
                    _nodeWitness: try NodeReference(env: env, value: value)
                )
            }
        }}
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestDifferingExportNameProtocolDiffy", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let coreObject = try env.createObject()
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
            path: "TestDifferingExportNameProtocol",
            nodeClass: coreObject
        )

        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_TestDifferingExportNameProtocolDiffy",
            properties: [
                "tata": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tata", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(env.this(converter: TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter.self).tata, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_TestDifferingExportNameProtocolDiffy_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestDifferingExportNameProtocol>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_TestDifferingExportNameProtocolDiffy",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestDifferingExportNameStruct+node.swift
extension TestAPI.TestDifferingExportNameStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            tata: try { () -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "tata")
                return try Swift.Int.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestDifferingExportNameStruct", env: env)
        let args: [NAPI.Value] = [
            try Swift.Int.toNode(value.tata, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "tata", Swift.Int.toNode(value.tata, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestDifferingExportNameStruct",
            properties: [
                "tata": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestDifferingExportNameStruct_constructor", expectedArgumentCount: 1) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "tata", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestDifferingExportNameStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestLeadingUnderscoredProp+node.swift
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
        let coreObject = try env.createObject()
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
                                return try Swift.String.toNode(env.this(converter: TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter.self)._leadingUnderscoreProp, env: env.env)
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

// MARK: - TestAPI.TestLeadingUnderscoredPropStruct+node.swift
extension TestAPI.TestLeadingUnderscoredPropStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            _leadingUnderscoreProp: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "_leadingUnderscoreProp")
                return try Swift.String.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestLeadingUnderscoredPropStruct", env: env)
        let args: [NAPI.Value] = [
            try Swift.String.toNode(value._leadingUnderscoreProp, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "_leadingUnderscoreProp", Swift.String.toNode(value._leadingUnderscoreProp, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestLeadingUnderscoredPropStruct",
            properties: [
                "_leadingUnderscoreProp": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestLeadingUnderscoredPropStruct_constructor", expectedArgumentCount: 1) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "_leadingUnderscoreProp", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestLeadingUnderscoredPropStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestMethodsProtocol+node.swift
struct _NodeTestMethodsProtocol: TestAPI.TestMethodsProtocol {
    let _nodeWitness: NodeReference

    public func foo() throws {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let foo = try env.getNamedProperty(napiValue, "foo")
            _ = try env.callFunction(napiValue, foo, [])
        }
    }
    public func bar() throws -> Bool {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let bar = try env.getNamedProperty(napiValue, "bar")
            let result = try env.callFunction(napiValue, bar, [])
            return try Swift.Bool.fromNode(result, env: env)
        }
    }
    public func baz(qux: Bool) throws {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let baz = try env.getNamedProperty(napiValue, "baz")
            _ = try env.callFunction(napiValue, baz, [try Swift.Bool.toNode(qux, env: env)])
        }
    }
    public func garply(_ _0: String) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let garply = try env.getNamedProperty(napiValue, "garply")
            let result = try env.callFunction(napiValue, garply, [try Swift.String.toNode(_0, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func xyzzy(thud: Int, grault: Array<Double>) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let xyzzy = try env.getNamedProperty(napiValue, "xyzzy")
            let result = try env.callFunction(napiValue, xyzzy, [try Swift.Int.toNode(thud, env: env), try ArrayConverter<Swift.Double>.toNode(grault, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func plugh(fred: (Bool, Double, Array<String>)) throws -> (Bool, Int, String) {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let plugh = try env.getNamedProperty(napiValue, "plugh")
            let result = try env.callFunction(napiValue, plugh, [try Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.toNode(fred, env: env)])
            return try Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.fromNode(result, env: env)
        }
    }
}

extension TestAPI_CommonInterface._TestMethodsProtocolConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestMethodsProtocol", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.TestMethodsProtocol, got nil")
                }
                return try Box<TestAPI.TestMethodsProtocol>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeTestMethodsProtocol(
                    _nodeWitness: try NodeReference(env: env, value: value)
                )
            }
        }}
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestMethodsProtocol", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let coreObject = try env.createObject()
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
            path: "TestMethodsProtocol",
            nodeClass: coreObject
        )

        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_TestMethodsProtocol",
            properties: [
                "foo": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "foo", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMethodsProtocolConverter.self).foo(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "bar": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "bar", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Bool.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMethodsProtocolConverter.self).bar(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "baz": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "baz", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMethodsProtocolConverter.self).baz(
                                    qux: try env.argument(at: 0, converter: Swift.Bool.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "garply": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "garply", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMethodsProtocolConverter.self).garply(
                                    try env.argument(at: 0, converter: Swift.String.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "xyzzy": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "xyzzy", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMethodsProtocolConverter.self).xyzzy(
                                    thud: try env.argument(at: 0, converter: Swift.Int.self),
                                    grault: try env.argument(at: 1, converter: ArrayConverter<Swift.Double>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "plugh": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "plugh", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMethodsProtocolConverter.self).plugh(
                                    fred: try env.argument(at: 0, converter: Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_TestMethodsProtocol_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestMethodsProtocol>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_TestMethodsProtocol",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestNonExportedProtocolEnum+node.swift
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

// MARK: - TestAPI.TestOptionalsProtocol+node.swift
struct _NodeTestOptionalsProtocol: TestAPI.TestOptionalsProtocol {
    let _nodeWitness: NodeReference

    var flarp: Optional<String> {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let flarp = try env.getNamedProperty(napiValue, "flarp")
                return try OptionalConverter<Swift.String>.fromNode(flarp, env: env)
            }
        }
    }
    public func wombat(zxc: Optional<Int>) throws -> Optional<Double> {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let wombat = try env.getNamedProperty(napiValue, "wombat")
            let result = try env.callFunction(napiValue, wombat, [try OptionalConverter<Swift.Int>.toNode(zxc, env: env)])
            return try OptionalConverter<Swift.Double>.fromNode(result, env: env)
        }
    }
    public func spqr(_ pippo: AssociatedDataEnum) throws -> Int {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let spqr = try env.getNamedProperty(napiValue, "spqr")
            let result = try env.callFunction(napiValue, spqr, [try TestAPI.AssociatedDataEnum.toNode(pippo, env: env)])
            return try Swift.Int.fromNode(result, env: env)
        }
    }
}

extension TestAPI_CommonInterface._TestOptionalsProtocolConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestOptionalsProtocol", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.TestOptionalsProtocol, got nil")
                }
                return try Box<TestAPI.TestOptionalsProtocol>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeTestOptionalsProtocol(
                    _nodeWitness: try NodeReference(env: env, value: value)
                )
            }
        }}
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestOptionalsProtocol", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let coreObject = try env.createObject()
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
            path: "TestOptionalsProtocol",
            nodeClass: coreObject
        )

        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_TestOptionalsProtocol",
            properties: [
                "wombat": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "wombat", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Double>.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestOptionalsProtocolConverter.self).wombat(
                                    zxc: try env.argument(at: 0, converter: OptionalConverter<Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "spqr": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "spqr", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestOptionalsProtocolConverter.self).spqr(
                                    try env.argument(at: 0, converter: TestAPI.AssociatedDataEnum.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "flarp": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "flarp", expectedArgumentCount: 0) { env in
                                return try OptionalConverter<Swift.String>.toNode(env.this(converter: TestAPI_CommonInterface._TestOptionalsProtocolConverter.self).flarp, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_TestOptionalsProtocol_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestOptionalsProtocol>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_TestOptionalsProtocol",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestPropertiesProtocol+node.swift
struct _NodeTestPropertiesProtocol: TestAPI.TestPropertiesProtocol {
    let _nodeWitness: NodeReference

    var corge: String {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let corge = try env.getNamedProperty(napiValue, "corge")
                return try Swift.String.fromNode(corge, env: env)
            }
        }
    }
    var frob: Array<Int> {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let frob = try env.getNamedProperty(napiValue, "frobby")
                return try ArrayConverter<Swift.Int>.fromNode(frob, env: env)
            }
        }
    }
}

extension TestAPI_CommonInterface._TestPropertiesProtocolConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestPropertiesProtocol", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.TestPropertiesProtocol, got nil")
                }
                return try Box<TestAPI.TestPropertiesProtocol>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeTestPropertiesProtocol(
                    _nodeWitness: try NodeReference(env: env, value: value)
                )
            }
        }}
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestPropertiesProtocol", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let coreObject = try env.createObject()
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
            path: "TestPropertiesProtocol",
            nodeClass: coreObject
        )

        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_TestPropertiesProtocol",
            properties: [
                "corge": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "corge", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI_CommonInterface._TestPropertiesProtocolConverter.self).corge, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "frobby": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "frobby", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestPropertiesProtocolConverter.self).frob, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_TestPropertiesProtocol_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestPropertiesProtocol>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_TestPropertiesProtocol",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestProtocolClass+node.swift
extension TestAPI.TestProtocolClass: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.TestProtocolClass {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.TestProtocolClass, got nil")
        }
        return try Box<TestAPI.TestProtocolClass>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.TestProtocolClass, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "TestProtocolClass", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.TestProtocolClass, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.TestProtocolClass, got nil")
        }
        try Box<TestAPI.TestProtocolClass>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestProtocolClass",
            properties: [
                "foo": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "foo", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                env.this(converter: TestAPI.TestProtocolClass.self).foo(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "bar": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "bar", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Bool.toNode(
                                env.this(converter: TestAPI.TestProtocolClass.self).bar(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "baz": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "baz", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                env.this(converter: TestAPI.TestProtocolClass.self).baz(
                                    qux: try env.argument(at: 0, converter: Swift.Bool.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "garply": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "garply", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.TestProtocolClass.self).garply(
                                    try env.argument(at: 0, converter: Swift.String.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "xyzzy": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "xyzzy", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.TestProtocolClass.self).xyzzy(
                                    thud: try env.argument(at: 0, converter: Swift.Int.self),
                                    grault: try env.argument(at: 1, converter: ArrayConverter<Swift.Double>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "plugh": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "plugh", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.toNode(
                                env.this(converter: TestAPI.TestProtocolClass.self).plugh(
                                    fred: try env.argument(at: 0, converter: Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "init": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "init", expectedArgumentCount: 1, hasNamedOptions: true) { env in
                            let result = try TestAPI.TestProtocolClass.toNode(
                                TestAPI.TestProtocolClass(
                                    corge: try env.argument(at: 0, converter: Swift.String.self),
                                    flarp: try env.argument(named: "flarp", default: nil, converter: OptionalConverter<Swift.String>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "wombat": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "wombat", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Double>.toNode(
                                env.this(converter: TestAPI.TestProtocolClass.self).wombat(
                                    zxc: try env.argument(at: 0, converter: OptionalConverter<Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "spqr": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "spqr", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                env.this(converter: TestAPI.TestProtocolClass.self).spqr(
                                    try env.argument(at: 0, converter: TestAPI.AssociatedDataEnum.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "corge": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "corge", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.TestProtocolClass.self).corge, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "corge", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: TestAPI.TestProtocolClass.self)
                                FishyJoesCommonRuntime.silenceMutationWarning(&mutatingSelf)
                                mutatingSelf.corge = try env.argument(at: 0, converter: Swift.String.self)
                                try TestAPI.TestProtocolClass.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
                "flarp": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "flarp", expectedArgumentCount: 0) { env in
                                return try OptionalConverter<Swift.String>.toNode(env.this(converter: TestAPI.TestProtocolClass.self).flarp, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "flarp", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: TestAPI.TestProtocolClass.self)
                                FishyJoesCommonRuntime.silenceMutationWarning(&mutatingSelf)
                                mutatingSelf.flarp = try env.argument(at: 0, converter: OptionalConverter<Swift.String>.self)
                                try TestAPI.TestProtocolClass.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
                "frobby": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "frobby", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.Int>.toNode(env.this(converter: TestAPI.TestProtocolClass.self).frob, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "toString": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "toString", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                "\(env.this(converter: TestAPI.TestProtocolClass.self))",
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                )
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "TestProtocolClass_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestProtocolClass>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestProtocolClass",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.TestProtocolEnum+node.swift
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

// MARK: - TestAPI.TestProtocolStruct+node.swift
extension TestAPI.TestProtocolStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            corge: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "corge")
                return try Swift.String.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestProtocolStruct", env: env)
        let args: [NAPI.Value] = [
            try Swift.String.toNode(value.corge, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "corge", Swift.String.toNode(value.corge, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestProtocolStruct",
            properties: [
                "foo": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "foo", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                env.this(converter: TestAPI.TestProtocolStruct.self).foo(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "bar": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "bar", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Bool.toNode(
                                env.this(converter: TestAPI.TestProtocolStruct.self).bar(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "baz": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "baz", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                env.this(converter: TestAPI.TestProtocolStruct.self).baz(
                                    qux: try env.argument(at: 0, converter: Swift.Bool.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "garply": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "garply", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.TestProtocolStruct.self).garply(
                                    try env.argument(at: 0, converter: Swift.String.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "xyzzy": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "xyzzy", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.TestProtocolStruct.self).xyzzy(
                                    thud: try env.argument(at: 0, converter: Swift.Int.self),
                                    grault: try env.argument(at: 1, converter: ArrayConverter<Swift.Double>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "plugh": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "plugh", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.toNode(
                                env.this(converter: TestAPI.TestProtocolStruct.self).plugh(
                                    fred: try env.argument(at: 0, converter: Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "frobby": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "frobby", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<Swift.Int>.toNode(env.this(converter: TestAPI.TestProtocolStruct.self).frob, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "corge": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestProtocolStruct_constructor", expectedArgumentCount: 1) { env in
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "corge", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestProtocolStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.Tuples+node.swift
extension TestAPI.Tuples: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Tuples")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Tuples",
            properties: [
                "checkTuples": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "checkTuples", expectedArgumentCount: 5, hasNamedOptions: false) { env in
                            let result = try Swift.Bool.toNode(
                                TestAPI.Tuples.checkTuples(
                                    t2: try env.argument(at: 0, converter: Tuple2Converter<Swift.Int, Swift.String>.self),
                                    t3: try env.argument(at: 1, converter: Tuple3Converter<Swift.String, Swift.Double, Swift.String>.self),
                                    t4: try env.argument(at: 2, converter: Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>.self),
                                    t5: try env.argument(at: 3, converter: Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>.self),
                                    t6: try env.argument(at: 4, converter: Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "tuple2": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tuple2", expectedArgumentCount: 0) { env in
                                return try Tuple2Converter<Swift.Int, Swift.String>.toNode(TestAPI.Tuples.tuple2, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "tuple3": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tuple3", expectedArgumentCount: 0) { env in
                                return try Tuple3Converter<Swift.String, Swift.Double, Swift.String>.toNode(TestAPI.Tuples.tuple3, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "tuple4": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tuple4", expectedArgumentCount: 0) { env in
                                return try Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>.toNode(TestAPI.Tuples.tuple4, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "tuple5": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tuple5", expectedArgumentCount: 0) { env in
                                return try Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>.toNode(TestAPI.Tuples.tuple5, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "tuple6": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tuple6", expectedArgumentCount: 0) { env in
                                return try Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>.toNode(TestAPI.Tuples.tuple6, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Tuples_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Tuples",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// MARK: - TestAPI.URLs+node.swift
extension TestAPI.URLs: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.URLs")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "URLs",
            properties: [
                "echo": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echo", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Foundation.URL.toNode(
                                TestAPI.URLs.echo(
                                    try env.argument(at: 0, converter: Foundation.URL.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "localFile": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "localFile", expectedArgumentCount: 0) { env in
                                return try Foundation.URL.toNode(TestAPI.URLs.localFile, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "remoteFile": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "remoteFile", expectedArgumentCount: 0) { env in
                                return try Foundation.URL.toNode(TestAPI.URLs.remoteFile, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "simple": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "simple", expectedArgumentCount: 0) { env in
                                return try Foundation.URL.toNode(TestAPI.URLs.simple, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "URLs_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "URLs",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}
