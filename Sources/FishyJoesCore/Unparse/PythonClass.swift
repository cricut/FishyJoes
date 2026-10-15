/// Print out PythonClasses given inputs from Swift
///
/// The purpose of PythonClass is to be a pretty printer. Logic that could be extracted elsewhere perhaps should be
class PythonClass {
    enum MethodOrVariable {
        case method(Method)
        case variable(Variable)
    }

    struct Method: Decorable {
        struct Parameter {
            let labelComment: String?
            let name: String
            let type: PythonType
            let defaultValue: String?

            init(labelComment: String? = nil, name: String, type: PythonType, defaultValue: String? = nil) {
                self.labelComment = labelComment
                self.name = name
                self.type = type
                self.defaultValue = defaultValue
            }

            var pythonName: String {
                PythonClass.deforbidify(snakify(name), localVar: true)
            }
        }

        let documentation: [String]
        let isStatic: Bool
        var isOverride: Bool
        let name: String
        let mangledName: String
        var parameters: [Parameter]
        let returnType: PythonType
        let deprecation: Deprecation?
        var implementationKind: MemberImplementationKind
    }

    struct Variable: Decorable, Equatable {
        let documentation: [String]
        let isStatic: Bool
        var isOverride: Bool
        let isMutable: Bool
        let isPubliclyWritable: Bool
        let asMethod: Bool
        let name: String
        let mangledName: String
        let type: PythonType
        let deprecation: Deprecation?
        var implementationKind: MemberImplementationKind

        var hiddenStorage: Bool {
            isMutable && !isPubliclyWritable
        }

        var storedName: String {
            "\(hiddenStorage ? "_" : "")\(PythonClass.deforbidify(snakify(name), localVar: false))"
        }

        var pythonName: String {
            PythonClass.deforbidify(snakify(name), localVar: false)
        }
    }

    struct SetupTypes {
        let typedefs: [String: PythonType]
        let setupArguments: [(PythonType, String)]
    }

    enum MemberImplementationKind: Equatable {
        /// Body implemented in python
        case explicitBody(lines: [String])
        /// Regular function with a body, if isDefault then it's a default implementation for a protocol
        case implementationInSwift(isDefault: Bool)
        /// Protocol requirement, no implementation
        case abstract
    }

    let module: Module
    let documentation: [String]
    let namespaces: [String]
    let name: String
    let mangledName: String
    let setupTypes: SetupTypes?
    var fields: [Variable]
    var methods: [Method]
    var conformances: Set<PythonType>

    var associatedNamespace: (name: String, additionalExports: [(unqualifiedName: String, importLocation: String?)])? { nil }

    init(
        module: Module,
        documentation: [String],
        namespaces: [String],
        name: String,
        mangledName: String,
        setupTypes: SetupTypes? = nil,
        fields: [Variable],
        methods: [Method],
        conformances: Set<PythonType> = []
    ) {
        self.module = module
        self.documentation = documentation
        self.namespaces = namespaces
        self.name = name
        self.mangledName = mangledName
        self.setupTypes = setupTypes
        self.fields = fields
        self.methods = methods
        self.conformances = conformances
    }

    func publicFragments(context: FishyJoesContext) -> [SourceFragment] { [] }

    // output to _type_name_implementation.py
    func outputCAPIs(to fragment: SourceFragment, context: FishyJoesContext) {
        for (name, type) in setupTypes?.typedefs ?? [:] {
            fragment.output(" \(name): typing.TypeAlias = \(type.static.name())")
        }
    }

    // output to _type_name_implementation.py
    func outputCCallbackImplementations(to fragment: SourceFragment, context: FishyJoesContext) {}

    // output to _type_name_implementation.py
    func outputSetup(to fragment: SourceFragment, context: FishyJoesContext) {}

