/// Print out DartClasses given inputs from Swift
///
/// The purpose of DartClass is to be a pretty printer. Logic that could be extracted elsewhere perhaps should be
class DartClass {
    enum DartType: Hashable, Codable {
        case void
        case utf16Pointer
        case primitive(String, ffiName: String)
        case named(package: String?, name: String, genericArgs: [DartType]? = nil)
        indirect case function(args: [DartType], return: DartType)
        indirect case optional(DartType)

        static var string: DartType {
            .primitive("string", ffiName: "STRING_NOT_DIRECTLY_USABLE_FROM_FFI")
        }
    }

    enum MethodOrVariable {
        case method(Method)
        case variable(Variable)
    }

    struct Method {
        typealias Parameter = (labelComment: String?, name: String, type: DartType, defaultValue: String?)

        let documentation: [String]
        let isStatic: Bool
        let name: String
        let mangledName: String
        let parameters: [Parameter]
        let returnType: DartType
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
        let type: DartType
        let deprecation: Deprecation?
        let isDefaultImplementation: Bool

        var hiddenStorage: Bool {
            isMutable && !isPubliclyWritable
        }
    }

    struct SetupTypes {
        let typedefs: [String: DartType]
        let setupArguments: [(DartType, String)]
    }

    let module: Module
    let documentation: [String]
    let name: String
    let setupTypes: SetupTypes?
    let fields: [Variable]
    let methods: [Method]
    let conformances: [DartType]

    init(
        module: Module,
        documentation: [String],
        name: String,
        setupTypes: SetupTypes? = nil,
        fields: [Variable],
        methods: [Method],
        conformances: Set<DartType>
    ) {
        self.name = name
        self.documentation = documentation
        self.module = module
        self.setupTypes = setupTypes
        self.fields = fields
        self.methods = methods
        self.conformances = Array(conformances).sorted(by: { $0.name() < $1.name() })
    }

    func commonIgnoreSpecificWarnings(fragment: SourceFragment) {
        fragment.output("// ignore_for_file: unused_import")
        fragment.output("// ignore_for_file: non_constant_identifier_names")
        fragment.output("// ignore_for_file: no_leading_underscores_for_local_identifiers")
        fragment.output("// ignore_for_file: library_prefixes")
        fragment.output("// ignore_for_file: file_names")
        fragment.output("// ignore_for_file: annotate_overrides")
        fragment.blankLine()
    }

    func output(to fragment: SourceFragment) {
        fatalErr("This method must be overridden and call `outputInner`")
    }

    func fragment(context: FishyJoesContext) -> SourceFragment {
        let fragment = context.dartFragment("\(unqualifiedName).dart")

        for (name, type) in setupTypes?.typedefs ?? [:] {
            fragment.output("typedef \(name) = \(type.name());")
        }

        output(to: fragment)
        return fragment
    }

    func document(_ documentation: [String], fragment: SourceFragment) {
        guard !documentation.isEmpty else { return }
        for line in documentation {
            fragment.output("/// \(line)")
        }
    }

    var unqualifiedName: String {
        String(name.split(separator: ".").last!)
    }

    var nativeMethods: [String: (args: [(String, DartType)], return: DartType, isDefaultImplementation: Bool, isProtocol: Bool)] {
        var result: [String: (args: [(String, DartType)], return: DartType, isDefaultImplementation: Bool, isProtocol: Bool)] = [:]

        let thisArg = ("_this", DartType.named(package: module.dartNamespace, name: name))

        for field in fields {
            let baseArgs = field.isStatic ? [] : [thisArg]

            let resultName = field.isDefaultImplementation ? "__iota__default_\(field.mangledName)" : "__iota_get_\(field.mangledName)"
            result[resultName] = (args: baseArgs, return: field.type, isDefaultImplementation: field.isDefaultImplementation, isProtocol: false)
            if field.isPubliclyWritable {
                result["__iota_set_\(field.mangledName)"] = (args: baseArgs + [(field.name, field.type)], return: .void, isDefaultImplementation: false, isProtocol: false)
            }
        }

        for method in methods {
            if method.body != nil { continue }

            var params = method.isStatic ? [] : [thisArg]

            // Keep the parameters in original order here, because the swift-side expects them in that order
            for param in method.parameters {
                params.append((DartClass.deforbidify(param.name), param.type))
            }

            result["__iota_\(method.mangledName)"] = (args: params, return: method.returnType, isDefaultImplementation: method.isDefaultImplementation, isProtocol: false)
        }

        return result
    }

