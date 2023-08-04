import Foundation

extension AttributedString.CharacterView: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedString.CharacterView {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedString.CharacterView, got nil")
        }
        return try Box<AttributedString.CharacterView>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedString.CharacterView, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "AttributedString.CharacterView", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedString.CharacterView, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedString.CharacterView, got nil")
        }
        try Box<AttributedString.CharacterView>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try AttributedString.CharacterView.CharacterIterator.nodeSetup(env: env, module: module)
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedString.CharacterView",
            properties: [
                "startIndex": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "startIndex", expectedArgumentCount: 0) { env in
                                try AttributedString.Index.toNode(env.this(converter: AttributedString.CharacterView.self).startIndex, env: env.env)
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
                                try AttributedString.Index.toNode(env.this(converter: AttributedString.CharacterView.self).endIndex, env: env.env)
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
                                env.this(converter: AttributedString.CharacterView.self).index(
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
                                env.this(converter: AttributedString.CharacterView.self).index(
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
                            let result = try Swift.String.toNode(
                                String(
                                    env.this(converter: AttributedString.CharacterView.self)[
                                        try env.argument(at: 0, converter: AttributedString.Index.self)
                                    ]
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
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.CharacterView_constructor", expectedArgumentCount: 1) { env in
                    let object = try FishyJoesNodeRuntime.Box<AttributedString.CharacterView>.construct(env: env)

                    let global = try env.env.getGlobal()
                    let symbols = try env.env.getNamedProperty(global, "Symbol")
                    let symbol = try env.env.getNamedProperty(symbols, "iterator")
                    let function = try env.env.createFunction(
                        "Symbol.iterator_function",
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "Symbol.iterator_function", expectedArgumentCount: 0) { env in
                                let iterator = AttributedString.CharacterView.CharacterIterator(view: try env.this(converter: AttributedString.CharacterView.self))
                                return try AttributedString.CharacterView.CharacterIterator.toNode(iterator, env: env.env)
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
            path: "AttributedString.CharacterView",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

extension AttributedString.CharacterView {
    public struct CharacterIterator {
        public let view: AttributedString.CharacterView
        private var index: AttributedString.Index

        public init(view: AttributedString.CharacterView) {
            self.view = view
            self.index = view.startIndex
        }

        public mutating func next() -> Character? {
            if index >= view.endIndex { return nil }
            defer { index = view.index(after: index) }
            return view[index]
        }
    }
}

extension AttributedString.CharacterView.CharacterIterator: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedString.CharacterView.CharacterIterator {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedString.CharacterView.CharacterIterator, got nil")
        }
        return try Box<AttributedString.CharacterView.CharacterIterator>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedString.CharacterView.CharacterIterator, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "AttributedString.CharacterView.CharacterIterator", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedString.CharacterView.CharacterIterator, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedString.CharacterView.CharacterIterator, got nil")
        }
        try Box<AttributedString.CharacterView.CharacterIterator>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedString.CharacterView.CharacterIterator",
            properties: [
                "next": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "next", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.CharacterView.CharacterIterator.self)
                            let element = mutatingSelf.next()
                            try AttributedString.CharacterView.CharacterIterator.mutateNode(mutatingSelf, this: env.this(), env: env.env)

                            let result = try env.env.createObject()
                            try env.env.setNamedProperty(result, "done", try Bool.toNode(element == nil, env: env.env))
                            if let element = element {
                                try env.env.setNamedProperty(result, "value", try String.toNode(String(element), env: env.env))
                            }
                            return result
                        }
                    },
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.CharacterView.CharacterIterator_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedString.CharacterView.CharacterIterator>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString.CharacterView.CharacterIterator",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
