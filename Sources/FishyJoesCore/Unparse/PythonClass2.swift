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
            case named(module: String?, name: String, genericArgs: [Static]? = nil)
            indirect case union(_ lhs: Static, _ rhs: Static)
        }


        struct Dynamic: Hashable, Codable {
            let module: String?
            let name: String

            static var object: Dynamic {
                Dynamic(module: nil, name: "object")
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
    let name: String
    let setupTypes: SetupTypes?
    let fields: [Variable]
    let methods: [Method]
    let conformances: [PythonType]

    init(
        module: Module,
        documentation: [String],
        name: String,
        setupTypes: SetupTypes? = nil,
        fields: [Variable],
        methods: [Method],
        conformances: Set<PythonType>
    ) {
        self.name = name
        self.documentation = documentation
        self.module = module
        self.setupTypes = setupTypes
        self.fields = fields
        self.methods = methods
        self.conformances = Array(conformances).sorted(by: { $0.static.name() < $1.static.name() })
    }

    func publicFragments(context: FishyJoesContext) -> [SourceFragment] { [] }

    func outputCAPIs(to fragment: SourceFragment) {
        for (name, type) in setupTypes?.typedefs ?? [:] {
            fragment.output(" \(name): TypeAlias = \(type.static.name())")
        }
    }

    func outputCCallbackImplementations(to fragment: SourceFragment) {}

    func outputSetup(to fragment: SourceFragment) {}

    func fragments(context: FishyJoesContext) -> [SourceFragment] {
        let publicFragments = publicFragments(context: context)
        let implementationFragment = context.pythonFragment("\(unqualifiedName).implementation.py")

        implementationFragment.output("# MARK: C APIs")
        implementationFragment.output()
        outputCAPIs(to: implementationFragment)

        implementationFragment.output("# MARK: C callback implementations")
        implementationFragment.output()
        outputCCallbackImplementations(to: implementationFragment)

        implementationFragment.output("# MARK: setup")
        implementationFragment.output()
        outputSetup(to: implementationFragment)

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

    var nativeMethods: [String: (args: [(String, PythonType)], return: PythonType, isDefaultImplementation: Bool, isProtocol: Bool)] {
        var result: [String: (args: [(String, PythonType)], return: PythonType, isDefaultImplementation: Bool, isProtocol: Bool)] = [:]

        let thisArg = ("_this", PythonType.class(module: module.pythonPackageName, name: name))

        for field in fields {
            let baseArgs = field.isStatic ? [] : [thisArg]

            let resultName = field.isDefaultImplementation ? "__iota__default_\(field.mangledName)" : "__iota_get_\(field.mangledName)"
            result[resultName] = (args: baseArgs, return: field.type, isDefaultImplementation: field.isDefaultImplementation, isProtocol: false)
            if field.isPubliclyWritable {
                result["__iota_set_\(field.mangledName)"] = (args: baseArgs + [(field.name, field.type)], return: .none, isDefaultImplementation: false, isProtocol: false)
            }
        }

        for method in methods {
            if method.body != nil { continue }

            var params = method.isStatic ? [] : [thisArg]

            // Keep the parameters in original order here, because the swift-side expects them in that order
            for param in method.parameters {
                params.append((PythonClass2.deforbidify(param.name), param.type))
            }

            result["__iota_\(method.mangledName)"] = (args: params, return: method.returnType, isDefaultImplementation: method.isDefaultImplementation, isProtocol: false)
        }

        return result
    }

    func outputNativeMethodDeclarations(methods: [String: (args: [(String, PythonType)], return: PythonType, isDefaultImplementation: Bool, isProtocol: Bool)], fragment: SourceFragment) {
        for (name, (args, returnType, _, _)) in methods.sorted(by: { $0.key < $1.key}) {
            fragment.outputBlock("\(name): Callable[[", newLineTerminated: false) {
                fragment.output("fishyjoes_runtime.EnvRef,")
                for (_, argType) in args {
                    fragment.output("\(argType.static.ffiUnownedName),")
                }
                fragment.output("OutCreatedRef")
            }
            fragment.outputBlock(", \(returnType.static.ffiCreatedName)] = \\", closeWith: "") {
                fragment.output("getattr(_\(module.pythonPackageName)_lib, \"TODO\")")
            }
        }
    }

    func output(field: Variable, to fragment: SourceFragment) {
        document(field.documentation, fragment: fragment)
        let selfArg = field.isStatic ? "" : "_thisHandle.ptr, "
        let wrap: (() -> Void) -> Void = { body in
            if !field.isStatic {
                fragment.outputBlock("GCRef.using(this, (_thisHandle) =>", closeWith: ")", body)
            } else {
                body()
            }
        }

        func outputGetterBody() {
            wrap {
                fragment.outputBlock("check((exn) =>", closeWith: ")") {
                    let fieldFuncName = field.isDefaultImplementation ? "f__iota__default_\(field.mangledName)" : "f__iota_get_\(field.mangledName)"
                    if field.type.static.isPrimitive {
                        fragment.output("\(fieldFuncName)(Loader.shared.env, \(selfArg)exn)")
                    } else {
                        fragment.output("consumeCreatedRef<\(field.type.static.name(in: self))>(\(fieldFuncName)(Loader.shared.env, \(selfArg)exn))")
                    }
                }
            }
        }

        func outputSetterBody() {
            let valueValue: String
            var wrap = wrap
            if field.type.static.isPrimitive {
                valueValue = "value"
            } else {
                let oldWrap = wrap
                wrap = { body in
                    oldWrap {
                        fragment.outputBlock("GCRef.using(value, (_valueHandle) =>", closeWith: ")", body)
                    }
                }
                valueValue = "_valueHandle.ptr"
            }
            wrap {
                fragment.outputBlock("check((exn) =>", closeWith: ")") {
                    fragment.output("f__iota_set_\(field.mangledName)(Loader.shared.env, \(selfArg)\(valueValue), exn)")
                }
            }
        }

        func outputAttributes() {
            if let deprecation = field.deprecation {
                fragment.output("@Deprecated(\"\(deprecation.quotedMessage)\")")
            }
        }

        outputAttributes()
        let staticMark = field.isStatic ? "static " : ""
        fragment.outputBlock("\(staticMark)\(field.type.static.name(in: self)) get \(PythonClass2.deforbidify(field.name)) =>", closeWith: "") {
            outputGetterBody()
        }
        if field.isPubliclyWritable {
            outputAttributes()
            fragment.outputBlock("\(staticMark)void set \(PythonClass2.deforbidify(field.name))(\(field.type.static.name(in: self)) value) {") {
                outputSetterBody()
            }
        }
    }

    func output(method: Method, to fragment: SourceFragment) {
        if method.name.hasPrefix("_") { return }

        if let deprecation = method.deprecation {
            fragment.output("@deprecated(\"\(deprecation.quotedMessage)\")")
        }
        if method.isStatic {
            fragment.output("@staticmethod")
        }
        fragment.outputBlock("def \(method.name)(", newLineTerminated: false) {
            func outputParameter(parameter: Method.Parameter) {
                let defaultValue = parameter.defaultValue.map { " = \($0)" } ?? ""
                fragment.output("\(PythonClass2.deforbidify(parameter.name)): \(parameter.type.static.name(in: self))\(defaultValue),")
            }

            // put all optional parameters at the end, or python gets unhappy
            let requiredParams = method.parameters.filter { $0.defaultValue == nil }
            let optionalParams = method.parameters.filter { $0.defaultValue != nil }

            requiredParams.forEach(outputParameter)
            if !optionalParams.isEmpty {
                fragment.outputBlock("{") {
                    optionalParams.forEach(outputParameter)
                }
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
                    paramStrings.append("_selfHandle.ptr")
                }

                // Keep the parameters in original order here, because the swift-side expects them in that order
                for param in method.parameters {
                    if param.type.static.isPrimitive {
                        paramStrings.append("\(PythonClass2.deforbidify(param.name))")
                    } else {
                        localHandles.append((PythonClass2.deforbidify(param.name), "_\(param.name)Handle"))
                        paramStrings.append("_\(param.name)Handle.ptr")
                    }
                }

                var wrap: (() -> Void) -> Void = { $0() }
                if !localHandles.isEmpty {
                    wrap = { innerWriter in
                        let expressions = localHandles.map(\.expression).joined(separator: ", ")
                        let binds = localHandles.map(\.bindTo).joined(separator: ", ")
                        fragment.outputBlock("with fishyjoes_runtime.local_handles(\(expressions)) as (\(binds)):") {
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
                            fragment.outputBlock("return consume_created_ref(") {
                                innerWriter()
                                fragment.output(",")
                                fragment.output("\(method.returnType.dynamicsString)")
                            }
                        }
                    }
                }

                wrap {
                    fragment.outputBlock("fishyjoes_runtime.raise_by_out_ref(f__iota_\(method.mangledName))(", newLineTerminated: false) {
                        fragment.output("Loader.shared.env,")
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
    static func `class`(module: String?, name: String, genericArgs: [Static]? = nil) -> Self {
        .init(
            static: .named(module: module, name: name, genericArgs: genericArgs),
            dynamics: [.init(module: module, name: name)]
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
            static: .named(module: nil, name: "None"),
            dynamics: [.init(module: "types", name: "NoneType")]
        )
    }

    static var int: Self {
        .init(
            static: .primitive(name: "int"),
            dynamics: [.init(module: nil, name: "int")]
        )
    }

    static var bool: Self {
        .init(
            static: .primitive(name: "bool"),
            dynamics: [.init(module: nil, name: "bool")]
        )
    }

    static var object: Self {
        .class(module: nil, name: "object")
    }

    static func optional(_ wrapped: Self) -> Self {
        .union(wrapped, .none)
    }

    static func future(_ inner: Self) -> Self {
        .class(module: "fishyjoes_runtime", name: "Future", genericArgs: [inner.static])
    }

    static func result(_ success: Self, _ failure: Self) -> Self {
        .init(
            static: .named(module: "fishyjoes_runtime", name: "Result", genericArgs: [success.static, failure.static]),
            dynamics: [
                .init(module: "fishyjoes_runtime", name: "ResultSuccess"),
                .init(module: "fishyjoes_runtime", name: "ResultFailure"),
            ]
        )
    }

    static func callable(args: [Static], return: Static) -> Self {
        .init(
            static: .callable(args: args, return: `return`),
            dynamics: [.object] // Any dynamic value may be callable
        )
    }

    var description: String {
        "FIXME: You should not use this, you should use one of the representations below. \(self.static.name())"
    }

    var dynamicsString: String {
        let options = dynamics.map { dyn in
            if let module = dyn.module {
                "\(module).\(dyn.name)"
            } else {
                dyn.name
            }
        }
        return options.joined(separator: ", ")
    }
}

extension PythonClass2.PythonType.Static {
    func name(in pythonClass: PythonClass2? = nil) -> String {
        switch self {
        case .primitive(let name):
            return name
        case .callable(let args, let ret):
            let argNames = args.map { $0.name(in: pythonClass) }
            let retName = ret.name(in: pythonClass)
            return "typing.Callable[[\(argNames.joined(separator: ", "))], \(retName)]"
        case .named(let module, let name, let genericArgs):
            var result = (module.map { "\($0)." } ?? "") + name
            if let genericArgs = genericArgs {
                result.append("[\(genericArgs.map { $0.name(in: pythonClass) }.joined(separator: ","))]")
            }
            return result
        case .union(let lhs, let rhs):
            return "\(lhs.name(in: pythonClass)) | \(rhs.name(in: pythonClass))"
        }
    }

    var ffiTag: String {
        "TODO[ffiTag]"
        // switch self {
        // case .void: return "ffi.Void"
        // case .utf16Pointer: return "ffi.Pointer<package_ffi.Utf16>"
        // case let .primitive(_, ffiName): return "ffi.\(ffiName)"
        // case let .function(args, returnType):
        //     return "\(returnType.ffiTag) Function(\(args.map { $0.ffiTag }.joined(separator: ", ")))"
        // default:
        //     return "ffi.Pointer"
        // }
    }

    var defaultReturnValue: String? {
        switch self {
        case .primitive("bool"): return "false"
        case .primitive("int"): return "0"
        case .primitive("float"): return "0.0"
        default: return "CreatedRef(ffi.NULL)"
        }
    }

    var ffiOutCreatedName: String {
        "TODO[ffiOutCreatedName]"
        // isObject ? "OutCreatedRef" : "ffi.Pointer<\(ffiTag)>"
    }

    var ffiConsumedName: String {
        "TODO[ffiConsumedName]"
        // isObject ? "ConsumedRef" : name()
    }

    var ffiCreatedName: String {
        "TODO[ffiCreatedName]"
        // isObject ? "CreatedRef" : name()
    }

    var ffiUnownedName: String {
        "TODO[ffiUnownedName]"
        // isObject ? "UnownedRef" : name()
    }

    var ffiOutCreatedTag: String {
        "TODO[ffiOutCreatedTag]"
        // isObject ? "OutCreatedRef" : "ffi.Pointer<\(ffiTag)>"
    }

    var ffiConsumedTag: String {
        "TODO[ffiConsumedTag]"
        // isObject ? "ConsumedRef" : ffiTag
    }

    var ffiCreatedTag: String {
        "TODO[ffiCreatedTag]"
        // isObject ? "CreatedRef" : ffiTag
    }

    var ffiUnownedTag: String {
        "TODO[ffiUnownedTag]"
        // isObject ? "UnownedRef" : ffiTag
    }

    var ffiDefault: String {
        "TODO[ffiDefault]"
    }

    var package: String? {
        switch self {
        case .named(let package, _, _):
            return package
        default:
            return nil
        }
    }

    // NOTE: these are a bit weird types, since they're not user-visible. Only useful in limited internal places.
    static var unownedHostRef: Self {
        .named(module: "fishyjoes_runtime", name: "UnownedHostRef")
    }
    static var createdHostRef: Self {
        .named(module: "fishyjoes_runtime", name: "CreatedHostRef")
    }
    static var outCreatedHostRef: Self {
        .named(module: "fishyjoes_runtime", name: "OutCreatedHostRef")
    }
    static var consumedSwiftRef: Self {
        .named(module: "fishyjoes_runtime", name: "ConsumedSwiftRef")
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
            let fieldName = "\(field.hiddenStorage ? "_" : "")\(PythonClass2.deforbidify(field.name))"

            fragment.output("@fishyjoes_runtime.callback('TODO[getter_type]')")
            fragment.output("@catch_by_out_ref(default=\(field.type.static.ffiDefault))")
            let getParameters = field.isStatic ? "" : "obj: UnownedHostRef"
            fragment.outputBlock("def _ffi_get_\(field.name)(\(getParameters)) -> \(field.type.static.ffiCreatedName):") {
                let body: String
                    if field.isStatic {
                        body = "\(unqualifiedName).\(fieldName)"
                    } else {
                        body = "peekRef(obj, \(unqualifiedName)).\(fieldName)"
                    }
                if isPrimitive {
                    fragment.output("return \(body)")
                } else {
                    fragment.output("return createRef(\(body))")
                }
            }
            if field.isMutable {
                fragment.output("@fishyjoes_runtime.callback('TODO[setter_type]')")
                fragment.output("@catch_by_out_ref(default=None)")
                let setParameters = (field.isStatic ? "" : "obj: UnownedHostRef, ") +
                    "newValue: \(field.type.static.ffiConsumedName)"
                fragment.outputBlock("def _ffi_set_\(field.name)(\(setParameters)):") {
                    if field.isStatic {
                        fragment.output("\(unqualifiedName).\(fieldName) = ", newLineTerminated: false)
                    } else {
                        fragment.output("peekRef(obj, \(unqualifiedName)).\(fieldName) = ", newLineTerminated: false)
                    }
                    if isPrimitive {
                        fragment.output("newValue")
                    } else {
                        fragment.output("consumeRef(newValue, \(field.type.dynamicsString))")
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
                    fragment.output("\(param.type.static.ffiUnownedName) \(PythonClass2.deforbidify(param.name)),")
                }
                fragment.output("OutCreatedRef exn")
            }
            var wrapper: (() -> Void) -> Void
            if method.returnType.static.isPrimitive {
                wrapper = { body in
                    let defaultValue = method.returnType.static.defaultReturnValue.map { " ?? \($0)" } ?? ""
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
                    methodCall = "peekRef<\(unqualifiedName)>(obj).\(method.name)"
                }
                fragment.outputBlock("\(methodCall)(", closeWith: ")") {
                    // put all optional parameters at the end, or python gets unhappy
                    let requiredParams = method.parameters.filter { $0.defaultValue == nil }
                    let optionalParams = method.parameters.filter { $0.defaultValue != nil }
                    fragment.outputMap(requiredParams, separator: ",", newLineTerminated: false) {
                        if $0.type.static.isPrimitive {
                            return PythonClass2.deforbidify($0.name)
                        } else {
                            return "peekRef(\(PythonClass2.deforbidify($0.name)))"
                        }
                    }
                    if !optionalParams.isEmpty {
                        if !requiredParams.isEmpty {
                            fragment.output(",")
                        }
                        fragment.outputMap(optionalParams, separator: ",") {
                            if $0.type.static.isPrimitive {
                                return "\(PythonClass2.deforbidify($0.name)): \(PythonClass2.deforbidify($0.name))"
                            } else {
                                return "\(PythonClass2.deforbidify($0.name)): consumeRef(\(PythonClass2.deforbidify($0.name)))"
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
}

extension PythonClass2 {
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
}

extension PythonClass2 {
    // python code to get this list:
    //     __import__('keyword').kwlist + __import__('keyword').softkwlist
    private static var forbiddenVarNames: Set<String> = [
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
        "type"
    ]

    static func deforbidify(_ name: String) -> String {
        var name = name.unescapedSwiftIdentifier
        name = forbiddenVarNames.contains(name) ? "\(name)_" : name
        // leading underscores have semantic meaning in python, move them to the end. (recommended by PEP-8)
        let firstNonUnderscore = name.firstIndex { $0 != "_" } ?? name.startIndex
        return String(name[firstNonUnderscore...] + name[..<firstNonUnderscore])
    }
}
