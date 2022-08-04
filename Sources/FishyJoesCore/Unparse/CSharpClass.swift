class CSharpClass: NestedClass {
    indirect enum CSType: Equatable, Codable {
        case void
        case primitive(String)
        case named(package: String?, name: String)
        case optional(CSType)
    }

    enum MethodOrVariable {
        case method(Method)
        case variable(Variable)
    }

    struct Method {
        let documentation: [String]
        let isStatic: Bool
        let isOverride: Bool
        let name: String
        let mangledName: String
        let parameters: [(labelComment: String?, name: String, type: CSType)]
        let returnType: CSType
        let body: [String]?
    }

    struct Variable: Equatable {
        let documentation: [String]
        let isStatic: Bool
        let isOverride: Bool
        let readOnly: Bool
        let asMethod: Bool
        let name: String
        let mangledName: String
        let type: CSType
    }

    let module: Module
    let documentation: [String]
    let name: String
    var innerClasses: [CSharpClass] = []

    init(module: Module, documentation: [String], name: String) {
        self.name = name
        self.documentation = documentation
        self.module = module
    }

    func output(to fragment: SourceFragment) {
        fatalErr("This method must be overridden and call `outputInner`")
    }

    func outputInner(to fragment: SourceFragment) {
        innerClasses.forEach { inner in
            fragment.blankLine()
            inner.output(to: fragment)
        }
    }

    func fragment(context: FishyJoesContext) -> SourceFragment {
        let fragment = context.cSharpFragment("\(unqualifiedName).cs")

        fragment.outputBlock("namespace \(module.cSharpNamespace) {") {
            output(to: fragment)
        }
        return fragment
    }

    func document(_ documentation: [String], fragment: SourceFragment) {
        guard !documentation.isEmpty else { return }
        fragment.output("/// <summary>")
        for line in documentation {
            if line.hasPrefix("<!--") && line.hasSuffix("-->") {
                fragment.output("/// \(line)")
            } else {
                let escaped = line
                    .replacingOccurrences(of: "&", with: "&amp;")
                    .replacingOccurrences(of: "<", with: "&lt;")
                    .replacingOccurrences(of: ">", with: "&gt;")
                    .replacingOccurrences(of: "\"", with: "&quot;")
                fragment.output("/// <para>\(escaped)</para>")
            }
        }
        fragment.output("/// </summary>")
    }

    var unqualifiedName: String {
        String(name.split(separator: ".").last!)
    }

    func output(field: Variable, to fragment: SourceFragment) {
        document(field.documentation, fragment: fragment)
        let selfFormal = field.isStatic ? "" : "\(CSType.object.pInvokeUnownedName) self, "
        let selfArg = field.isStatic ? "" : "thisHandle.ptr, "

        func outputGetterBody() {
            if !field.isStatic {
                fragment.output("using var thisHandle = new GCRef(this);")
            }
            fragment.outputBlock("return Check((out CreatedRef exn) => ", closeWith: ");") {
                if field.type.isObject {
                    fragment.output("__cs_get_\(field.mangledName)(\(selfArg)out exn).Consume<\(field.type.name)>()")
                } else {
                    fragment.output("__cs_get_\(field.mangledName)(\(selfArg)out exn)")
                }
            }
        }

        func outputSetterBody() {
            if !field.isStatic {
                fragment.output("using var thisHandle = new GCRef(this);")
            }
            let valueValue: String
            if field.type.isObject {
                fragment.output("using var valueHandle = new GCRef(value);")
                valueValue = "valueHandle.ptr"
            } else {
                valueValue = "value"
            }
            fragment.outputBlock("Check((out CreatedRef exn) => ", closeWith: ");") {
                fragment.output("__cs_set_\(field.mangledName)(\(selfArg)\(valueValue), out exn)")
            }
        }

        if field.asMethod {
            fragment.output("public \(field.isOverride ? "override " : "")\(field.isStatic ? "static " : "")", newLineTerminated: false)
            fragment.outputBlock("\(field.type.name) Get\(field.name)() {") {
                outputGetterBody()
            }
            if !field.readOnly {
                fragment.outputBlock("void Set\(field.name)(\(field.type.name) value) {") {
                    outputSetterBody()
                }
            }
        } else {
            fragment.output("public \(field.isOverride ? "override " : "")\(field.isStatic ? "static " : "")", newLineTerminated: false)
            fragment.outputBlock("\(field.type.name) \(field.name) {") {
                fragment.outputBlock("get {") {
                    outputGetterBody()
                }
                if !field.readOnly {
                    fragment.outputBlock("set {") {
                        outputSetterBody()
                    }
                }
            }
        }

        fragment.blankLine()
        fragment.output(module.dllImportMark)
        fragment.output("private static extern \(field.type.pInvokeCreatedName) __cs_get_\(field.mangledName)(\(selfFormal)out CreatedRef exn);")
        if !field.readOnly {
            fragment.blankLine()
            fragment.output(module.dllImportMark)
            fragment.output("private static extern void __cs_set_\(field.mangledName)(\(selfFormal)\(field.type.pInvokeUnownedName) value, out CreatedRef exn);")
        }
        fragment.blankLine()
    }

    func output(method: Method, to fragment: SourceFragment) {
        document(method.documentation, fragment: fragment)
        if !method.name.hasPrefix("_") {
            fragment.output("public \(method.isOverride ? "override " : "")\(method.isStatic ? "static " : "")", newLineTerminated: false)
            fragment.outputBlock("\(method.returnType.name) \(method.name)(", newLineTerminated: false) {
                fragment.outputMap(method.parameters, separator: ",") { parameter in
                    let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
                    return "\(parameter.type.name) \(labelComment)\(CSharpClass.deforbidify(parameter.name))"
                }
            }
            fragment.outputBlock(" {") {
                if let body = method.body {
                    body.forEach { fragment.output($0) }
                } else {
                    var paramStrings: [String] = []
                    if !method.isStatic {
                        fragment.output("using var _thisHandle = new GCRef(this);")
                        paramStrings.append("_thisHandle.ptr")
                    }
                    for param in method.parameters {
                        if param.type.isObject {
                            fragment.output("using var _\(param.name)Handle = new GCRef(\(CSharpClass.deforbidify(param.name)));")
                            paramStrings.append("_\(param.name)Handle.ptr")
                        } else {
                            paramStrings.append("\(CSharpClass.deforbidify(param.name))")
                        }
                    }
                    paramStrings.append("out _exn")

                    let body = "Check((out CreatedRef _exn) => __cs_\(method.mangledName)(\(paramStrings.joined(separator: ", "))))"
                    if method.returnType.isObject {
                        fragment.output("return \(body).Consume<\(method.returnType.name)>();")
                    } else if method.returnType == .void {
                        fragment.output("\(body);")
                    } else {
                        fragment.output("return \(body);")
                    }
                }
            }
        }
        if method.body == nil {
            fragment.blankLine()
            fragment.output(module.dllImportMark)
            fragment.outputBlock("private static extern \(method.returnType.pInvokeCreatedName) __cs_\(method.mangledName)(", closeWith: ");") {
                if !method.isStatic {
                    fragment.output("\(CSType.object.pInvokeUnownedName) self,")
                }
                for parameter in method.parameters {
                    fragment.output("\(parameter.type.pInvokeUnownedName) \(CSharpClass.deforbidify(parameter.name)),")
                }
                fragment.output("out CreatedRef exn")
            }
        }
        fragment.blankLine()
    }
}

