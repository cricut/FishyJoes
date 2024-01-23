class DartClass {
    enum DartType: Equatable, Codable {
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

    var hasFreezedPart: Bool { true }

    init(
        module: Module,
        documentation: [String],
        name: String,
        setupTypes: SetupTypes? = nil,
        fieldsAndMethods: [MethodOrVariable]
    ) {
        self.name = name
        self.documentation = documentation
        self.module = module
        self.setupTypes = setupTypes
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
    }

    func output(to fragment: SourceFragment) {
        fatalErr("This method must be overridden and call `outputInner`")
    }

    func fragment(context: FishyJoesContext) -> SourceFragment {
        let fragment = context.dartFragment("\(unqualifiedName).dart")

        if hasFreezedPart {
            fragment.output("part '\(unqualifiedName).freezed.dart';")
            fragment.blankLine()
        }

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

    var nativeMethods: [String: (args: [(String, DartType)], return: DartType)] {
        var result: [String: (args: [(String, DartType)], return: DartType)] = [:]

        let thisArg = ("_this", DartType.named(package: module.dartNamespace, name: name))

        for field in fields {
            let baseArgs = field.isStatic ? [] : [thisArg]
            result["__iota_get_\(field.mangledName)"] = (args: baseArgs, return: field.type)
            if field.isPubliclyWritable {
                result["__iota_set_\(field.mangledName)"] = (args: baseArgs + [(field.name, field.type)], return: .void)
            }
        }

        for method in methods {
            // if method.name.hasPrefix("_") { continue }
            if method.body != nil { continue }

            var params = method.isStatic ? [] : [thisArg]

            // Keep the parameters in original order here, because the swift-side expects them in that order
            for param in method.parameters {
                params.append((param.name, param.type))
            }
            result["__iota_\(method.mangledName)"] = (args: params, return: method.returnType)
        }

        return result
    }

    func outputNativeMethodDeclarations(to fragment: SourceFragment) {
        for (name, (args, returnType)) in nativeMethods.sorted(by: { $0.key < $1.key}) {
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
                    if field.type.isObject {
                        fragment.output("consumeCreatedRef<\(field.type.name(in: self))>(f__iota_get_\(field.mangledName)(Loader.shared.env, \(selfArg)exn))")
                    } else {
                        fragment.output("f__iota_get_\(field.mangledName)(Loader.shared.env, \(selfArg)exn)")
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
        fragment.outputBlock("\(staticMark)\(field.type.name(in: self)) get \(Self.deforbidify(field.name)) =>", closeWith: ";") {
            outputGetterBody()
        }
        if field.isPubliclyWritable {
            outputAttributes()
            fragment.outputBlock("\(staticMark)void set \(Self.deforbidify(field.name))(\(field.type.name(in: self)) value) {") {
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
            debug("what is ffiTag for `\(name())`?")
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

class DartProductClass: DartClass {
    struct Typealias {
        let name: String
        let value: DartType
    }

    enum Constructor: Equatable {
        case `public`(fields: [Variable])
        case reference
    }

    let constructor: Constructor

    init(
        module: Module,
        documentation: [String],
        name: String,
        constructor: Constructor,
        fieldsAndMethods: [MethodOrVariable]
    ) {
        self.constructor = constructor
        super.init(
            module: module,
            documentation: documentation,
            name: name,
            fieldsAndMethods: fieldsAndMethods
        )
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)

        switch constructor {
        case .reference:
            fragment.output("class \(unqualifiedName) extends SwiftReference", newLineTerminated: false)
        case .public:
            fragment.output("@Freezed(addImplicitFinal: false, makeCollectionsUnmodifiable: false)")
            fragment.output("class \(unqualifiedName) with _$\(unqualifiedName)", newLineTerminated: false)
        }
        fragment.outputBlock(" {") {
            switch constructor {
            case .reference:
                fragment.output("\(unqualifiedName)(ffi.Pointer reference): super(reference) {}")

                fragment.outputBlock("static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>", closeWith: ");") {
                    fragment.output("createRef(\(unqualifiedName)(ref))")
                }
            fragment.blankLine()
            case .public(let fields):
                fragment.outputBlock("factory \(unqualifiedName)({", closeWith: "})", newLineTerminated: false) {
                    fragment.outputMap(fields, separator: ",") { field in
                        "required \(field.isPubliclyWritable ? "" : "final ")\(field.type.name(in: self)) \(DartClass.deforbidify(field.name))"
                    }
                }
                fragment.output(" = _\(unqualifiedName);")
                fragment.blankLine()

                // Not sure why this is necessary, but freezed throws a "Getters require a MyClass._() constructor" sometimes
                fragment.output("\(unqualifiedName)._();")

                fragment.outputBlock("static CreatedRef ffi_constructor(", newLineTerminated: false) {
                    for field in fields {
                        fragment.output("\(field.type.ffiConsumedName) \(field.name),")
                    }
                    fragment.output("OutCreatedRef exn")
                }
                fragment.outputBlock(" => catchingRef(exn, () =>", closeWith: ");") {
                    fragment.outputBlock("createRef(\(unqualifiedName)(", closeWith: "))") {
                        for field in fields {
                            if field.type.isObject {
                                fragment.output("\(field.name): consumeRef(\(field.name)),")
                            } else {
                                fragment.output("\(field.name): \(field.name),")
                            }
                        }
                    }
                }

                for field in fields {
                    let isObject = field.type.isObject
                    fragment.blankLine()
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
                        fragment.output("peekRef<\(unqualifiedName)>(obj).\(field.name)")
                    }
                    if field.isPubliclyWritable {
                        fragment.outputBlock("static void ffi_set_\(field.name)(", newLineTerminated: false) {
                            fragment.output("UnownedRef obj,")
                            fragment.output("\(field.type.ffiConsumedName) newValue,")
                            fragment.output("OutCreatedRef exn")
                        }
                        fragment.outputBlock(" => catching(exn, () {", closeWith: "});") {
                            fragment.output("peekRef<\(unqualifiedName)>(obj).\(field.name) = ", newLineTerminated: false)
                            if isObject {
                                fragment.output("consumeRef<\(field.type.name(in: self))>(newValue);")
                            } else {
                                fragment.output("newValue;")
                            }
                        }
                    }
                }
            }

            fragment.blankLine()

            fields.forEach { output(field: $0, to: fragment) }
            methods.forEach { output(method: $0, to: fragment) }

            fragment.blankLine()
            outputNativeMethodDeclarations(to: fragment)
        }
    }

    override var hasFreezedPart: Bool {
        constructor != .reference
    }
}

class DartEnumClass: DartClass {
    let cases: [Case]

    struct Case {
        let documentation: [String]
        let name: String
        let values: [(name: String, type: DartType)]
    }

    init(
        module: Module,
        documentation: [String],
        name: String,
        cases: [Case],
        fieldsAndMethods: [MethodOrVariable]
    ) {
        self.cases = cases
        super.init(
            module: module,
            documentation: documentation,
            name: name,
            fieldsAndMethods: fieldsAndMethods
        )
    }

    override var hasFreezedPart: Bool {
        false
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)
        let doSealedClass = !cases.isEmpty
        if doSealedClass {
            fragment.output("sealed ", newLineTerminated: false)
        }
        fragment.output("class \(unqualifiedName)", newLineTerminated: false)

        fragment.outputBlock(" {") {
            for enumCase in cases {
                document(enumCase.documentation, fragment: fragment)
                fragment.output("const factory \(unqualifiedName).\(enumCase.name)", newLineTerminated: false)

                fragment.outputBlock("(", newLineTerminated: false) {
                    fragment.outputMap(enumCase.values, separator: ",") { value in
                        return "\(value.type.name(in: self)) \(DartClass.deforbidify(value.name))"
                    }
                }
                fragment.output(" = \(unqualifiedName)_\(upperCaseFirst(enumCase.name));")
                fragment.blankLine()
            }

            if doSealedClass {
                fragment.output("const \(unqualifiedName)();")
            } else {
                fragment.output("\(unqualifiedName)._();")
            }
            fragment.blankLine()

            fragment.outputBlock("static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {", closeWith: "});") {
                if cases.isEmpty {
                    fragment.output("throw UnsupportedError('This class is supposed to be uninhabited');")
                } else {
                    fragment.output("final peekedObj = peekRef<\(unqualifiedName)>(obj);")
                    for (enumIndex, enumCase) in cases.enumerated() {
                        if enumIndex != cases.indices.lowerBound {
                            fragment.output("else ", newLineTerminated: false)
                        }
                        fragment.output("if (peekedObj is \(unqualifiedName)_\(upperCaseFirst(enumCase.name))) { return \(enumIndex); }")
                    }
                    // This should never happen because every enum case should have a subclass extending the abstract base enum sealed class, but just in case...
                    fragment.output("else { throw UnsupportedError('Unknown \(unqualifiedName) subclass'); }")
                }
            }
            fragment.blankLine()

            for enumCase in cases {
                let caseName = upperCaseFirst(enumCase.name.mangled)

                // case constructor
                fragment.outputBlock("static CreatedRef new\(caseName)(", newLineTerminated: false) {
                    for value in enumCase.values {
                        fragment.output("\(value.type.ffiConsumedName) _\(value.name),")
                    }
                    fragment.output("OutCreatedRef exn")
                }
                fragment.outputBlock(" => catchingRef(exn, () =>", closeWith: ");") {
                    fragment.outputBlock("createRef(\(unqualifiedName)_\(caseName)(", closeWith: "))") {
                        for value in enumCase.values {
                            if value.type.isObject {
                                fragment.output("consumeRef<\(value.type.name(in: self))>(_\(value.name)),")
                            } else {
                                fragment.output("_\(value.name),")
                            }
                        }
                    }
                }
                fragment.blankLine()

                // case unpacker
                fragment.outputBlock("static void extract\(caseName)(", newLineTerminated: false) {
                    fragment.output("UnownedRef obj,")
                    for value in enumCase.values {
                        fragment.output("\(value.type.ffiOutCreatedName) _\(value.name),")
                    }
                    fragment.output("OutCreatedRef exn")
                }
                fragment.outputBlock(" {") {
                    fragment.outputBlock("catching(exn, () {", closeWith: "});") {
                        fragment.output("final _self = peekRef<\(unqualifiedName)_\(caseName)>(obj);")
                        for value in enumCase.values {
                            let memberName = DartClass.deforbidify(value.name)
                            if value.type.isObject {
                                fragment.output("_\(value.name).value = createRef(_self.\(memberName));")
                            } else {
                                fragment.output("_\(value.name).value = _self.\(memberName);")
                            }
                        }
                    }
                }
                fragment.blankLine()
            }

            fields.forEach { output(field: $0, to: fragment) }
            methods.forEach { output(method: $0, to: fragment) }

            fragment.blankLine()

            outputNativeMethodDeclarations(to: fragment)

            fragment.blankLine()

            fragment.output("\(unqualifiedName) shallowCopy() => throw UnsupportedError('\(unqualifiedName) shallowCopy() must be overridden by a subclass.');")
        }

        fragment.blankLine()

        for enumCase in cases {
            // output subclasses here that extend the sealed class
            let className = "\(unqualifiedName)_\(upperCaseFirst(enumCase.name))"
            fragment.output("class \(className) extends \(unqualifiedName)", newLineTerminated: false)

            fragment.outputBlock(" {") {
                fragment.output("const \(className)", newLineTerminated: false)
                if enumCase.values.isEmpty {
                    fragment.output("()", newLineTerminated: false)
                } else {
                    fragment.outputBlock("(", newLineTerminated: false) {
                        fragment.outputMap(enumCase.values, separator: ",") { value in
                            return "this.\(DartClass.deforbidify(value.name))"
                        }
                    }
                }
                fragment.output(";")
                
                fragment.blankLine()
                
                for value in enumCase.values {
                    fragment.output("final \(value.type.name(in: self)) \(DartClass.deforbidify(value.name));")
                }
                
                fragment.blankLine()
                
                fragment.output("@override")
                fragment.output("bool operator ==(Object other)", newLineTerminated: false)
                fragment.outputBlock(" {") {
                    fragment.output("return identical(other, this) ||")
                    fragment.output("(")
                    fragment.currentIndent += 1
                    fragment.output("other.runtimeType == runtimeType &&")
                    fragment.output("other is \(className)", newLineTerminated: false)
                    
                    if enumCase.values.isEmpty {
                        fragment.blankLine()
                    } else {
                        fragment.output(" &&")
                        fragment.outputBlock("(") {
                            fragment.outputMap(enumCase.values, separator: " &&") { value in
                                let valueName = "\(DartClass.deforbidify(value.name))"
                                return "const DeepCollectionEquality().equals(other.\(valueName), \(valueName))"
                            }
                        }
                    }
                    fragment.currentIndent -= 1
                    fragment.output(");")
                }
                
                fragment.blankLine()
                fragment.blankLine()
                
                fragment.output("@override")
                fragment.output("int get hashCode => ", newLineTerminated: false)
                if enumCase.values.isEmpty {
                    fragment.output("runtimeType.hashCode;")
                } else {
                    fragment.output("Object.hash(")
                    fragment.currentIndent += 1
                    fragment.output("runtimeType,")
                    fragment.outputMap(enumCase.values, separator: ", ") { value in
                        "const DeepCollectionEquality().hash(\(DartClass.deforbidify(value.name)))"
                    }
                    fragment.currentIndent -= 1
                    fragment.output(");")
                }
                
                fragment.blankLine()
                
                fragment.output("@override")
                fragment.output("String toString() => '\(unqualifiedName).\(enumCase.name)(", newLineTerminated: false)
                let toStringParamsString = enumCase.values.map { "\(DartClass.deforbidify($0.name)): $\(DartClass.deforbidify($0.name))" }.joined(separator: ", ")
                fragment.output("\(toStringParamsString))';")
                
                fragment.blankLine()
                
                fragment.output("@override")
                fragment.output("\(unqualifiedName) shallowCopy() => \(unqualifiedName).\(enumCase.name)", newLineTerminated: false)
                if !enumCase.values.isEmpty {
                    fragment.outputBlock(" (", newLineTerminated: false) {
                        
                        fragment.outputMap(enumCase.values, separator: ", ") {
                            "\(DartClass.deforbidify($0.name))"
                        }
                    }
                    fragment.output(";")
                } else {
                    fragment.output("();")
                }
            }

            fragment.blankLine()
        }
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
