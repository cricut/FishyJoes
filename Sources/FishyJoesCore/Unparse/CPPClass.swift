import Foundation
/**
 Represents a mostly free-form C++ class containing methods & fields.
 No support for generics or types that aren't TranslatedTypes.
 Types are TranslatedType, .cppName is used when outputting type names.
 Function parameters are output as const Type& where Type is TranslatedType.cppName.
 Except for primitives, I believe const primitive& works, but it's weird, so the const& is stripped.
 Function return types are Type.
 Field types are Type.
 */
class CPPClass {
    struct CPPConstructor {
        let documentation: [String]
        let isPrivate: Bool
        let parameters: [CPPParameter]
        let initializers: [(fieldName: String, initializer: String)]
        let body: (SourceFragment) -> Void
        var containedNamedTypes: [TranslatedType] {
            return Array(parameters.map(\.type.containedNamedTypes).joined())
        }
    }
    struct CPPParameter {
        let labelComment: String?
        let name: String
        let type: TranslatedType
        let defaultValue: String?
    }
    struct CPPBinding {
        let symbol: String
        let params: Int
    }
    struct CPPMethod {
        let name: String
        let documentation: [String]
        let isStatic: Bool
        let isOverride: Bool
        let isPrivate: Bool
        let parameters: [CPPParameter]
        let returnType: TranslatedType
        let bindings: [CPPBinding]
        let body: (SourceFragment) -> Void
        var containedNamedTypes: [TranslatedType] {
            returnType.containedNamedTypes + parameters.map(\.type.containedNamedTypes).joined()
        }
        init(
            name: String,
            documentation: [String] = [],
            isStatic: Bool = false,
            isOverride: Bool = false,
            isPrivate: Bool = false,
            parameters: [CPPParameter] = [],
            returnType: TranslatedType,
            bindings: [CPPBinding],
            body: @escaping (SourceFragment) -> Void
        ) {
            self.name = name
            self.documentation = documentation
            self.isStatic = isStatic
            self.isOverride = isOverride
            self.isPrivate = isPrivate
            self.parameters = parameters
            self.returnType = returnType
            self.bindings = bindings
            self.body = body
        }
    }
    struct CPPField {
        let documentation: [String]
        let isStatic: Bool
        let isPrivate: Bool
        let name: String
        let type: TranslatedType
        let initializer: String?
    }
    let module: String
    let qualifiedName: String
    let parentQualifiedName: String?
    let swiftQualifiedName: String
    let name: String
    let documentation: [String]
    let constructors: [CPPConstructor]
    let methods: [CPPMethod]
    let fields: [CPPField]
    //(mutated by FishyJoesContext once all CPPClass instances are set up)
    var innerClasses: [CPPClass]
    let serializedFields: [CPPField]
    
    init(
        module: String, documentation: [String], name: String,
        constructors: [CPPConstructor] = [],
        methods: [CPPMethod] = [],
        fields: [CPPField] = [],
        serializedFields: [CPPField] = [],
        innerClases: [CPPClass] = []
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
        self.constructors = constructors
        self.methods = methods
        self.fields = fields
        self.innerClasses = innerClases
        self.serializedFields = serializedFields
    }
    
    var containedNamedFields: [TranslatedType] {
        Array(self.constructors.map(\.containedNamedTypes).joined()) +
        Array(self.methods.map(\.containedNamedTypes).joined()) +
        Array(self.fields.map(\.type.containedNamedTypes).joined())
    }
    
    let cppKeywords: Set<String> = ["alignas", "alignof", "and", "and_eq", "asm", "atomic_cancel", "atomic_commit", "atomic_noexcept", "auto", "bitand", "bitor", "bool", "break", "case", "catch", "char", "char8_t", "char16_t", "char32_t", "class", "compl", "concept", "const", "consteval", "constexpr", "constinit", "const_cast", "continue", "co_await", "co_return", "co_yield", "decltype", "default", "delete", "do", "double", "dynamic_cast", "else", "enum", "explicit", "export", "extern", "false", "float", "for", "friend", "goto", "if", "inline", "int", "long", "mutable", "namespace", "new", "noexcept", "not", "not_eq", "nullptr", "operator", "or", "or_eq", "private", "protected", "public", "reflexpr", "register", "reinterpret_cast", "requires", "return", "short", "signed", "sizeof", "static", "static_assert", "static_cast", "struct", "switch", "synchronized", "template", "this", "thread_local", "throw", "true", "try", "typedef", "typeid", "typename", "union", "unsigned", "using", "virtual", "void", "volatile", "wchar_t", "while", "xor", "xor_eq"]
    
    //make not contain keywords
    func clean(name: String) -> String {
        if cppKeywords.contains(name) {
            return name + "_"
        }
        return name
    }
    
