import Foundation
/**
 Represents a mostly free-form C++ class containing methods & fields.
 No support for generics or types that aren't TranslatedTypes.
 Types are TranslatedType, .cppName is used when outputting type names.
 Function parameters are output as const Type& where Type is TranslatedType.cppName.
 Function return types are Type.
 Field types are Type.
 */
class CPPClass {
    struct CPPParameter {
        let labelComment: String?
        let name: String
        let type: CPPType
        let defaultValue: String?
    }
    struct CPPBinding {
        let symbol: String
        let params: Int
    }
    enum CPPType {
        case type(_: TranslatedType)
        case swiftRef(hashable: Bool)
        case variant(_: [String])
        case named(_: String)
        var cppName: String {
            switch self {
            case .swiftRef:
                return "FishyJoesInternal::SwiftReference"
            case .type(let type):
                return type.cppName
            case .variant(let types):
                return "std::variant<\(types.joined(separator: ","))>"
            case .named(let name):
                return name
            }
        }
        var containedNamedTypes: [TranslatedType] {
            switch self {
            case .swiftRef:
                return []
            case .type(let type):
                return type.containedNamedTypes
            case .variant:
                // including headers for these types won't work
                return []
            case .named:
                // .named is used for non-fishyjoes types
                return []
            }
        }
    }
    class CPPMethod {
        let name: String
        let bindingName: String
        let documentation: [String]
        let isStatic: Bool
        let isOverride: Bool
        let isPrivate: Bool
        let isConst: Bool
        let isMutable: Bool
        let parameters: [CPPParameter]
        let returnType: CPPType
        let body: (CPPMethod, SourceFragment, CPPClass, FishyJoesContext) -> Void
        var containedNamedTypes: [TranslatedType] {
            returnType.containedNamedTypes + parameters.map(\.type.containedNamedTypes).joined()
        }
        func completeBindingName(for classObj: CPPClass, in context: FishyJoesContext) -> String {
            let selfNameUnderscores = classObj.qualifiedName.replacingOccurrences(of: "::", with: "_")
            return "FJInternalBinding_\(context.module)_\(selfNameUnderscores)_\(bindingName)"
        }
        func binding(for classObj: CPPClass, in context: FishyJoesContext) -> CPPBinding {
            return CPPClass.CPPBinding(symbol: completeBindingName(for: classObj, in: context), params: isStatic ? parameters.count : parameters.count + 1)
        }
        init(
            name: String,
            documentation: [String] = [],
            isStatic: Bool = false,
            isOverride: Bool = false,
            isPrivate: Bool = false,
            isConst: Bool = false,
            isMutable: Bool = false,
            parameters: [CPPParameter] = [],
            returnType: CPPType,
            bindingOnlyName: String? = nil,
            body: ((CPPMethod, SourceFragment, CPPClass, FishyJoesContext) -> Void)? = nil
        ) {
            self.name = name
            self.documentation = documentation
            self.isStatic = isStatic
            self.isOverride = isOverride
            self.isPrivate = isPrivate
            self.isConst = isConst && !isStatic
            self.parameters = parameters
            self.returnType = returnType
            self.bindingName = bindingOnlyName ?? name
            self.isMutable = isMutable
            self.body = body ?? { (method, fragment, classObj, context) in
                let cBindingName = method.binding(for: classObj, in: context).symbol
                // method body lambda
                let paramsPassed = ((isStatic ? [] : [
                    method.isMutable ? "FishyJoesInternal::Packer::packThenUnpackMutatedMembersOnDestruct(*this).ptr()" : "FishyJoesInternal::Packer::pack(*this).ptr()"
                ]) + parameters.map { "FishyJoesInternal::Packer::pack(\($0.name)).ptr()" }).joined(separator: ", ")
                var callStmt = ""
                if !(returnType.cppName == "void") {
                    callStmt += "return FishyJoesInternal::Packer::unpack<\(returnType.cppName)>("
                }
                callStmt += "FishyJoesInternal::CBindings::\(cBindingName)(\(paramsPassed))"
                if !(returnType.cppName == "void") {
                    callStmt += ")"
                }
                callStmt += ";"
                fragment.output(callStmt)
            }
        }
    }
    struct CPPField {
        let documentation: [String]
        let isStatic: Bool
        let isPrivate: Bool
        let name: String
        let type: CPPType
        let initializer: String?
    }
    let module: Module
    let qualifiedName: String
    let parentQualifiedName: String?
    let swiftQualifiedName: String
    let name: String
    let documentation: [String]
    let methods: [CPPMethod]
    let fields: [CPPField]
    // (mutated by FishyJoesContext once all CPPClass instances are set up)
    var innerClasses: [CPPClass]
    let serializedFields: [CPPField]
    let magicalElements: [(SourceFragment) -> Void]
    let completeConstructorVisible: Bool

