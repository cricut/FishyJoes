import Foundation

class PythonClass {
    enum FFIType: String, Hashable, Codable {
        case void
        case bool
        case int8
        case int16
        case int32
        case int64
        case int
        case uint8
        case uint16
        case uint32
        case uint64
        case uint
        case float
        case double
        case object
    }

    indirect enum PyType: Hashable, Codable {
        case none
        case primitive(String)
        case named(module: String?, name: String)
        case optional(PyType)
        case list(PyType)
        case dict(PyType, PyType)
        case set(PyType)
        case tuple([PyType])
        case callable(args: [PyType], return: PyType)
        case awaitable(PyType)
        case any
    }

    enum MethodOrVariable {
        case method(Method)
        case variable(Variable)
    }

    struct Method {
        struct Parameter: Equatable {
            let labelComment: String?
            let name: String
            let type: PyType
            let ffiType: FFIType
            let defaultValue: String?
        }

        let documentation: [String]
        let isStatic: Bool
        let name: String
        let mangledName: String
        let parameters: [Method.Parameter]
        let returnType: PyType
        let ffiReturnType: FFIType
        let deprecation: Deprecation?
        let body: [String]?
        let isAsync: Bool
    }

    struct Variable: Equatable {
        let documentation: [String]
        let isStatic: Bool
        let isMutable: Bool
        let isPubliclyWritable: Bool
        let asMethod: Bool
        let name: String
        let mangledName: String
        let type: PyType
        let ffiType: FFIType
        let deprecation: Deprecation?
    }

    let module: Module
    let documentation: [String]
    let name: String
    let fields: [Variable]
    let methods: [Method]

    init(
        module: Module,
        documentation: [String],
        name: String,
        fields: [Variable],
        methods: [Method]
    ) {
        self.module = module
        self.documentation = documentation
        self.name = name
        self.fields = fields
        self.methods = methods
    }

    func output(to fragment: SourceFragment) {
        fatalErr("This method must be overridden")
    }

    func fragment(context: FishyJoesContext) -> SourceFragment {
        let fragment = context.pythonFragment("\(unqualifiedName).py")
        output(to: fragment)
        return fragment
    }

    func document(_ documentation: [String], fragment: SourceFragment, extra: [String] = []) {
        let lines = documentation + extra
        guard !lines.isEmpty else { return }
        fragment.output("\"\"\"")
        for line in lines {
            fragment.output(line)
        }
        fragment.output("\"\"\"")
    }

    func outputNotImplemented(
        fragment: SourceFragment,
        symbol: String
    ) {
        fragment.output("_ensure_runtime_loaded()")
        fragment.output("_not_implemented(\"\(symbol)\")")
    }

    var unqualifiedName: String {
        String(name.split(separator: ".").last!)
    }

    static func separate(fieldsAndMethods: [MethodOrVariable]) -> (fields: [Variable], methods: [Method]) {
        var fields: [Variable] = []
        var methods: [Method] = []
        for item in fieldsAndMethods {
            switch item {
            case .method(let method):
                methods.append(method)
            case .variable(let field):
                fields.append(field)
            }
        }
        return (fields, methods)
    }

    func outputRuntimeCall(
        fragment: SourceFragment,
        symbol: String,
        returnType: FFIType,
        arguments: [(expression: String, type: FFIType)],
        isAsync: Bool = false
    ) {
        fragment.output("_ensure_runtime_loaded()")
        let awaitPrefix = isAsync ? "await " : ""
        let argString = arguments.map { "(\"\($0.type.rawValue)\", \($0.expression))" }.joined(separator: ", ")
        let invocation = "\(awaitPrefix)_get_runtime().invoke(\"\(symbol)\", \"\(returnType.rawValue)\"\(argString.isEmpty ? "" : ", \(argString)"))"
        if returnType == .void {
            fragment.output(invocation)
        } else if returnType == .bool {
            fragment.output("return bool(\(invocation))")
        } else {
            fragment.output("return \(invocation)")
        }
    }

    func parameterList(explicit: [String], parameters: [Method.Parameter]) -> String {
        let renderedParameters = parameters.map {
            "\($0.name): \($0.type.name)\($0.defaultValue.map { " = \($0)" } ?? "")"
        }

        let firstDefaultIndex = parameters.firstIndex { $0.defaultValue != nil }
        let needsKeywordOnlySeparator = firstDefaultIndex.flatMap { firstDefaultIndex in
            parameters[firstDefaultIndex...].contains { $0.defaultValue == nil } ? firstDefaultIndex : nil
        }

        var rendered = explicit
        if let firstDefaultIndex = needsKeywordOnlySeparator {
            if !parameters.isEmpty {
                rendered.append("*")
            }
            rendered.append(contentsOf: renderedParameters[..<firstDefaultIndex])
            rendered.append(contentsOf: renderedParameters[firstDefaultIndex...])
        } else {
            rendered.append(contentsOf: renderedParameters)
        }
        return rendered.joined(separator: ", ")
    }
}

extension PythonClass.PyType {
    var isOptional: Bool {
        if case .optional = self {
            return true
        }
        return false
    }

    var name: String {
        switch self {
        case .none:
            return "None"
        case .primitive(let name):
            return name
        case .named(let module, let name):
            let qualifiedName = module.map { "\($0).\(name)" } ?? name
            if qualifiedName.range(of: #"^[A-Za-z_][A-Za-z0-9_\.]*$"#, options: .regularExpression) != nil {
                return qualifiedName
            }
            return "typing.Any"
        case .optional(let wrapped):
            return "\(wrapped.name) | None"
        case .list(let element):
            return "list[\(element.name)]"
        case .dict(let key, let value):
            return "dict[\(key.name), \(value.name)]"
        case .set(let element):
            return "set[\(element.name)]"
        case .tuple(let elements):
            return "tuple[\(elements.map(\.name).joined(separator: ", "))]"
        case .callable(let args, let result):
            return "typing.Callable[[\(args.map(\.name).joined(separator: ", "))], \(result.name)]"
        case .awaitable(let wrapped):
            return "typing.Awaitable[\(wrapped.name)]"
        case .any:
            return "typing.Any"
        }
    }

    var defaultLiteral: String? {
        switch self {
        case .none, .optional:
            return "None"
        case .primitive(let name) where name == "bool":
            return "False"
        case .primitive(let name) where name == "int":
            return "0"
        case .primitive(let name) where name == "float":
            return "0.0"
        case .primitive(let name) where name == "str":
            return "\"\""
        case .primitive(let name) where name == "bytes":
            return "b\"\""
        default:
            return nil
        }
    }
}
