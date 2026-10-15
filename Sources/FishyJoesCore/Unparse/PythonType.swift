struct PythonType: Hashable, Codable {
    let `static`: Static
    let `dynamics`: [Dynamic]

    enum Static: Hashable, Codable {
        case primitive(name: String)
        indirect case callable(args: [Static], return: Static)
        case named(module: String?, namespaces: [String], name: String, genericArgs: [Static]? = nil)
        indirect case union(_ lhs: Static, _ rhs: Static)
    }

    struct Dynamic: Hashable, Codable {
        let module: String?
        let namespaces: [String]
        let name: String

        static var object: Dynamic {
            Dynamic(module: nil, namespaces: [], name: "object")
        }
    }
}

extension PythonType: CustomStringConvertible {
    static func `class`(module: String?, qualifiedName: String, genericArgs: [Static]? = nil) -> Self {
        let (namespaces, name) = PythonNamingConventions.splitIntoNamespaces(qualifiedName)
        return .class(module: module, namespaces: namespaces, name: name, genericArgs: genericArgs)
    }

    static func `class`(module: String?, namespaces: [String], name: String, genericArgs: [Static]? = nil) -> Self {
        return .init(
            static: .named(module: module, namespaces: namespaces, name: name, genericArgs: genericArgs),
            dynamics: [.init(module: module, namespaces: namespaces, name: name)]
        )
    }

    static func union(_ lhs: Self, _ rhs: Self) -> Self {
        .init(
            static: .union(lhs.static, rhs.static),
            dynamics: (lhs.dynamics + rhs.dynamics).deduplicated()
        )
    }

    static var none: Self {
        .init(
            static: .none,
            dynamics: [.init(module: "types", namespaces: [], name: "NoneType")]
        )
    }

    static var int: Self {
        .init(
            static: .primitive(name: "int"),
            dynamics: [.init(module: nil, namespaces: [], name: "int")]
        )
    }

    static var bool: Self {
        .init(
            static: .primitive(name: "bool"),
            dynamics: [.init(module: nil, namespaces: [], name: "bool")]
        )
    }

    static var str: Self {
        .init(
            static: .primitive(name: "str"),
            dynamics: [.init(module: nil, namespaces: [], name: "str")]
        )
    }

    static var object: Self {
        .class(module: nil, qualifiedName: "object")
    }

    static func optional(_ wrapped: Self) -> Self {
        .union(wrapped, .none)
    }

    static func tuple(_ elements: [Self]) -> Self {
        .init(
            static: .named(module: nil, namespaces: [], name: "tuple", genericArgs: elements.map(\.static)),
            dynamics: [.init(module: nil, namespaces: [], name: "tuple")]
        )
    }

    static var TODO: Self {
        .class(module: nil, qualifiedName: "TODO")
    }

    static func result(_ success: Self, _ failure: Self) -> Self {
        .init(
            static: .named(module: "fishyjoes_runtime", namespaces: [], name: "Result", genericArgs: [success.static, failure.static]),
            dynamics: [
                .init(module: "fishyjoes_runtime", namespaces: ["result"], name: "Success"),
                .init(module: "fishyjoes_runtime", namespaces: ["result"], name: "Failure"),
            ]
        )
    }

    static func callable(args: [Static], return: Static) -> Self {
        .init(
            static: .callable(args: args, return: `return`),
            dynamics: [.init(module: nil, namespaces: [], name: "\"Callable\"")] // workaround for https://github.com/python/mypy/issues/11071
        )
    }

    static func future(_ inner: Static) -> Self {
        .class(module: "fishyjoes_runtime", namespaces: [], name: "Future", genericArgs: [inner])
    }

    var description: String {
        "FIXME: You should not use this, you should use one of the representations below. \(self.static.name())"
    }

    var dynamicsString: String {
        let options = dynamics.map { dyn in
            (dyn.module.asArray + dyn.namespaces + [dyn.name]).joined(separator: ".")
        }
        return options.joined(separator: ", ")
    }

    var dynamicsStringAsTuple: String {
        dynamics.count == 1 ? "(\(dynamicsString),)" : "(\(dynamicsString))"
    }