    func isHashable(in context: FishyJoesContext) -> Bool {
        for field in serializedFields {
            switch field.type {
            case .swiftRef(let hashable):
                if !hashable {
                    return false
                }
            case .type(let type):
                if type is TranslatedStruct || type is TranslatedEnum || type is TranslatedReference {
                    if context.cppClasses[type.cppName]?.isHashable(in: context) != true {
                        return false
                    }
                } else if type is TranslatedDictionary || type is TranslatedFunction || type is TranslatedSet || type is TranslatedTuple || type is TranslatedVoid {
                    return false
                }
            default:
                break
            }
        }
        return true
    }

    init(
        module: Module, documentation: [String], name: String,
        methods: [CPPMethod] = [],
        fields: [CPPField] = [],
        serializedFields: [CPPField] = [],
        innerClases: [CPPClass] = [],
        magicalElements: [(SourceFragment) -> Void] = [],
        completeConstructorVisible: Bool = false
    ) {
        let nameParts = name.split(separator: ".")
        if nameParts.count > 1 {
            self.parentQualifiedName = nameParts.dropLast().joined(separator: "::")
        } else {
            self.parentQualifiedName = nil
        }
        self.name = String(nameParts.last!)
        self.qualifiedName = nameParts.joined(separator: "::")
        self.swiftQualifiedName = name
        self.documentation = documentation
        self.module = module
        self.methods = methods
        self.fields = fields
        self.innerClasses = innerClases
        self.serializedFields = serializedFields
        self.magicalElements = magicalElements
        self.completeConstructorVisible = completeConstructorVisible
    }

    var containedNamedFields: [TranslatedType] {
        Array(self.methods.map(\.containedNamedTypes).joined()) +
        Array(self.fields.map(\.type.containedNamedTypes).joined())
    }

    let cppKeywords: Set<String> = ["alignas", "alignof", "and", "and_eq", "asm", "atomic_cancel", "atomic_commit", "atomic_noexcept", "auto", "bitand", "bitor", "bool", "break", "case", "catch", "char", "char8_t", "char16_t", "char32_t", "class", "compl", "concept", "const", "consteval", "constexpr", "constinit", "const_cast", "continue", "co_await", "co_return", "co_yield", "decltype", "default", "delete", "do", "double", "dynamic_cast", "else", "enum", "explicit", "export", "extern", "false", "float", "for", "friend", "goto", "if", "inline", "int", "long", "mutable", "namespace", "new", "noexcept", "not", "not_eq", "nullptr", "operator", "or", "or_eq", "private", "protected", "public", "reflexpr", "register", "reinterpret_cast", "requires", "return", "short", "signed", "sizeof", "static", "static_assert", "static_cast", "struct", "switch", "synchronized", "template", "this", "thread_local", "throw", "true", "try", "typedef", "typeid", "typename", "union", "unsigned", "using", "virtual", "void", "volatile", "wchar_t", "while", "xor", "xor_eq"]

    // make not contain keywords
    func clean(name: String) -> String {
        if cppKeywords.contains(name) {
            return name + "_"
        }
        return name
    }

