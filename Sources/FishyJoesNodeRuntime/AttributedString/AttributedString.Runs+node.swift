import Foundation

extension AttributedString.Runs: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedString.Runs {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedString.Runs, got nil")
        }
        return try Box<AttributedString.Runs>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedString.Runs, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "AttributedString.Runs", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedString.Runs, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedString.Runs, got nil")
        }
        try Box<AttributedString.Runs>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try AttributedString.Runs.RunIterator.nodeSetup(env: env, module: module)
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedString.Runs",
            properties: [
                "startIndex": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "startIndex", expectedArgumentCount: 0) { env in
                                try AttributedString.Runs.Index.toNode(env.this(converter: AttributedString.Runs.self).startIndex, env: env.env)
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
                                try AttributedString.Runs.Index.toNode(env.this(converter: AttributedString.Runs.self).endIndex, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "indexBefore": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "indexBefore", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AttributedString.Runs.Index.toNode(
                                env.this(converter: AttributedString.Runs.self).index(
                                    before: try env.argument(at: 0, converter: AttributedString.Runs.Index.self)
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
                            let result = try AttributedString.Runs.Index.toNode(
                                env.this(converter: AttributedString.Runs.self).index(
                                    after: try env.argument(at: 0, converter: AttributedString.Runs.Index.self)
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
                            let result = try AttributedString.Runs.Run.toNode(
                                env.this(converter: AttributedString.Runs.self)[
                                    try env.argument(at: 0, converter: AttributedString.Runs.Index.self)
                                ],
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "elementAtPosition": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "elementAtPosition", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AttributedString.Runs.Run.toNode(
                                env.this(converter: AttributedString.Runs.self)[
                                    try env.argument(at: 0, converter: AttributedString.Index.self)
                                ],
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "equals": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "equals", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            guard let lhs = try? env.this(converter: AttributedString.Runs.self),
                                  let rhs = try? env.argument(at: 0, converter: AttributedString.Runs.self) else {
                                return try Bool.toNode(false, env: env.env)
                            }
                            let equal = lhs == rhs
                            return try Bool.toNode(equal, env: env.env)
                        }
                    },
                    isStatic: false
                ),
                "hashCode": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "hashCode", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let runHashes = try env.this(converter: AttributedString.Runs.self)
                                .lazy
                                .map { AttributedString("", attributes: $0.attributes).hashValue }
                            let hashValue = runHashes
                                .reduce(into: Hasher()) { $0.combine($1) }
                                .finalize()
                            return try Int32.toNode(Int32(truncatingIfNeeded: hashValue), env: env.env)
                        }
                    },
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.Runs_constructor", expectedArgumentCount: 1) { env in
                    let object = try FishyJoesNodeRuntime.Box<AttributedString.Runs>.construct(env: env)

                    let global = try env.env.getGlobal()
                    let symbols = try env.env.getNamedProperty(global, "Symbol")
                    let symbol = try env.env.getNamedProperty(symbols, "iterator")
                    let function = try env.env.createFunction(
                        "Symbol.iterator_function",
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "Symbol.iterator_function", expectedArgumentCount: 0) { env in
                                let iterator = AttributedString.Runs.RunIterator(view: try env.this(converter: AttributedString.Runs.self))
                                return try AttributedString.Runs.RunIterator.toNode(iterator, env: env.env)
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
            path: "AttributedString.Runs",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

extension AttributedString.Runs {
    public struct RunIterator {
        public let view: AttributedString.Runs
        private var index: AttributedString.Runs.Index

        public init(view: AttributedString.Runs) {
            self.view = view
            self.index = view.startIndex
        }

        public mutating func next() -> AttributedString.Runs.Run? {
            if index >= view.endIndex { return nil }
            defer { index = view.index(after: index) }
            return view[index]
        }
    }
}

extension AttributedString.Runs.RunIterator: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedString.Runs.RunIterator {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedString.Runs.RunIterator, got nil")
        }
        return try Box<AttributedString.Runs.RunIterator>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedString.Runs.RunIterator, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "AttributedString.Runs.RunIterator", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedString.Runs.RunIterator, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedString.Runs.RunIterator, got nil")
        }
        try Box<AttributedString.Runs.RunIterator>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedString.Runs.RunIterator",
            properties: [
                "next": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "next", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.Runs.RunIterator.self)
                            let element = mutatingSelf.next()
                            try AttributedString.Runs.RunIterator.mutateNode(mutatingSelf, this: env.this(), env: env.env)

                            let result = try env.env.createObject()
                            try env.env.setNamedProperty(result, "done", try Bool.toNode(element == nil, env: env.env))
                            if let element = element {
                                try env.env.setNamedProperty(result, "value", try AttributedString.Runs.Run.toNode(element, env: env.env))
                            }
                            return result
                        }
                    },
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.Runs.RunIterator_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedString.Runs.RunIterator>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString.Runs.RunIterator",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}