    var metaTypeTuple: Self {
        let typeOfSelf = Static.named(module: nil, namespaces: [], name: "type", genericArgs: [self.static])
        // I don't think this is technically a type, but this works
        let dots = Static.named(module: nil, namespaces: [], name: "...")
        return .init(
            static: .named(module: nil, namespaces: [], name: "tuple", genericArgs: [typeOfSelf, dots]),
            dynamics: [.init(module: nil, namespaces: [], name: "tuple")]
        )
    }
}

extension PythonType.Static {
    var namespaces: [String] {
        switch self {
        case .primitive, .callable, .union:
            return []
        case .named(_, let namespaces, _, _):
            return namespaces
        }
    }

    func name(in pythonClass: PythonClass? = nil) -> String {
        switch self {
        case .primitive(let name):
            return name
        case .callable(let args, let ret):
            let argNames = args.map { $0.name(in: pythonClass) }
            let retName = ret.name(in: pythonClass)
            return "typing.Callable[[\(argNames.joined(separator: ", "))], \(retName)]"
        case .named(let module, let namespaces, let name, let genericArgs):
            var result = (module.asArray + namespaces + [name]).joined(separator: ".")
            if let genericArgs = genericArgs {
                result.append("[\(genericArgs.map { $0.name(in: pythonClass) }.joined(separator: ","))]")
            }
            return result
        case .union(let lhs, let rhs):
            return "\(lhs.name(in: pythonClass)) | \(rhs.name(in: pythonClass))"
        }
    }

    var ffiOutCreatedType: Self {
        isPrimitive ? .opaquePointer : .outCreatedHostRef
    }

    var ffiConsumedType: Self {
        isPrimitive ? self : .consumedHostRef
    }

    var ffiCreatedType: Self {
        isPrimitive ? self : .createdHostRef
    }

    var ffiUnownedType: Self {
        isPrimitive ? self : .unownedHostRef
    }

    var ffiDefault: String {
        switch self {
        case .primitive("bool"): return "false"
        case .primitive("int"): return "0"
        case .primitive("float"): return "0.0"
        default: return "fishyjoes_runtime.CREATED_REF_NULL"
        }
    }

    var package: String? {
        switch self {
        case .named(let package, _, _, _):
            return package
        default:
            return nil
        }
    }

    var baseName: String {
        switch self {
        case .primitive(let name): return name
        case .named(_, _, let name, _): return name
        case .callable: return "Callable"
        case .union: return "Union"
        }
    }

    func modifyingBaseName(with modify: (String) throws -> String) rethrows -> Self {
        switch self {
        case .primitive(let name):
            return .primitive(name: try modify(name))
        case .named(let module, let namespaces, let name, let genericArgs):
            return .named(module: module, namespaces: namespaces, name: try modify(name), genericArgs: genericArgs)
        case .callable: fatalErr("internal error: invalid type modification")
        case .union: fatalErr("internal error: invalid type modification")
        }
    }

    static var none: Self { .named(module: nil, namespaces: [], name: "None") }

    static func awaitable(_ inner: Self) -> Self {
        return .named(module: "typing", namespaces: [], name: "Awaitable", genericArgs: [inner])
    }

    // NOTE: these are a bit weird types, since they're not user-visible. Only useful in limited internal places.
    static var unownedHostRef: Self {
        .named(module: "fishyjoes_runtime", namespaces: [], name: "UnownedRef")
    }
    static var createdHostRef: Self {
        .named(module: "fishyjoes_runtime", namespaces: [], name: "CreatedRef")
    }
    static var consumedHostRef: Self {
        .named(module: "fishyjoes_runtime", namespaces: [], name: "ConsumedRef")
    }
    static var outCreatedHostRef: Self {
        .named(module: "fishyjoes_runtime", namespaces: [], name: "OutCreatedRef")
    }
    static var consumedSwiftRef: Self {
        .named(module: "fishyjoes_runtime", namespaces: [], name: "ConsumedSwiftRef")
    }
    static var opaquePointer: Self {
        .named(module: "fishyjoes_runtime", namespaces: [], name: "Pointer" )
    }

    static var TODO: Self {
        .named(module: nil, namespaces: [], name: "TODO")
    }

    var isPrimitive: Bool {
        switch self {
        case .primitive: return true
        default: return false
        }
    }
}