    func fragments(context: FishyJoesContext) -> [SourceFragment] {
        let publicFragments = publicFragments(context: context)
        let implementationFragment = context.pythonFragment(implementationModulePath)
        let rootImportPath = implementationFragment.rootImportName

        context.addHeader(to: implementationFragment, "from \(rootImportPath)_c_api import _\(context.module.pythonPackageName)_lib")

        implementationFragment.output("# MARK: C APIs")
        implementationFragment.output()
        outputCAPIs(to: implementationFragment, context: context)

        implementationFragment.output("# MARK: C callback implementations")
        implementationFragment.output()
        outputCCallbackImplementations(to: implementationFragment, context: context)

        implementationFragment.output("# MARK: setup")
        implementationFragment.output()
        outputSetup(to: implementationFragment, context: context)

        return publicFragments + [implementationFragment]
    }

    func document(_ documentation: [String], fragment: SourceFragment) {
        guard !documentation.isEmpty else { return }
        for line in documentation {
            fragment.output(#""""\#(line)""""#)
        }
    }

    var unqualifiedName: String {
        String(name.split(separator: ".").last!)
    }

    var typeDefinitionModuleName: String {
        "_\(snakify(unqualifiedName))_type"
    }

    var implementationModuleName: String {
        "_\(snakify(unqualifiedName))_implementation"
    }

    var implementationModulePath: String {
        (namespaces + ["\(implementationModuleName).py"]).joined(separator: "/")
    }

    var typeDefinitionModulePath: String {
        (namespaces + ["\(typeDefinitionModuleName).py"]).joined(separator: "/")
    }

    var nativeMethods: [IotaTranslator.NativeMethod<PythonType>] {
        var result: [IotaTranslator.NativeMethod<PythonType>] = []

        let thisArg = ("_this", PythonType.class(module: module.pythonPackageName, namespaces: namespaces, name: name))

        for field in fields {
            let baseArgs = field.isStatic ? [] : [thisArg]
            switch field.implementationKind {
            case .abstract:
                continue
            case .explicitBody:
                fatalErr("Internal error: .explicitBody not supported on fields")
            case .implementationInSwift(let isDefault):
                result.append(
                    IotaTranslator.NativeMethod(
                        name: isDefault ? "iota__default_\(field.mangledName)" : "iota_get_\(field.mangledName)",
                        args: baseArgs,
                        returnType: field.type
                    )
                )
                if field.isPubliclyWritable {
                    result.append(
                        IotaTranslator.NativeMethod(
                            name: "iota_set_\(field.mangledName)",
                            args: baseArgs + [(field.name, field.type)],
                            returnType: .none,
                        )
                    )
                }
            }
        }

        for method in methods {
            guard case .implementationInSwift = method.implementationKind else { continue }

            var params = method.isStatic ? [] : [thisArg]

            // Keep the parameters in original order here, because the swift-side expects them in that order
            for param in method.parameters {
                params.append((PythonClass.deforbidify(param.name, localVar: true), param.type))
            }

            result.append(
                IotaTranslator.NativeMethod(
                    name: "iota_\(method.mangledName)",
                    args: params,
                    returnType: method.returnType
                )
            )
        }

        return result
    }

    func outputNativeMethodDeclarations(methods: [IotaTranslator.NativeMethod<PythonType>], fragment: SourceFragment) {
        for method in methods {
            fragment.outputBlock("\(method.name): typing.Callable[[", newLineTerminated: false) {
                fragment.output("fishyjoes_runtime.EnvRef,")
                for (_, argType) in method.args {
                    fragment.output("\(argType.static.ffiUnownedType.name()),")
                }
            }
            fragment.outputBlock(", \(method.returnType.static.ffiCreatedType.name())] = \\", closeWith: "") {
                fragment.output("fishyjoes_runtime.raise_by_out_ref(getattr(_\(module.pythonPackageName)_lib, '__\(method.name)'))")
            }
        }
    }

    func outputPublic(classField field: Variable, to fragment: SourceFragment) {
        precondition(!field.isStatic)
        let name = PythonClass.deforbidify(field.name, localVar: false)
        fragment.blankLine()
        fragment.output("@property")
        outputDecorators(for: field, to: fragment)
        fragment.outputBlock("def \(name)(self) -> \(field.type.static.name(in: self)):") {
            document(field.documentation, fragment: fragment)
            switch field.implementationKind {
            case .explicitBody(let lines):
                lines.forEach { fragment.output($0) }
            case .abstract:
                fragment.output("...")
            case .implementationInSwift(let isDefault):
                let fieldFuncName = isDefault ? "_impl.iota__default_\(field.mangledName)" : "_impl.iota_get_\(field.mangledName)"
                let functionCall = "\(fieldFuncName)(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)"
                fragment.outputBlock("\(PythonClass.withLocalHandles([("self", "self_handle")])):") {
                    if field.type.static.isPrimitive {
                        fragment.output("return \(functionCall)")
                    } else {
                        fragment.output("return fishyjoes_runtime.consume_created_ref(\(functionCall), \(field.type.dynamicsString))")
                    }
                }
            }
        }
        fragment.blankLine()

        if field.isPubliclyWritable {
            // TODO: delete this misleading comment
            // Decorators not output on setters. I think that's right because they actually end up stored inside the property, which is decorated.
            fragment.output("@\(name).setter")
            outputDecorators(for: field, to: fragment)
            fragment.outputBlock("def \(name)(self, new_value: \(field.type.static.name(in: self))) -> None:") {
                var localHandles = [(expression: "self", bindTo: "self_handle")]
                let value: String
                if field.type.static.isPrimitive {
                    value = "new_value"
                } else {
                    localHandles.append((expression: "new_value", bindTo: "new_value_handle"))
                    value = "new_value_handle"
                }
                fragment.outputBlock("\(PythonClass.withLocalHandles(localHandles)):") {
                    fragment.output("_impl.iota_set_\(field.mangledName)(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, \(value))")
                }
            }
        }
    }

    func outputPublic(getterSetterFor field: Variable, to fragment: SourceFragment, inClass: Bool) {
        precondition(field.isStatic || inClass)
        fragment.blankLine()
        let (selfParam, selfHandleParam) = field.isStatic ? ("", "") : ("self", ", self_handle")
        if inClass && field.isStatic {
            fragment.output("@staticmethod")
        }
        outputDecorators(for: field, to: fragment)
        let type = field.type.static.name(in: inClass ? self : nil)
        fragment.outputBlock("def get_\(field.name)(\(selfParam)) -> \(type):") {
            document(field.documentation, fragment: fragment)
            let functionCall = "_impl.iota_get_\(field.mangledName)(fishyjoes_runtime.Runtime.shared.env_ref\(selfHandleParam))"
            fragment.conditionalWrap(if: !field.isStatic) { inner in
                fragment.outputBlock("with fishyjoes_runtime.local_handles(self) as (self_handle,):", inner)
            } body: {
                if field.type.static.isPrimitive {
                    fragment.output("return \(functionCall)")
                } else if field.type.dynamics == [] {
                    fragment.output(functionCall)
                    fragment.output(#"raise AssertionError("Return type is uninhabited. Expected code to be unreachable")"#)
                } else {
                    fragment.output("return fishyjoes_runtime.consume_created_ref(\(functionCall), \(field.type.dynamicsString))")
                }
            }
        }
        if field.isPubliclyWritable {
            fragment.blankLine()
            if inClass {
                fragment.output("@staticmethod")
            }
            outputDecorators(for: field, to: fragment)
            // TODO: implement this
            fragment.output("def set_\(field.name)(new_value: \(type)) -> None: ...")
        }
    }

    func output(field: Variable, to fragment: SourceFragment, inClass: Bool = true, isAbstract: Bool = false) {
        if field.isStatic || field.asMethod {
            outputPublic(getterSetterFor: field, to: fragment, inClass: inClass)
        } else {
            precondition(inClass, "instance variables must be defined in a class")
            outputPublic(classField: field, to: fragment)
        }
    }

    func output(method: Method, to fragment: SourceFragment, inClass: Bool = true, isAbstract: Bool = false) {
        fragment.blankLine()
        if method.isStatic && inClass {
            fragment.output("@staticmethod")
        }
        outputDecorators(for: method, to: fragment)
        fragment.outputBlock("def \(method.name)(", newLineTerminated: false) {
            if !method.isStatic {
                fragment.output("self,")
            }
            func outputParameter(parameter: Method.Parameter) {
                let defaultValue = parameter.defaultValue.map { " = \($0)" } ?? ""
                fragment.output("\(PythonClass.deforbidify(parameter.name, localVar: true)): \(parameter.type.static.name(in: inClass ? self : nil))\(defaultValue),")
            }

            // put all optional parameters at the end, or python gets unhappy
            let requiredParams = method.parameters.filter { $0.defaultValue == nil }
            let optionalParams = method.parameters.filter { $0.defaultValue != nil }

            requiredParams.forEach(outputParameter)
            if !optionalParams.isEmpty {
                fragment.output("*,")
                optionalParams.forEach(outputParameter)
            }
        }
        fragment.outputBlock(" -> \(method.returnType.static.name(in: inClass ? self : nil)):") {
            document(method.documentation, fragment: fragment)
            switch method.implementationKind {
            case .explicitBody(let lines):
                lines.forEach { fragment.output($0) }
            case .abstract:
                fragment.output("...")
            case .implementationInSwift:
                var localHandles: [(expression: String, bindTo: String)] = []
                var paramStrings: [String] = []
                if !method.isStatic {
                    localHandles.append(("self", "_selfHandle"))
                    paramStrings.append("_selfHandle")
                }

                // Keep the parameters in original order here, because the swift-side expects them in that order
                for param in method.parameters {
                    if param.type.static.isPrimitive {
                        paramStrings.append("\(PythonClass.deforbidify(param.name, localVar: true))")
                    } else {
                        localHandles.append((PythonClass.deforbidify(param.name, localVar: true), "_\(param.name)Handle"))
                        paramStrings.append("_\(param.name)Handle")
                    }
                }

                var wrap: (() -> Void) -> Void = { $0() }
                if !localHandles.isEmpty {
                    wrap = { innerWriter in
                        fragment.outputBlock("\(PythonClass.withLocalHandles(localHandles)):") {
                            innerWriter()
                        }
                    }
                }

                if method.returnType.static.isPrimitive {
                    let outerWrap = wrap
                    wrap = { innerWriter in
                        outerWrap {
                            fragment.output("return ", newLineTerminated: false)
                            innerWriter()
                            fragment.output()
                        }
                    }
                } else if method.returnType.dynamics == [] {
                    let outerWrap = wrap
                    wrap = { innerWriter in
                        outerWrap {
                            innerWriter()
                            fragment.output()
                            fragment.output(#"raise AssertionError("Return type is uninhabited. Expected code to be unreachable")"#)
                        }
                    }
                } else {
                    let outerWrap = wrap
                    wrap = { innerWriter in
                        outerWrap {
                            fragment.outputBlock("return fishyjoes_runtime.consume_created_ref(") {
                                innerWriter()
                                fragment.output(",")
                                fragment.output("\(method.returnType.dynamicsString)")
                            }
                        }
                    }
                }

                wrap {
                    fragment.outputBlock("_impl.iota_\(method.mangledName)(", newLineTerminated: false) {
                        fragment.output("fishyjoes_runtime.Runtime.shared.env_ref,")
                        for paramString in paramStrings {
                            fragment.output("\(paramString),")
                        }
                    }
                }
            }
        }
        fragment.blankLine()
    }
}
extension PythonClass {

    func declareSupers(_ superclasses: [String]) -> String {
        if superclasses.isEmpty {
            return ""
        } else {
            return "(\(superclasses.joined(separator: ", ")))"
        }
    }

    static func separate(fieldsAndMethods: [PythonClass.MethodOrVariable]) -> ([PythonClass.Variable], [PythonClass.Method]) {
        let fields: [Variable] = fieldsAndMethods.compactMap {
            guard case let .variable(field) = $0 else {
                return nil
            }
            return field
        }
        let methods: [Method] = fieldsAndMethods.compactMap {
            guard case let .method(method) = $0 else {
                return nil
            }
            return method
        }
        return (fields, methods)
    }

    // python code to get this list:
    //     __import__('keyword').kwlist + __import__('keyword').softkwlist
    private static var forbiddenKeywordNames: Set<String> = [
        "False",
        "None",
        "True",
        "and",
        "as",
        "assert",
        "async",
        "await",
        "break",
        "class",
        "continue",
        "def",
        "del",
        "elif",
        "else",
        "except",
        "finally",
        "for",
        "from",
        "global",
        "if",
        "import",
        "in",
        "is",
        "lambda",
        "nonlocal",
        "not",
        "or",
        "pass",
        "raise",
        "return",
        "try",
        "while",
        "with",
        "yield",
        "_",
        "case",
        "match",
        "type",
    ]

    // Not keywords, but important builtin types/functions. Shouldn't be shadowed by local variables, but are fine as qualified names
    // pulled from https://docs.python.org/3/builtins/functions.html
    static let forbiddenVarNames: Set<String> = [
        "abs",
        "aiter",
        "all",
        "anext",
        "any",
        "ascii",
        "bin",
        "bool",
        "breakpoint",
        "bytearray",
        "bytes",
        "callable",
        "chr",
        "classmethod",
        "compile",
        "complex",
        "delattr",
        "dict",
        "dir",
        "divmod",
        "enumerate",
        "eval",
        "exec",
        "filter",
        "float",
        "format",
        "frozenset",
        "getattr",
        "globals",
        "hasattr",
        "hash",
        "help",
        "hex",
        "id",
        "input",
        "int",
        "isinstance",
        "issubclass",
        "iter",
        "len",
        "list",
        "locals",
        "map",
        "max",
        "memoryview",
        "min",
        "next",
        "object",
        "oct",
        "open",
        "ord",
        "pow",
        "print",
        "property",
        "range",
        "repr",
        "reversed",
        "round",
        "set",
        "setattr",
        "slice",
        "sorted",
        "staticmethod",
        "str",
        "sum",
        "super",
        "tuple",
        "type",
        "vars",
        "zip",
        "__import__",

        // imported modules used by runtime
        "types",
        "typing",
        "deprecated",
    ]

    static func deforbidify(_ name: String, localVar: Bool) -> String {
        var name = name.unescapedSwiftIdentifier
        if forbiddenKeywordNames.contains(name) || (localVar && forbiddenVarNames.contains(name)) {
            name = "\(name)_"
        }
        // leading underscores have semantic meaning in python, move them to the end. (recommended by PEP-8)
        let firstNonUnderscore = name.firstIndex { $0 != "_" } ?? name.startIndex
        let underscorePostfixName = String(name[firstNonUnderscore...] + name[..<firstNonUnderscore])
        // ... unless they would then start with a digit, which would make them an invalid identifier
        return underscorePostfixName.first?.isNumber == true ? name : underscorePostfixName
    }

    static func withLocalHandles(
        _ localHandles: [(expression: String, bindTo: String)],
    ) -> String {
        let expressions = localHandles.map(\.expression).joined(separator: ", ")
        // trailing comma is sometimes important for python tuples, so always add it
        let bindings = localHandles.map { "\($0.bindTo)," }.joined(separator: " ")
        return "with fishyjoes_runtime.local_handles(\(expressions)) as (\(bindings))"
    }

    func outputDecorators(for decorable: PythonClass.Decorable, to fragment: SourceFragment) {
        if let deprecation = decorable.deprecation {
            fragment.output("@deprecated(\"\(deprecation.quotedMessage)\")")
        }
        if decorable.isOverride {
            fragment.output("@typing.override")
        }
    }
}

extension PythonClass {
    protocol Decorable {
        var deprecation: Deprecation? { get }
        var isOverride: Bool { get }
    }
}

extension PythonClass.MemberImplementationKind: Comparable {
    static func < (lhs: PythonClass.MemberImplementationKind, rhs: PythonClass.MemberImplementationKind) -> Bool {
        // Why does swift make Comparable so difficult?
        switch (lhs, rhs) {
        case (.explicitBody(let lLines), .explicitBody(let rLines)):
            return lLines.lexicographicallyPrecedes(rLines)
        case (.explicitBody, _): return true

        case (.implementationInSwift, .explicitBody): return false
        case (.implementationInSwift(let lIsDefault), .implementationInSwift(let rIsDefault)):
            return (lIsDefault ? 1 : 0) < (rIsDefault ? 1 : 0)
        case (.implementationInSwift, .abstract): return true

        case (.abstract, _): return false
        }
    }
}