extension CSharpClass.CSType: CustomStringConvertible {
    static var object: Self {
        return .named(package: nil, name: "object")
    }

    var description: String {
        "FIXME: You should not use this, you should use one of the representations below. \(name)"
    }

    var name: String {
        switch self {
        case .void: return "void"
        case let .named(.none, name): return name
        case let .named(.some(package), name): return "\(package).\(name)"
        case let .primitive(name): return name
        case let .optional(wrapped): return "\(wrapped.name)?"
        }
    }


    var pInvokeConsumeName: String {
        isObject ? "ConsumedRef" : name
    }

    var pInvokeCreatedName: String {
        isObject ? "CreatedRef" : name
    }

    var pInvokeUnownedName: String {
        isObject ? "UnownedRef" : name
    }

    var package: String? {
        switch self {
        case .named(let package, _):
            return package
        default:
            return nil
        }
    }

    var isObject: Bool {
        switch self {
        case .named, .optional: return true
        default: return false
        }
    }
}

class CSharpProductClass: CSharpClass {
    struct Typealias {
        let name: String
        let value: CSType
    }

    enum Constructor: Equatable {
        case `public`(fields: [Variable])
        case reference
    }

    let constructor: Constructor
    let fields: [Variable]
    let methods: [Method]

    init(
        module: Module,
        documentation: [String],
        name: String,
        constructor: Constructor,
        fieldsAndMethods: [MethodOrVariable]
    ) {
        self.constructor = constructor
        self.fields = fieldsAndMethods.compactMap {
            guard case let .variable(field) = $0 else {
                return nil
            }
            return field
        }
        self.methods = fieldsAndMethods.compactMap {
            guard case let .method(method) = $0 else {
                return nil
            }
            return method
        }
        super.init(module: module, documentation: documentation, name: name)
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)

