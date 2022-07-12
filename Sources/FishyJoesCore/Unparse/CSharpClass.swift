private var forbiddenVarNames: Set<String> = [
    "String",
    "string",
]
private func deforbidify(_ name: String) -> String {
    forbiddenVarNames.contains(name) ? "_\(name)" : name
}

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
        fragment.output("/**")
        for line in documentation {
            fragment.output(
                " " + "* \(line)"
                    .trimmingCharacters(in: .whitespaces)
                    .replacingOccurrences(of: "[$", with: "[?")
            )
        }
        fragment.output(" */")
    }

    var unqualifiedName: String {
        String(name.split(separator: ".").last!)
    }

    var dllImportMark: String {
        "[DllImport(\"\(module.name)-c-sharp.dylib\", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]"
    }

    func output(field: Variable, to fragment: SourceFragment) {
        document(field.documentation, fragment: fragment)
        let selfFormal = field.isStatic ? "" : "IntPtr self, "
        let selfArg = field.isStatic ? "" : "thisHandle.ptr, "
        fragment.output("public \(field.isOverride ? "override " : "")\(field.isStatic ? "static " : "")", newLineTerminated: false)
        fragment.outputBlock("\(field.type.name) \(field.name) {") {
            fragment.outputBlock("get => Check((out IntPtr exn) => {", closeWith: "});") {
                if !field.isStatic {
                    fragment.output("using var thisHandle = new GCRef(this);")
                }
                if field.type.isObject {
                    fragment.output("return ConsumeHandle<\(field.type.name)>(__cs_get_\(field.mangledName)(\(selfArg)out exn));")
                } else {
                    fragment.output("return __cs_get_\(field.mangledName)(\(selfArg)out exn);")
                }
            }
            if !field.readOnly {
                fragment.outputBlock("set {") {
                    fragment.outputBlock("Check((out IntPtr exn) => {", closeWith: "});") {
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
                        fragment.output("__cs_set_\(field.mangledName)(\(selfArg)\(valueValue), out exn);")
                    }
                }
            }
        }

        fragment.blankLine()
        fragment.output(dllImportMark)
        fragment.output("private static extern \(field.type.pInvokeName) __cs_get_\(field.mangledName)(\(selfFormal)out IntPtr exn);")
        if !field.readOnly {
            fragment.blankLine()
            fragment.output(dllImportMark)
            fragment.output("private static extern void __cs_set_\(field.mangledName)(\(selfFormal)\(field.type.pInvokeName) value, out IntPtr exn);")
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
                    return "\(parameter.type.name) \(labelComment)\(deforbidify(parameter.name))"
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
                            fragment.output("using var _\(param.name)Handle = new GCRef(\(deforbidify(param.name)));")
                            paramStrings.append("_\(param.name)Handle.ptr")
                        } else {
                            paramStrings.append("\(deforbidify(param.name))")
                        }
                    }
                    paramStrings.append("out _exn")

                    let body = "Check((out IntPtr _exn) => __cs_\(method.mangledName)(\(paramStrings.joined(separator: ", "))))"
                    if method.returnType.isObject {
                        fragment.outputBlock("return ConsumeHandle<\(method.returnType.name)>(", closeWith: ");") {
                            fragment.output(body)
                        }
                    } else {
                        fragment.output("return \(body);")
                    }
                }
            }
        }
        if method.body == nil {
            fragment.blankLine()
            fragment.output(dllImportMark)
            fragment.outputBlock("private static extern \(method.returnType.pInvokeName) __cs_\(method.mangledName)(", closeWith: ");") {
                if !method.isStatic {
                    fragment.output("IntPtr self,")
                }
                for parameter in method.parameters {
                    fragment.output("\(parameter.type.pInvokeName) \(deforbidify(parameter.name)),")
                }
                fragment.output("out IntPtr exn")
            }
        }
        fragment.blankLine()
    }
}

extension CSharpClass.CSType: CustomStringConvertible {
    var description: String {
        "FIXME: You should not use this, you should use one of the representations below. \(name)"
    }

    var name: String {
        switch self {
        case .void: return "Void"
        case let .named(.none, name): return name
        case let .named(.some(package), name): return "\(package).\(name)"
        case let .primitive(name): return name
        case let .optional(wrapped): return "\(wrapped.name)?"
        }
    }

    var pInvokeName: String {
        isObject ? "IntPtr" : name
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
            fragment.output("public struct \(unqualifiedName) ", newLineTerminated: false)
        }
        fragment.outputBlock("{") {
            switch constructor {
            case .reference:
                fragment.output("internal \(unqualifiedName)(IntPtr reference): base(reference) {}")
            case .public(let fields):
                for field in fields {
                    fragment.output("public \(field.type.name) \(deforbidify(field.name));")
                }
                fragment.blankLine()

                fragment.outputBlock("public \(unqualifiedName)(", newLineTerminated: false) {
                    fragment.outputMap(fields, separator: ",") { field in
                        "\(field.type.name) \(deforbidify(field.name))"
                    }
                }
                fragment.outputBlock(" {") {
                    for field in fields {
                        fragment.output("this.\(deforbidify(field.name)) = \(deforbidify(field.name));")
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

    enum Case {
        case object(name: String)
        case dataClass(documentation: [String], name: String, values: [(name: String, type: CSType)])
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
        fragment.outputBlock("sealed class \(unqualifiedName) {") {
            for enumCase in cases {
                switch enumCase {
                case let .object(name):
                    fragment.output("object \(name) : \(unqualifiedName)()")
                case let .dataClass(documentation, name, values):
                    document(documentation, fragment: fragment)
                    fragment.outputBlock("data class \(name)(", newLineTerminated: false) {
                        fragment.outputMap(values, separator: ",") { value in
                            "\(value.type.name) \(value.name);"
                        }
                    }
                    fragment.output(" : \(unqualifiedName)()")
                }
            }
            fields.filter { !$0.isStatic }.forEach { output(field: $0, to: fragment) }
            methods.filter { !$0.isStatic }.forEach { output(method: $0, to: fragment) }

            fragment.blankLine()

            fragment.outputBlock("companion object {") {
                fields.filter { $0.isStatic }.forEach { output(field: $0, to: fragment) }
                methods.filter { $0.isStatic }.forEach { output(method: $0, to: fragment) }
                fragment.output("init { loadNativeLibs() }")
            }
            outputInner(to: fragment)
        }
    }
}
