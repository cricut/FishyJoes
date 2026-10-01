/// Print out PythonClasses given inputs from Swift
///
/// The purpose of PythonClass2 is to be a pretty printer. Logic that could be extracted elsewhere perhaps should be
class PythonClass2 {
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

    enum MethodOrVariable {
        case method(Method)
        case variable(Variable)
    }

    struct Method {
        typealias Parameter = (labelComment: String?, name: String, type: PythonType, defaultValue: String?)

        let documentation: [String]
        let isStatic: Bool
        let name: String
        let mangledName: String
        let parameters: [Parameter]
        let returnType: PythonType
        let deprecation: Deprecation?
        let body: [String]?
        let isDefaultImplementation: Bool
    }

    struct Variable: Equatable {
        let documentation: [String]
        let isStatic: Bool
        let isMutable: Bool
        let isPubliclyWritable: Bool
        let asMethod: Bool
        let name: String
        let mangledName: String
        let type: PythonType
        let deprecation: Deprecation?
        let isDefaultImplementation: Bool

        var hiddenStorage: Bool {
            isMutable && !isPubliclyWritable
        }
    }

    struct SetupTypes {
        let typedefs: [String: PythonType]
        let setupArguments: [(PythonType, String)]
    }

    let module: Module
    let documentation: [String]
    let namespaces: [String]
    let name: String
    let setupTypes: SetupTypes?
    let fields: [Variable]
    let methods: [Method]
    let conformances: [PythonType]

    var associatedNamespace: String? { nil }

