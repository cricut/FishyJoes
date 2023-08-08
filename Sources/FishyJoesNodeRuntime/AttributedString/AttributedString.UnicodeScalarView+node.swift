import Foundation

extension AttributedString.UnicodeScalarView: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedString.UnicodeScalarView {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedString.UnicodeScalarView, got nil")
        }
        return try Box<AttributedString.UnicodeScalarView>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedString.UnicodeScalarView, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "AttributedString.UnicodeScalarView", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedString.UnicodeScalarView, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedString.UnicodeScalarView, got nil")
        }
        try Box<AttributedString.UnicodeScalarView>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try AttributedString.UnicodeScalarView.UnicodeScalarIterator.nodeSetup(env: env, module: module)
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedString.UnicodeScalarView",
            properties: [
                "startIndex": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "startIndex", expectedArgumentCount: 0) { env in
                                try AttributedString.Index.toNode(env.this(converter: AttributedString.UnicodeScalarView.self).startIndex, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "endIndex": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "endIndex", expectedArgumentCount: 0) { env in
                                try AttributedString.Index.toNode(env.this(converter: AttributedString.UnicodeScalarView.self).endIndex, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "indexBefore": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "indexBefore", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AttributedString.Index.toNode(
                                env.this(converter: AttributedString.UnicodeScalarView.self).index(
                                    before: try env.argument(at: 0, converter: AttributedString.Index.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "indexAfter": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "indexAfter", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AttributedString.Index.toNode(
                                env.this(converter: AttributedString.UnicodeScalarView.self).index(
                                    after: try env.argument(at: 0, converter: AttributedString.Index.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "elementAt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "elementAt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try UInt32.toNode(
                                env.this(converter: AttributedString.UnicodeScalarView.self)[
                                    try env.argument(at: 0, converter: AttributedString.Index.self)
                                ].value,
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.UnicodeScalarView_constructor", expectedArgumentCount: 1) { env in
                    let object = try FishyJoesNodeRuntime.Box<AttributedString.UnicodeScalarView>.construct(env: env)

                    let global = try env.env.getGlobal()
                    let symbols = try env.env.getNamedProperty(global, "Symbol")
                    let symbol = try env.env.getNamedProperty(symbols, "iterator")
                    let function = try env.env.createFunction(
                        "Symbol.iterator_function",
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "Symbol.iterator_function", expectedArgumentCount: 0) { env in
                                let iterator = AttributedString.UnicodeScalarView.UnicodeScalarIterator(view: try env.this(converter: AttributedString.UnicodeScalarView.self))
                                return try AttributedString.UnicodeScalarView.UnicodeScalarIterator.toNode(iterator, env: env.env)
                            }
                        },
                        nil
                    )
                    try env.env.setProperty(object, symbol, function)

                    return object
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString.UnicodeScalarView",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

extension AttributedString.UnicodeScalarView {
    public struct UnicodeScalarIterator {
        public let view: AttributedString.UnicodeScalarView
        private var index: AttributedString.Index

        public init(view: AttributedString.UnicodeScalarView) {
            self.view = view
            self.index = view.startIndex
        }

        public mutating func next() -> UnicodeScalar? {
            if index >= view.endIndex { return nil }
            defer { index = view.index(after: index) }
            return view[index]
        }
    }
}

extension AttributedString.UnicodeScalarView.UnicodeScalarIterator: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedString.UnicodeScalarView.UnicodeScalarIterator {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedString.UnicodeScalarView.UnicodeScalarIterator, got nil")
        }
        return try Box<AttributedString.UnicodeScalarView.UnicodeScalarIterator>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedString.UnicodeScalarView.UnicodeScalarIterator, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "AttributedString.UnicodeScalarView.UnicodeScalarIterator", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedString.UnicodeScalarView.UnicodeScalarIterator, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedString.UnicodeScalarView.UnicodeScalarIterator, got nil")
        }
        try Box<AttributedString.UnicodeScalarView.UnicodeScalarIterator>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedString.UnicodeScalarView.UnicodeScalarIterator",
            properties: [
                "next": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "next", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.UnicodeScalarView.UnicodeScalarIterator.self)
                            let element = mutatingSelf.next()
                            try AttributedString.UnicodeScalarView.UnicodeScalarIterator.mutateNode(mutatingSelf, this: env.this(), env: env.env)

                            let result = try env.env.createObject()
                            try env.env.setNamedProperty(result, "done", try Bool.toNode(element == nil, env: env.env))
                            if let element = element {
                                try env.env.setNamedProperty(result, "value", try UInt32.toNode(element.value, env: env.env))
                            }
                            return result
                        }
                    },
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.UnicodeScalarView.UnicodeScalarIterator_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedString.UnicodeScalarView.UnicodeScalarIterator>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString.UnicodeScalarView.UnicodeScalarIterator",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