    func outputNativeMethodDeclarations(methods: [String: (args: [(String, DartType)], return: DartType, isDefaultImplementation: Bool, isProtocol: Bool)], fragment: SourceFragment) {
        for (name, (args, returnType, _, _)) in methods.sorted(by: { $0.key < $1.key}) {
            fragment.outputBlock("static late \(returnType.ffiCreatedName) Function(", closeWith: ") f\(name);") {
                fragment.output("Env env,")
                for (argName, argType) in args {
                    fragment.output("\(argType.ffiUnownedName) \(argName),")
                }
                fragment.output("OutCreatedRef _exn")
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
                    if field.type.isObject {
                        fragment.output("consumeCreatedRef<\(field.type.name(in: self))>(\(fieldFuncName)(Loader.shared.env, \(selfArg)exn))")
                    } else {
                        fragment.output("\(fieldFuncName)(Loader.shared.env, \(selfArg)exn)")
                    }
                }
            }
        }

        func outputSetterBody() {
            let valueValue: String
            var wrap = wrap
            if field.type.isObject {
                let oldWrap = wrap
                wrap = { body in
                    oldWrap {
                        fragment.outputBlock("GCRef.using(value, (_valueHandle) =>", closeWith: ")", body)
                    }
                }
                valueValue = "_valueHandle.ptr"
            } else {
                valueValue = "value"
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
        fragment.outputBlock("\(staticMark)\(field.type.name(in: self)) get \(DartClass.deforbidify(field.name)) =>", closeWith: ";") {
            outputGetterBody()
        }
        if field.isPubliclyWritable {
            outputAttributes()
            fragment.outputBlock("\(staticMark)void set \(DartClass.deforbidify(field.name))(\(field.type.name(in: self)) value) {") {
                outputSetterBody()
                fragment.output(";")
            }
        }
    }

    func output(method: Method, to fragment: SourceFragment) {
        if !method.name.hasPrefix("_") {
            document(method.documentation, fragment: fragment)
            if let deprecation = method.deprecation {
                fragment.output("@Deprecated(\"\(deprecation.quotedMessage)\")")
            }
            fragment.output("\(method.isStatic ? "static " : "")", newLineTerminated: false)
            fragment.outputBlock("\(method.returnType.name(in: self)) \(method.name)(", newLineTerminated: false) {
                func outputParameter(parameter: Method.Parameter) {
                    let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
                    let defaultValue = parameter.defaultValue.map { " = \($0)" } ?? ""
                    fragment.output("\(parameter.type.name(in: self)) \(labelComment)\(DartClass.deforbidify(parameter.name))\(defaultValue),")
                }

                // put all optional parameters at the end, or dart gets unhappy
                let requiredParams = method.parameters.filter { $0.defaultValue == nil }
                let optionalParams = method.parameters.filter { $0.defaultValue != nil }

                requiredParams.forEach(outputParameter)
                if !optionalParams.isEmpty {
                    fragment.outputBlock("{") {
                        optionalParams.forEach(outputParameter)
                    }
                }
            }
            fragment.outputBlock(" =>", closeWith: ";") {
                if let body = method.body {
                    body.forEach { fragment.output($0) }
                } else {
                    var wrap: (() -> Void) -> Void = { body in
                        if !method.isStatic {
                            fragment.outputBlock("GCRef.using(this, (_thisHandle) =>", closeWith: ")", body)
                        } else {
                            body()
                        }
                    }

                    var paramStrings: [String] = method.isStatic ? [] : ["_thisHandle.ptr"]
                    // Keep the parameters in original order here, because the swift-side expects them in that order
                    for param in method.parameters {
                        if param.type.isObject {
                            let oldWrap = wrap
                            wrap = { body in
                                oldWrap {
                                    fragment.outputBlock("GCRef.using(\(DartClass.deforbidify(param.name)), (_\(param.name)Handle) =>", closeWith: ")", body)
                                }
                            }
                            paramStrings.append("_\(param.name)Handle.ptr")
                        } else {
                            paramStrings.append("\(DartClass.deforbidify(param.name))")
                        }
                    }
                    paramStrings.append("_exn")

                    let body = "check((OutCreatedRef _exn) => f__iota_\(method.mangledName)(Loader.shared.env, \(paramStrings.joined(separator: ", "))))"
                    wrap {
                        if method.returnType.isObject {
                            fragment.output("consumeCreatedRef<\(method.returnType.name(in: self))>(\(body))")
                        } else {
                            fragment.output(body)
                        }
                    }
                }
            }
        }
        fragment.blankLine()
    }
}

extension DartClass.DartType: CustomStringConvertible {
    static var object: Self {
        .named(package: nil, name: "object")
    }