    // the three below functions require isPrivate to have already been handled, see output(to fragment:)
    // (we could put private: or public: on each declaration but that's ugly)

    private func outputCompleteConstructorDecl(to fragment: SourceFragment) {
        let internalHint = " (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)"
        fragment.output("/// Create new \(name)\(completeConstructorVisible ? "" : internalHint)")
        fragment.output("\(name)(", newLineTerminated: false)
        fragment.output(
            serializedFields
                .map { "const \($0.type.cppName) &\($0.name)" }
                .joined(separator: ", "),
            newLineTerminated: false
        )
        fragment.output(");")
    }

    private func outputCompleteConstructorDef(to fragment: SourceFragment) {
        fragment.output("\(qualifiedName)::\(name)(", newLineTerminated: false)
        fragment.output(
            serializedFields
                .map { "const \($0.type.cppName) &\($0.name)" }
                .joined(separator: ", "),
            newLineTerminated: false
        )
        fragment.output(")", newLineTerminated: false)
        if !serializedFields.isEmpty {
            fragment.output(": ", newLineTerminated: false)
            fragment.output(
                serializedFields
                    .map { "\($0.name)(\($0.name))" }
                    .joined(separator: ", "),
                newLineTerminated: false
            )
        }
        fragment.output("{}")
    }

    func stringFor(parameters: [CPPParameter]) -> String {
        return parameters.map { param in
            var labelStr: String = ""
            var defaultValueStr: String = ""
            if let label = param.labelComment, label != param.name {
                labelStr = "/* \(label) */ "
            }
            if let defaultVal = param.defaultValue {
                defaultValueStr = " = \(defaultVal)"
            }
            return "const \(param.type.cppName) \(labelStr)&\(param.name)\(defaultValueStr)"
        }
        .joined(separator: ", ")
    }

    private func outputDecl(method: CPPMethod, to fragment: SourceFragment) {
        for doc in method.documentation {
            fragment.output("/// \(doc)")
        }
        fragment.output("\(method.isStatic ? "static " : "")\(method.returnType.cppName) \(clean(name: method.name))(\(stringFor(parameters: method.parameters)))\(method.isOverride ? " override" : "")\(method.isConst ? " const" : "");")
        fragment.output("")
    }

    private func outputDef(method: CPPMethod, in context: FishyJoesContext, to fragment: SourceFragment) {
        fragment.outputBlock("\(method.returnType.cppName) \(qualifiedName)::\(clean(name: method.name))(\(stringFor(parameters: method.parameters)))\(method.isConst ? " const" : "") {") {
            method.body(method, fragment, self, context)
        }
    }

    private func output(field: CPPField, to fragment: SourceFragment) {
        for doc in field.documentation {
            fragment.output("/// \(doc)")
        }
        if field.isStatic {
            fragment.output("static ", newLineTerminated: false)
        }
        fragment.output("\(field.type.cppName) \(field.name)", newLineTerminated: false)
        if let initializer = field.initializer {
            fragment.output(" = \(initializer);")
        } else {
            fragment.output(";")
        }
    }

    private func includeHeadersForDependentTypes(into fragment: SourceFragment) {
        var names: Set<String> = []
        for type in containedNamedFields {
            var name = type.cppName
            if name.contains("::") {
                name = String(name[..<name.range(of: "::")!.lowerBound])
            }
            names.insert(name)
        }
//        if let parentQualifiedName = parentQualifiedName {
//            names.insert(parentQualifiedName.replacingOccurrences(of: "::", with: "."))
//        }
        for name in names.sorted() {
            fragment.output("#include \"\(name).hpp\"")
        }
    }