    //the three below functions require isPrivate to have already been handled, see output(to fragment:)
    //(we could put private: or public: on each declaration but that's ugly)
    
    private func outputDecl(constructor: CPPConstructor, to fragment: SourceFragment) {
        for line in constructor.documentation {
            fragment.output("///\(line)")
        }
        fragment.output("\(name)(", newLineTerminated: false)
        fragment.output(
            constructor.parameters
                .map { "const \($0.type.cppName) &\($0.name)" }
                .joined(separator: ", "),
            newLineTerminated: false
        )
        fragment.output(")", newLineTerminated: false)
        if !constructor.initializers.isEmpty {
            fragment.output(": ", newLineTerminated: false)
            fragment.output(
                constructor.initializers
                    .map { "\($0.fieldName)(\($0.initializer))" }
                    .joined(separator: ", "),
                newLineTerminated: false
            )
        }
        fragment.output(";")
    }
    
    private func outputDef(constructor: CPPConstructor, to fragment: SourceFragment) {
        fragment.output("\(qualifiedName)::\(name)(", newLineTerminated: false)
        fragment.output(
            constructor.parameters
                .map { "const \($0.type.cppName) &\($0.name)" }
                .joined(separator: ", "),
            newLineTerminated: false
        )
        fragment.outputBlock(") {") {
            constructor.body(fragment)
        }
    }
    
    private func outputDecl(method: CPPMethod, to fragment: SourceFragment) {
        for doc in method.documentation {
            fragment.output("///\(doc)")
        }
        fragment.output("\(method.isStatic ? "static " : "")\(method.returnType.cppName) \(clean(name: method.name))(\(method.parameters.cppString()))\(method.isOverride ? " override" : "");")
        fragment.output("")
    }
    
    private func outputDef(method: CPPMethod, to fragment: SourceFragment) {
        fragment.outputBlock("\(method.returnType.cppName) \(qualifiedName)::\(clean(name: method.name))(\(method.parameters.cppString())) {") {
            method.body(fragment)
        }
    }
    
    private func output(field: CPPField, to fragment: SourceFragment) {
        for doc in field.documentation {
            fragment.output("///\(doc)")
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
        for name in names {
            fragment.output("#include \"\(name).hpp\"")
        }
    }
    
    func declareSelf(to fragment: SourceFragment) {
        for doc in documentation {
            fragment.output("///\(doc)")
        }
        fragment.outputBlock("class \(name) {", semicolonTerminated: true) {
            let publicConstructors  = constructors.filter { !$0.isPrivate }
            let privateConstructors = constructors.filter {  $0.isPrivate }
            let publicMethods       = methods.filter      { !$0.isPrivate }
            let privateMethods      = methods.filter      {  $0.isPrivate }
            let publicFields        = fields.filter       { !$0.isPrivate }
            let privateFields       = fields.filter       {  $0.isPrivate }
            
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
            
            fragment.output("/*  Constructors  */")
            if !publicConstructors.isEmpty {
                fragment.output("public:")
                publicConstructors.forEach { outputDecl(constructor: $0, to: fragment) }
            }
            if !privateConstructors.isEmpty {
                fragment.output("private:")
                privateConstructors.forEach { outputDecl(constructor: $0, to: fragment) }
            }
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
            fragment.output("friend class FishyJoesInternal::Packer;")
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
    
    func sourceFragment() -> SourceFragment {
        let fragment = SourceFragment(sourceryDestination: "file:../../cpp/src/\(swiftQualifiedName).cpp")
        fragment.output("#include \"shared_impl.hpp\"")
        fragment.outputBlock("namespace \(module) {") {
            for constructor in constructors {
                outputDef(constructor: constructor, to: fragment)
            }
            for method in methods {
                outputDef(method: method, to: fragment)
            }
        }
        return fragment
    }
    
    //Declare overloaded FishyJoesInternal::Packer::put & get for this type
    //context:
    //namespace CriGeo {
    //  namespace FishyJoesInternal {
    //    struct FishyJoesInternal::Packer {
    //      /* we're adding put/get overloads here */
    //    }
    //  }
    //}
    func packerImpl(to frag: SourceFragment) {
        // thank you generatePackImplHeader for doing the hard work here!
        // we can just recurse into put/get for serialized fields and that's it.
        frag.outputBlock("void put(const \(module)::\(qualifiedName)& obj) {") {
            for field in serializedFields {
                frag.output("put(obj.\(field.name));")
            }
        }
        frag.outputBlock("void get(\(module)::\(qualifiedName)& obj) {") {
            for field in serializedFields {
                frag.output("get(obj.\(field.name));")
            }
        }
    }
}

extension Array where Element == CPPClass.CPPParameter {
    func cppString() -> String {
        return map { param in
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
}