    init(
        module: Module,
        documentation: [String],
        namespaces: [String],
        name: String,
        setupTypes: SetupTypes? = nil,
        fields: [Variable],
        methods: [Method],
        conformances: Set<PythonType>
    ) {
        self.module = module
        self.documentation = documentation
        self.namespaces = namespaces
        self.name = name
        self.setupTypes = setupTypes
        self.fields = fields
        self.methods = methods
        self.conformances = Array(conformances).sorted(by: { $0.static.name() < $1.static.name() })
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
        let implementationFragment = context.pythonFragment(
            implementationModulePath,
            additionalImports: [
                "from ._c_api import _\(context.module.pythonPackageName)_lib",
                "from .\(typeDefinitionModuleName) import \(unqualifiedName)",
            ]
        )

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

    var nativeMethods: [String: (args: [(String, PythonType)], return: PythonType, isDefaultImplementation: Bool, isProtocol: Bool)] {
        var result: [String: (args: [(String, PythonType)], return: PythonType, isDefaultImplementation: Bool, isProtocol: Bool)] = [:]

        let thisArg = ("_this", PythonType.class(module: module.pythonPackageName, namespaces: namespaces, name: name))

        for field in fields {
            let baseArgs = field.isStatic ? [] : [thisArg]

            let resultName = field.isDefaultImplementation ? "iota__default_\(field.mangledName)" : "iota_get_\(field.mangledName)"
            result[resultName] = (args: baseArgs, return: field.type, isDefaultImplementation: field.isDefaultImplementation, isProtocol: false)
            if field.isPubliclyWritable {
                result["iota_set_\(field.mangledName)"] = (args: baseArgs + [(field.name, field.type)], return: .none, isDefaultImplementation: false, isProtocol: false)
            }
        }

        for method in methods {
            if method.body != nil { continue }

            var params = method.isStatic ? [] : [thisArg]

            // Keep the parameters in original order here, because the swift-side expects them in that order
            for param in method.parameters {
                params.append((PythonClass2.deforbidify(param.name, localVar: true), param.type))
            }

            result["iota_\(method.mangledName)"] = (args: params, return: method.returnType, isDefaultImplementation: method.isDefaultImplementation, isProtocol: false)
        }

        return result
    }

    func outputNativeMethodDeclarations(methods: [String: (args: [(String, PythonType)], return: PythonType, isDefaultImplementation: Bool, isProtocol: Bool)], fragment: SourceFragment) {
        for (name, (args, returnType, _, _)) in methods.sorted(by: { $0.key < $1.key}) {
            fragment.outputBlock("\(name): typing.Callable[[", newLineTerminated: false) {
                fragment.output("fishyjoes_runtime.EnvRef,")
                for (_, argType) in args {
                    fragment.output("\(argType.static.ffiUnownedName),")
                }
            }
            fragment.outputBlock(", \(returnType.static.ffiCreatedName)] = \\", closeWith: "") {
                fragment.output("fishyjoes_runtime.raise_by_out_ref(getattr(_\(module.pythonPackageName)_lib, \"TODO\"))")
            }
        }
    }

    func outputPublic(instanceField field: Variable, to fragment: SourceFragment) {
        precondition(!field.isStatic)
        let name = PythonClass2.deforbidify(field.name, localVar: false)
        if let deprecation = field.deprecation {
            fragment.output("@Deprecated(\"\(deprecation.quotedMessage)\")")
        }
        fragment.output("@property")
        fragment.outputBlock("def \(name)(self) -> \(field.type.static.name(in: self)):") {
            document(field.documentation, fragment: fragment)
            let fieldFuncName = field.isDefaultImplementation ? "_impl.iota__default_\(field.mangledName)" : "_impl.iota_get_\(field.mangledName)"
            let functionCall = "\(fieldFuncName)(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)"
            fragment.outputBlock("\(PythonClass2.withLocalHandles([("self", "self_handle")])):") {
                if field.type.static.isPrimitive {
                    fragment.output("return \(functionCall)")
                } else {
                    fragment.output("return fishyjoes_runtime.consume_created_ref(\(functionCall), \(field.type.dynamicsString))")
                }
            }
        }
        fragment.blankLine()

        if field.isPubliclyWritable {
            fragment.output("@\(name).setter")
            fragment.outputBlock("def \(name)(self, new_value: \(field.type.static.name(in: self))) -> None:") {
                var localHandles = [(expression: "self", bindTo: "self_handle")]
                let value: String
                if field.type.static.isPrimitive {
                    value = "new_value"
                } else {
                    localHandles.append((expression: "new_value", bindTo: "new_value_handle"))
                    value = "new_value_handle"
                }
                fragment.outputBlock("\(PythonClass2.withLocalHandles(localHandles)):") {
                    fragment.output("_impl.iota_set_\(field.mangledName)(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, \(value))")
                }
            }
        }
    }

    func output(field: Variable, to fragment: SourceFragment) {
        if field.isStatic {
            fragment.output("# TODO: static field \(field.name)")
        } else {
            outputPublic(instanceField: field, to: fragment)
        }
    }

    func output(method: Method, to fragment: SourceFragment) {
        if let deprecation = method.deprecation {
            fragment.output("@deprecated(\"\(deprecation.quotedMessage)\")")
        }
        if method.isStatic {
            fragment.output("@staticmethod")
        }
        fragment.outputBlock("def \(method.name)(", newLineTerminated: false) {
            if !method.isStatic {
                fragment.output("self,")
            }
            func outputParameter(parameter: Method.Parameter) {
                let defaultValue = parameter.defaultValue.map { " = \($0)" } ?? ""
                fragment.output("\(PythonClass2.deforbidify(parameter.name, localVar: true)): \(parameter.type.static.name(in: self))\(defaultValue),")
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
        fragment.outputBlock(" -> \(method.returnType.static.name(in: self)):") {
            document(method.documentation, fragment: fragment)
            if let body = method.body {
                body.forEach { fragment.output($0) }
            } else {
                var localHandles: [(expression: String, bindTo: String)] = []
                var paramStrings: [String] = []
                if !method.isStatic {
                    localHandles.append(("self", "_selfHandle"))
                    paramStrings.append("_selfHandle")
                }

                // Keep the parameters in original order here, because the swift-side expects them in that order
                for param in method.parameters {
                    if param.type.static.isPrimitive {
                        paramStrings.append("\(PythonClass2.deforbidify(param.name, localVar: true))")
                    } else {
                        localHandles.append((PythonClass2.deforbidify(param.name, localVar: true), "_\(param.name)Handle"))
                        paramStrings.append("_\(param.name)Handle")
                    }
                }

                var wrap: (() -> Void) -> Void = { $0() }
                if !localHandles.isEmpty {
                    wrap = { innerWriter in
                        fragment.outputBlock("\(PythonClass2.withLocalHandles(localHandles)):") {
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

extension PythonClass2.PythonType: CustomStringConvertible {
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
            static: .named(module: nil, namespaces: [], name: "None"),
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

    static var object: Self {
        .class(module: nil, qualifiedName: "object")
    }

    static func optional(_ wrapped: Self) -> Self {
        .union(wrapped, .none)
    }

    static var TODO: Self {
        .class(module: nil, qualifiedName: "TODO")
    }

    static func future(_ inner: Self) -> Self {
        .class(module: "fishyjoes_runtime", qualifiedName: "Future", genericArgs: [inner.static])
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

    var description: String {
        "FIXME: You should not use this, you should use one of the representations below. \(self.static.name())"
    }

    var dynamicsString: String {
        let options = dynamics.map { dyn in
            (dyn.module.asArray + dyn.namespaces + [dyn.name]).joined(separator: ".")
        }
        return options.joined(separator: ", ")
    }
}

extension PythonClass2.PythonType.Static {
    var namespaces: [String] {
        switch self {
        case .primitive, .callable, .union:
            return []
        case .named(_, let namespaces, _, _):
            return namespaces
        }
    }

    func name(in pythonClass: PythonClass2? = nil) -> String {
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

    var ffiOutCreatedName: String {
        isPrimitive ? "fishyjoes_runtime.Pointer" : "fishyjoes_runtime.OutCreatedRef"
    }

    var ffiConsumedName: String {
        isPrimitive ? name() : "fishyjoes_runtime.ConsumedRef"
    }

    var ffiCreatedName: String {
        isPrimitive ? name() : "fishyjoes_runtime.CreatedRef"
    }

    var ffiUnownedName: String {
        isPrimitive ? name(): "fishyjoes_runtime.UnownedRef"
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

    var baseName: String? {
        switch self {
        case .primitive(let name): return name
        case .named(_, _, let name, _): return name
        case .callable: return "Callable"
        case .union: return "Union"
        }
    }

    // NOTE: these are a bit weird types, since they're not user-visible. Only useful in limited internal places.
    static var unownedHostRef: Self {
        .named(module: "fishyjoes_runtime", namespaces: [], name: "UnownedRef")
    }
    static var createdHostRef: Self {
        .named(module: "fishyjoes_runtime", namespaces: [], name: "CreatedRef")
    }
    static var outCreatedHostRef: Self {
        .named(module: "fishyjoes_runtime", namespaces: [], name: "OutCreatedRef")
    }
    static var consumedSwiftRef: Self {
        .named(module: "fishyjoes_runtime", namespaces: [], name: "ConsumedSwiftRef")
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

extension PythonClass2 {
    func ffiFor(fields: [Variable], fragment: SourceFragment) {
        for field in fields {
            let isPrimitive = field.type.static.isPrimitive
            let fieldName = "\(field.hiddenStorage ? "_" : "")\(PythonClass2.deforbidify(field.name, localVar: false))"

            fragment.output("@fishyjoes_runtime.callback('TODO[getter_type]')")
            fragment.output("@fishyjoes_runtime.catch_by_out_ref(default=\(field.type.static.ffiDefault))")
            let getParameters = field.isStatic ? "" : "obj: fishyjoes_runtime.UnownedRef"
            fragment.outputBlock("def _ffi_get_\(field.name)(\(getParameters)) -> \(field.type.static.ffiCreatedName):") {
                let body: String
                    if field.isStatic {
                        body = "\(unqualifiedName).\(fieldName)"
                    } else {
                        body = "fishyjoes_runtime.peek_ref(obj, \(unqualifiedName)).\(fieldName)"
                    }
                if isPrimitive {
                    fragment.output("return \(body)")
                } else {
                    fragment.output("return fishyjoes_runtime.create_ref(\(body))")
                }
            }
            if field.isMutable {
                fragment.output("@fishyjoes_runtime.callback('TODO[setter_type]')")
                fragment.output("@fishyjoes_runtime.catch_by_out_ref(default=None)")
                let setParameters = (field.isStatic ? "" : "obj: fishyjoes_runtime.UnownedRef, ") +
                    "newValue: \(field.type.static.ffiConsumedName)"
                fragment.outputBlock("def _ffi_set_\(field.name)(\(setParameters)):") {
                    if field.isStatic {
                        fragment.output("\(unqualifiedName).\(fieldName) = ", newLineTerminated: false)
                    } else {
                        fragment.output("fishyjoes_runtime.peek_ref(obj, \(unqualifiedName)).\(fieldName) = ", newLineTerminated: false)
                    }
                    if isPrimitive {
                        fragment.output("newValue")
                    } else {
                        fragment.output("fishyjoes_runtime.consume_ref(newValue, \(field.type.dynamicsString))")
                    }
                }
                fragment.blankLine()
            }
        }
    }

    func ffiFor(methods: [Method], fragment: SourceFragment) {
        for method in methods {
            if method.isStatic {
                continue
            }
            fragment.outputBlock("static \(method.returnType.static.ffiCreatedName) ffi_\(method.name)(", newLineTerminated: false) {
                fragment.output("UnownedRef obj,")
                for param in method.parameters {
                    fragment.output("\(param.type.static.ffiUnownedName) \(PythonClass2.deforbidify(param.name, localVar: true)),")
                }
                fragment.output("fishyjoes_runtime.OutCreatedRef exn")
            }
            var wrapper: (() -> Void) -> Void
            if method.returnType.static.isPrimitive {
                wrapper = { body in
                    let defaultValue = method.returnType.static.ffiDefault.map { " ?? \($0)" }
                    fragment.outputBlock("catching(exn, () =>", closeWith: ")\(defaultValue)") {
                        body()
                    }
                }
            } else {
                wrapper = { body in
                    fragment.outputBlock("catchingRef(exn, () =>", closeWith: ")") {
                        fragment.outputBlock("createRef(") {
                            body()
                        }
                    }
                }
            }

            fragment.output(" => ", newLineTerminated: false)
            wrapper {
                let methodCall: String
                if method.isStatic {
                    methodCall = "\(unqualifiedName).\(method.name)"
                } else {
                    methodCall = "fishyjoes_runtime.peek_ref(obj, \(unqualifiedName)).\(method.name)"
                }
                fragment.outputBlock("\(methodCall)(", closeWith: ")") {
                    // put all optional parameters at the end, or python gets unhappy
                    let requiredParams = method.parameters.filter { $0.defaultValue == nil }
                    let optionalParams = method.parameters.filter { $0.defaultValue != nil }
                    fragment.outputMap(requiredParams, separator: ",", newLineTerminated: false) {
                        if $0.type.static.isPrimitive {
                            return PythonClass2.deforbidify($0.name, localVar: true)
                        } else {
                            return "fishyjoes_runtime.peek_ref(\(PythonClass2.deforbidify($0.name, localVar: true)))"
                        }
                    }
                    if !optionalParams.isEmpty {
                        if !requiredParams.isEmpty {
                            fragment.output(",")
                        }
                        fragment.outputMap(optionalParams, separator: ",") {
                            if $0.type.static.isPrimitive {
                                return "\(PythonClass2.deforbidify($0.name, localVar: true)): \(PythonClass2.deforbidify($0.name, localVar: true))"
                            } else {
                                return "\(PythonClass2.deforbidify($0.name, localVar: true)): fishyjoes_runtime.consume_ref(\(PythonClass2.deforbidify($0.name, localVar: true)), \($0.type.dynamicsString))"
                            }
                        }
                    } else {
                        fragment.blankLine()
                    }
                }
            }
            fragment.blankLine()
        }
    }

    func declareSupers(_ superclasses: [String]) -> String {
        if superclasses.isEmpty {
            return ""
        } else {
            return "(\(superclasses.joined(separator: ", ")))"
        }
    }

    static func separate(fieldsAndMethods: [PythonClass2.MethodOrVariable]) -> ([PythonClass2.Variable], [PythonClass2.Method]) {
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
}
