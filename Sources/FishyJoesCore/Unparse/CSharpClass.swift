private var forbiddenVarNames: Set<String> = [
    "String",
    "string",
]
private func deforbidify(_ name: String) -> String {
    forbiddenVarNames.contains(name) ? "_\(name)" : name
}

class CSharpClass: NestedClass {
    indirect enum CSType: Equatable {
        case void
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
        let body: String?
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

    var fragment: SourceFragment {
        let fragment = SourceFragment(sourceryDestination: "file:../../c-sharp/src/generated/\(name).cs")

        fragment.output("using System;")
        fragment.output("using System.Runtime.InteropServices;")
        fragment.output("using System.Collections.Generic;")
        fragment.output("using Cricut.FishyJoesRuntime;")
        fragment.output("using static Cricut.FishyJoesRuntime.Utilities;")
        for dependency in module.dependencies {
            fragment.output("using \(dependency.lowercased());")
        }
        fragment.blankLine()
        fragment.outputBlock("namespace Cricut.\(module.name) {") {
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

    func output(field: Variable, to fragment: SourceFragment) {
        document(field.documentation, fragment: fragment)
        let selfFormal = field.isStatic ? "" : "object self, "
        let selfArg = field.isStatic ? "" : "this, "
        fragment.outputBlock("public \(field.isOverride ? "override " : "")\(field.type.cSharpType) \(field.name) {") {
            fragment.output("get => Check((out Exception? exn) => __cs_get_\(field.mangledName)(\(selfArg)out exn));")
            if !field.readOnly {
                fragment.output("set { Check((out Exception? exn) => __cs_set_\(field.mangledName)(\(selfArg)value, out exn)); }")
            }
        }

        fragment.blankLine()
        fragment.output("[DllImport(\"\(module.name)\")]")
        fragment.output("private static extern \(field.type.cSharpType) __cs_get_\(field.mangledName)(\(selfFormal)out Exception? exn);")
        if !field.readOnly {
            fragment.blankLine()
            fragment.output("[DllImport(\"\(module.name)\")]")
            fragment.output("private static extern void __cs_set_\(field.mangledName)(\(selfFormal)\(field.type.cSharpType) value, out Exception? exn);")
        }
        fragment.blankLine()
    }

    func output(method: Method, to fragment: SourceFragment) {
        document(method.documentation, fragment: fragment)
        if !method.name.hasPrefix("_") {
            fragment.output("public \(method.isOverride ? "override " : "")", newLineTerminated: false)
            fragment.outputBlock("\(method.returnType.cSharpType) \(method.name)(", newLineTerminated: false) {
                fragment.outputMap(method.parameters, separator: ",") { parameter in
                    let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
                    return "\(parameter.type.cSharpType) \(labelComment)\(deforbidify(parameter.name))"
                }
            }
            if let body = method.body {
                fragment.output(" => \(body);")
            } else {
                let paramStrings = (method.isStatic ? [] : ["this"]) + method.parameters.map { "\(deforbidify($0.name))" } + ["out exn"]
                fragment.output(" => Check((out Exception? exn) => __cs_\(method.mangledName)(\(paramStrings.joined(separator: ", "))));")
            }
        }
        if method.body == nil {
            fragment.output("[DllImport(\"\(module.name)\")]")
            fragment.outputBlock("static extern \(method.returnType.cSharpType) __cs_\(method.mangledName)(", closeWith: ");") {
                if !method.isStatic {
                    fragment.output("object self,")
                }
                for parameter in method.parameters {
                    fragment.output("\(parameter.type.cSharpType) \(deforbidify(parameter.name)),")
                }
                fragment.output("out Exception? exn")
            }
        }
        fragment.blankLine()
    }
}

extension CSharpClass.CSType: CustomStringConvertible {
    var description: String {
        "FIXME: You should not use this, you should use one of the representations below. \(cSharpType)"
    }

    var cSharpType: String {
        switch self {
        case .void: return "Void"
        case let .named(.none, name): return name
        case let .named(.some(package), name): return "\(package).\(name)"
        case let .optional(wrapped): return "\(wrapped.cSharpType)?"
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
    let reference: Bool

    init(
        module: Module,
        documentation: [String],
        name: String,
        constructor: Constructor,
        fieldsAndMethods: [MethodOrVariable],
        reference: Bool = false
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
        self.reference = reference
        super.init(module: module, documentation: documentation, name: name)
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)

        let implements = constructor == .reference ? " : SwiftReference" : ""
        fragment.outputBlock("public class \(unqualifiedName)\(implements) {") {
            switch constructor {
            case .reference:
                fragment.output("\(unqualifiedName)(IntPtr reference): base(reference) {}")
            case .public(let fields):
                for field in fields {
                    fragment.output("\(field.type.cSharpType) \(deforbidify(field.name));")
                }
                fragment.blankLine()

                fragment.outputBlock("\(unqualifiedName)(", newLineTerminated: false) {
                    fragment.outputMap(fields, separator: ",") { field in
                        "\(field.type.cSharpType) \(deforbidify(field.name))"
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
                            "\(value.type.cSharpType) \(value.name);"
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