    static func future(_ inner: DartClass.DartType) -> DartClass.DartType {
        .named(package: nil, name: "Future", genericArgs: [inner])
    }

    static func result(_ success: DartClass.DartType, _ failure: DartClass.DartType) -> DartClass.DartType {
        .named(package: nil, name: "Result", genericArgs: [success, failure])
    }

    var description: String {
        "FIXME: You should not use this, you should use one of the representations below. \(name())"
    }

    func name(in dartClass: DartClass? = nil) -> String {
        switch self {
        case .void: return "void"
        case .utf16Pointer: return "ffi.Pointer<package_ffi.Utf16>"
        case let .named(package, name, genericArgs):
            var result = (package.map { "\($0)." } ?? "") + name
            if let genericArgs = genericArgs {
                result.append("<\(genericArgs.map { $0.name(in: dartClass) }.joined(separator: ", "))>")
            }
            return result
        case let .primitive(name, _): return name
        case let .function(args, returnType):
            let argNames = args.map { $0.name(in: dartClass) }
            return "\(returnType.name(in: dartClass)) Function(\(argNames.joined(separator: ", ")))"
        case let .optional(wrapped): return "\(wrapped.name(in: dartClass))?"
        }
    }

    var ffiTag: String {
        switch self {
        case .void: return "ffi.Void"
        case .utf16Pointer: return "ffi.Pointer<package_ffi.Utf16>"
        case let .primitive(_, ffiName): return "ffi.\(ffiName)"
        case let .function(args, returnType):
            return "\(returnType.ffiTag) Function(\(args.map { $0.ffiTag }.joined(separator: ", ")))"
        default:
            return "ffi.Pointer"
        }
    }

    var defaultReturnValue: String? {
        switch self {
        case .primitive("bool", _): return "false"
        case .primitive("int", _): return "0"
        case .primitive("double", _): return "0.0"
        default: return nil
        }
    }

    var ffiOutCreatedName: String {
        isObject ? "OutCreatedRef" : "ffi.Pointer<\(ffiTag)>"
    }

    var ffiConsumedName: String {
        isObject ? "ConsumedRef" : name()
    }

    var ffiCreatedName: String {
        isObject ? "CreatedRef" : name()
    }

    var ffiUnownedName: String {
        isObject ? "UnownedRef" : name()
    }

    var ffiOutCreatedTag: String {
        isObject ? "OutCreatedRef" : "ffi.Pointer<\(ffiTag)>"
    }

    var ffiConsumedTag: String {
        isObject ? "ConsumedRef" : ffiTag
    }

    var ffiCreatedTag: String {
        isObject ? "CreatedRef" : ffiTag
    }

    var ffiUnownedTag: String {
        isObject ? "UnownedRef" : ffiTag
    }

    var package: String? {
        switch self {
        case .named(let package, _, _):
            return package
        default:
            return nil
        }
    }