    func declareSelf(to fragment: SourceFragment) {
        for doc in documentation {
            fragment.output("/// \(doc)")
        }
        fragment.outputBlock("class \(name) {", semicolonTerminated: true) {
            let publicMethods = methods.filter { !$0.isPrivate }
            let privateMethods = methods.filter { $0.isPrivate }
            let publicFields = fields.filter { !$0.isPrivate }
            let privateFields = fields.filter { $0.isPrivate }

            if !innerClasses.isEmpty {
                fragment.output("/*  Inner Classes  */")
                fragment.output("public:")
                for inner in innerClasses {
                    fragment.output("class \(inner.name);")
                }
                for inner in innerClasses {
                    inner.declareSelf(to: fragment)
                }
                fragment.output("")
            }

            if !magicalElements.isEmpty {
                fragment.output("/* Special */")
                fragment.output("")
                for magicalElement in magicalElements {
                    magicalElement(fragment)
                    fragment.output("")
                }
            }

            fragment.output("/*  Complete Constructor  */")
            if completeConstructorVisible {
                fragment.output("public:")
            } else {
                fragment.output("private:")
            }
            outputCompleteConstructorDecl(to: fragment)
            fragment.output("")

            fragment.output("/*  Methods  */")
            if !publicMethods.isEmpty {
                fragment.output("public:")
                publicMethods.forEach { outputDecl(method: $0, to: fragment) }
            }
            if !privateMethods.isEmpty {
                fragment.output("private:")
                privateMethods.forEach { outputDecl(method: $0, to: fragment) }
            }
            fragment.output("")

            fragment.output("/*  Data  */")
            if !publicFields.isEmpty {
                fragment.output("public:")
                publicFields.forEach { output(field: $0, to: fragment) }
            }
            if !privateFields.isEmpty {
                fragment.output("private:")
                privateFields.forEach { output(field: $0, to: fragment) }
            }
            fragment.output("")
            fragment.output("friend struct FishyJoesInternal::Packer;")
            fragment.output("template <typename T> friend struct std::hash;")
            fragment.output("template <typename T> friend struct std::equal_to;")
        }
    }

    func headerFragment() -> SourceFragment {
        let fragment = SourceFragment(sourceryDestination: "file:../../cpp/include/\(swiftQualifiedName).hpp")
        fragment.output("#pragma once")
        fragment.output("#include \"\(module)_pre.hpp\"")
        includeHeadersForDependentTypes(into: fragment)
        fragment.output("")
        fragment.outputBlock("namespace \(module) {") {
            declareSelf(to: fragment)
        }
        return fragment
    }

    func sourceFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = SourceFragment(sourceryDestination: "file:../../cpp/src/\(swiftQualifiedName).cpp")
        fragment.output("#include \"shared_impl.hpp\"")
        fragment.outputBlock("namespace \(module) {") {
            outputCompleteConstructorDef(to: fragment)
            for method in methods {
                outputDef(method: method, in: context, to: fragment)
            }
        }
        return fragment
    }

    // Declare overloaded FishyJoesInternal::Packer::put & get for this type
    // context:
    // namespace CriGeo {
    //   namespace FishyJoesInternal {
    //     struct FishyJoesInternal::Packer {
    //       /* we're adding put/get overloads here */
    //     }
    //   }
    // }
    func packerImpl(to frag: SourceFragment) {
        // thank you generatePackImplHeader for doing the hard work here!
        // we can just recurse into put/get for serialized fields and that's it.
        frag.outputBlock("inline void put(const \(module)::\(qualifiedName)& obj) {") {
            for field in serializedFields {
                frag.output("put(obj.\(field.name));")
            }
        }
        frag.outputBlock("inline \(module)::\(qualifiedName) get(std::in_place_type_t<\(module)::\(qualifiedName)> obj = std::in_place_type_t<\(module)::\(qualifiedName)>{}) {") {
            frag.outputBlock("return \(module)::\(qualifiedName) {", semicolonTerminated: true) {
                frag.output(serializedFields.map { field in "get_t<decltype(\(module)::\(qualifiedName)::\(field.name))>()" }.joined(separator: ", "))
            }
        }
    }
}