        switch constructor {
        case .reference:
            fragment.output("public class \(unqualifiedName) : SwiftReference ", newLineTerminated: false)
        case .public:
            fragment.output("public record \(unqualifiedName) ", newLineTerminated: false)
        }
        fragment.outputBlock("{") {
            switch constructor {
            case .reference:
                fragment.output("internal \(unqualifiedName)(ConsumedRef reference): base(reference) {}")
            case .public(let fields):
                for field in fields {
                    fragment.output("public \(field.type.name) \(CSharpClass.deforbidify(field.name));")
                }
                fragment.blankLine()

                fragment.outputBlock("public \(unqualifiedName)(", newLineTerminated: false) {
                    fragment.outputMap(fields, separator: ",") { field in
                        "\(field.type.name) \(CSharpClass.deforbidify(field.name))"
                    }
                }
                fragment.outputBlock(" {") {
                    for field in fields {
                        fragment.output("this.\(CSharpClass.deforbidify(field.name)) = \(CSharpClass.deforbidify(field.name));")
                    }
                }
            }
            fragment.blankLine()

            fields.forEach { output(field: $0, to: fragment) }
            methods.forEach { output(method: $0, to: fragment) }
            fragment.blankLine()

            outputInner(to: fragment)

            fragment.output("static \(unqualifiedName)() { _TypeSetup._ensureLoaded(); }")
        }
    }
}

class CSharpEnumClass: CSharpClass {
    let cases: [Case]
    let fields: [Variable]
    let methods: [Method]

    struct Case {
        let documentation: [String]
        let name: String
        let values: [(name: String, type: CSType)]
    }

    init(
        module: Module,
        documentation: [String],
        name: String,
        cases: [Case],
        fieldsAndMethods: [MethodOrVariable]
    ) {
        self.cases = cases
        self.fields = fieldsAndMethods.compactMap {
            guard case let .variable(field) = $0 else {
                return nil
            }
            return field
        }
        self.methods = fieldsAndMethods.compactMap {
            guard case let .method(method) = $0 else {
                return nil
            }
            return method
        }
        super.init(module: module, documentation: documentation, name: name)
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)
        fragment.outputBlock("public record \(unqualifiedName) {") {
            fragment.output("private \(unqualifiedName)() {}")
            fragment.blankLine()

            for enumCase in cases {
                document(enumCase.documentation, fragment: fragment)
                fragment.output("public sealed record \(enumCase.name)", newLineTerminated: false)
                if !enumCase.values.isEmpty {
                    fragment.outputBlock("(", newLineTerminated: false) {
                        fragment.outputMap(enumCase.values, separator: ",") { value in
                            "\(value.type.name) \(value.name)"
                        }
                    }
                }
                fragment.output(" : \(unqualifiedName);")
                fragment.blankLine()
            }
            fields.forEach { output(field: $0, to: fragment) }
            methods.forEach { output(method: $0, to: fragment) }

            outputInner(to: fragment)

            fragment.output("static \(unqualifiedName)() { _TypeSetup._ensureLoaded(); }")
        }
    }
}

extension CSharpClass {
    private static var forbiddenVarNames: Set<String> = [
        "String",
        "string",
        "base",
    ]

    static func deforbidify(_ name: String) -> String {
        forbiddenVarNames.contains(name) ? "_\(name)" : name
    }
}