    var isObject: Bool {
        switch self {
        case .named, .optional, .primitive("string", _), .function: return true
        default: return false
        }
    }
}

extension DartClass {
    func ffiFor(fields: [Variable], fragment: SourceFragment, isReference: Bool) {
        for field in fields {
            let isObject = field.type.isObject

            fragment.outputBlock("static \(field.type.ffiCreatedName) ffi_get_\(field.name)(", newLineTerminated: false) {
                fragment.output("UnownedRef obj,")
                fragment.output("OutCreatedRef exn")
            }
            var wrapper: (() -> Void) -> Void
            if isObject {
                wrapper = { body in
                    fragment.outputBlock("catchingRef(exn, () =>", closeWith: ");") {
                        fragment.outputBlock("createRef(") {
                            body()
                        }
                    }
                }
            } else {
                wrapper = { body in
                    let defaultValue = field.type.defaultReturnValue.map { " ?? \($0)" } ?? ""
                    fragment.outputBlock("catching(exn, () =>", closeWith: ")\(defaultValue);") {
                        body()
                    }
                }
            }

            fragment.output(" => ", newLineTerminated: false)
            wrapper {
                if field.isStatic {
                    fragment.output("\(unqualifiedName).\(DartClass.deforbidify(field.name))")
                } else {
                    fragment.output("peekRef<\(unqualifiedName)>(obj).\(DartClass.deforbidify(field.name))")
                }
            }
            if !isReference,
                field.isMutable {
                fragment.outputBlock("static void ffi_set_\(field.name)(", newLineTerminated: false) {
                    fragment.output("UnownedRef obj,")
                    fragment.output("\(field.type.ffiConsumedName) newValue,")
                    fragment.output("OutCreatedRef exn")
                }
                fragment.outputBlock(" => catching(exn, () {", closeWith: "});") {
                    if field.isStatic {
                        fragment.output("\(unqualifiedName).\(DartClass.deforbidify(field.name)) = ", newLineTerminated: false)
                    } else {
                        fragment.output("peekRef<\(unqualifiedName)>(obj).\(field.hiddenStorage ? "_" : "")\(DartClass.deforbidify(field.name)) = ", newLineTerminated: false)
                    }
                    if isObject {
                        fragment.output("consumeRef<\(field.type.name(in: self))>(newValue);")
                    } else {
                        fragment.output("newValue;")
                    }
                }
            }
            fragment.blankLine()
        }
    }

    func ffiFor(methods: [Method], fragment: SourceFragment) {
        for method in methods {
            guard !method.documentation.isEmpty else {
                continue
            }
            guard !method.isStatic else {
                continue
            }
            fragment.outputBlock("static \(method.returnType.ffiCreatedName) ffi_\(method.name)(", newLineTerminated: false) {
                fragment.output("UnownedRef obj,")
                for param in method.parameters {
                    fragment.output("\(param.type.ffiUnownedName) \(DartClass.deforbidify(param.name)),")
                }
                fragment.output("OutCreatedRef exn")
            }
            var wrapper: (() -> Void) -> Void
            if method.returnType.isObject {
                wrapper = { body in
                    fragment.outputBlock("catchingRef(exn, () =>", closeWith: ");") {
                        fragment.outputBlock("createRef(") {
                            body()
                        }
                    }
                }
            } else {
                wrapper = { body in
                    let defaultValue = method.returnType.defaultReturnValue.map { " ?? \($0)" } ?? ""
                    fragment.outputBlock("catching(exn, () =>", closeWith: ")\(defaultValue);") {
                        body()
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
                    // put all optional parameters at the end, or dart gets unhappy
                    let requiredParams = method.parameters.filter { $0.defaultValue == nil }
                    let optionalParams = method.parameters.filter { $0.defaultValue != nil }
                    fragment.outputMap(requiredParams, separator: ",", newLineTerminated: false) {
                        if $0.type.isObject {
                            return "peekRef(\(DartClass.deforbidify($0.name)))"
                        } else {
                            return DartClass.deforbidify($0.name)
                        }
                    }
                    if !optionalParams.isEmpty {
                        if !requiredParams.isEmpty {
                            fragment.output(",")
                        }
                        fragment.outputMap(optionalParams, separator: ",") {
                            if $0.type.isObject {
                                return "\(DartClass.deforbidify($0.name)): consumeRef(\(DartClass.deforbidify($0.name)))"
                            } else {
                                return "\(DartClass.deforbidify($0.name)): \(DartClass.deforbidify($0.name))"
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
}

extension DartClass {
    static func separate(fieldsAndMethods: [DartClass.MethodOrVariable]) -> ([DartClass.Variable], [DartClass.Method]) {
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

extension DartClass {
    private static var forbiddenVarNames: Set<String> = [
        "else",
        "enum",
        "in",
        "assert",
        "super",
        "extends",
        "is",
        "switch",
        "await",
        "this",
        "break",
        "throw",
        "case",
        "false",
        "new",
        "true",
        "catch",
        "final",
        "null",
        "try",
        "class",
        "const",
        "finally",
        "var",
        "continue",
        "for",
        "void",
        "when",
        "default",
        "rethrow",
        "while",
        "return",
        "with",
        "do",
        "if",
        "yield",
    ]

    static func deforbidify(_ name: String) -> String {
        var name = forbiddenVarNames.contains(name) ? "_\(name)" : name
        // leading underscores have semantic meaning in dart, avoid them.
        if name.hasPrefix("_") {
            name = "m\(name)" // This is far from ideal...
        }
        return name
    }
}
