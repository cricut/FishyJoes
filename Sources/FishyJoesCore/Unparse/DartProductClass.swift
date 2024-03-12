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
    let isExternalWitness: Bool

    init(
        module: Module,
        documentation: [String],
        name: String,
        constructor: Constructor,
        fieldsAndMethods: [MethodOrVariable],
        conformances: Set<String>,
        isExternalWitness: Bool = false
    ) {
        self.constructor = constructor
        self.isExternalWitness = isExternalWitness
        super.init(
            module: module,
            documentation: documentation,
            name: name,
            fieldsAndMethods: fieldsAndMethods,
            conformances: conformances
        )
    }

    private func ffiFor(fields: [Variable], fragment: SourceFragment) {
        var peekTypeName = unqualifiedName
        if isExternalWitness,
           let conformance = conformances.first {
            peekTypeName = "\(module.name).\(conformance)"
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
                if field.isStatic {
                    fragment.output("\(unqualifiedName).\(field.name)")
                } else {
                    fragment.output("peekRef<\(peekTypeName)>(obj).\(field.name)")
                }
            }
            if field.isMutable,
               field.isPubliclyWritable {
                fragment.outputBlock("static void ffi_set_\(field.name)(", newLineTerminated: false) {
                    fragment.output("UnownedRef obj,")
                    fragment.output("\(field.type.ffiConsumedName) newValue,")
                    fragment.output("OutCreatedRef exn")
                }
                fragment.outputBlock(" => catching(exn, () {", closeWith: "});") {
                    if field.isStatic {
                        fragment.output("\(unqualifiedName).\(field.name) = ", newLineTerminated: false)
                    } else {
                        fragment.output("peekRef<\(peekTypeName)>(obj).\(field.hiddenStorage ? "_" : "")\(field.name) = ", newLineTerminated: false)
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

    private func toStringImpl(fields: [Variable], fragment: SourceFragment) {
        fragment.output("@override")
        fragment.output("String toString() => '\(unqualifiedName)(", newLineTerminated: false)
        let toStringParamsString = fields.map { "\(DartClass.deforbidify($0.name)): $\(DartClass.deforbidify($0.name))" }.joined(separator: ", ")
        fragment.output("\(toStringParamsString))';")

        fragment.blankLine()
    }

    override func output(to fragment: SourceFragment) {
        var conformancesPart = ""
        if !conformances.isEmpty {
            conformancesPart.append(" implements ")
            conformancesPart.append(conformances.map { "\(module).\($0)" }.joined(separator: ", "))
        }
        var peekTypeName = unqualifiedName
        if isExternalWitness,
           let conformance = conformances.first {
            peekTypeName = "\(module.name).\(conformance)"
        }

        commonIgnoreSpecificWarnings(fragment: fragment)

        document(documentation, fragment: fragment)

        var storedFields = [Variable]()

        switch constructor {
        case .reference:
            fragment.output("class \(unqualifiedName) extends SwiftReference\(conformancesPart)", newLineTerminated: false)
        case .public:
            fragment.output("class \(unqualifiedName)\(conformancesPart)", newLineTerminated: false)
        }
        fragment.outputBlock(" {") {
            switch constructor {
            case .reference:
                fragment.output("\(unqualifiedName)(ffi.Pointer reference): super(reference) {}")

                fragment.outputBlock("static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>", closeWith: ");") {
                    fragment.output("createRef(\(unqualifiedName)(ref))")
                }
                if !conformances.isEmpty {
                    toStringImpl(fields: fields, fragment: fragment)
                }
                fragment.blankLine()
            case .public(let fields):
                storedFields = fields
                for field in fields {
                    let type = field.type.name(in: self)
                    let name = DartClass.deforbidify(field.name)
                    if field.hiddenStorage {
                        fragment.output("\(type) _\(name);")
                        fragment.output("\(type) get \(name) => _\(name);")
                    } else if field.isMutable {
                        fragment.output("\(type) \(name);")
                    } else {
                        fragment.output("final \(type) \(name);")
                    }
                }

                fragment.blankLine()

                let blockOpenClose = fields.isEmpty ? ["(", ")"] : ["({", "})"]
                fragment.outputBlock("\(unqualifiedName)\(blockOpenClose[0])", closeWith: blockOpenClose[1], newLineTerminated: false) {
                    fragment.outputMap(fields, separator: ",") { field in
                        let type = field.type.name(in: self)
                        let name = DartClass.deforbidify(field.name)
                        return "required \(type) \(name)"
                    }
                }
                if !fields.isEmpty {
                    fragment.output(":")
                    fragment.indent {
                        fragment.outputMap(fields, separator: ",", newLineTerminated: false) { field in
                            let name = DartClass.deforbidify(field.name)
                            return "this.\(field.hiddenStorage ? "_" : "")\(name) = \(name)"
                        }
                    }
                }
                fragment.output(";")

                fragment.blankLine()

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

                ffiFor(fields: fields, fragment: fragment)
                fragment.blankLine()
            }

            fragment.blankLine()

            ffiFor(fields: fields, fragment: fragment)

            fragment.blankLine()

            for method in methods {
                guard !method.documentation.isEmpty else {
                    continue
                }
                fragment.outputBlock("static \(method.returnType.ffiCreatedName) ffi_\(method.name)(", newLineTerminated: false) {
                    fragment.output("UnownedRef obj,")
                    for param in method.parameters {
                        fragment.output("\(param.type.ffiConsumedName) \(param.name),")
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
                        methodCall = "peekRef<\(peekTypeName)>(obj).\(method.name)"
                    }
                    fragment.outputBlock("\(methodCall)(", closeWith: ")") {
                        // put all optional parameters at the end, or dart gets unhappy
                        let requiredParams = method.parameters.filter { $0.defaultValue == nil }
                        let optionalParams = method.parameters.filter { $0.defaultValue != nil }
                        fragment.outputMap(requiredParams, separator: ",", newLineTerminated: false) {
                            if $0.type.isObject {
                                return "consumeRef(\($0.name))"
                            } else {
                                return $0.name
                            }
                        }
                        if !optionalParams.isEmpty {
                            fragment.output(",")
                            fragment.outputMap(optionalParams, separator: ",") {
                                if $0.type.isObject {
                                    return "\($0.name): consumeRef(\($0.name))"
                                } else {
                                    return $0.name
                                }
                            }
                        } else {
                            fragment.blankLine()
                        }
                    }
                }
                fragment.blankLine()
            }

            fragment.blankLine()

            if constructor != .reference {
                toStringImpl(fields: storedFields, fragment: fragment)
                fragment.blankLine()
            }

            if constructor != .reference {
                fragment.output("@override")
                fragment.outputBlock("bool operator ==(Object other) {", newLineTerminated: false) {
                    fragment.output("return identical(other, this) ||")
                    fragment.outputBlock("(", closeWith: ");") {
                        fragment.output("other.runtimeType == runtimeType &&")
                        fragment.output("other is \(unqualifiedName)", newLineTerminated: false)

                        let nonStaticFields = storedFields.filter { !$0.isStatic }
                        if nonStaticFields.isEmpty {
                            fragment.blankLine()
                        } else {
                            fragment.output(" &&")
                            fragment.outputBlock("(") {
                                fragment.outputMap(nonStaticFields, separator: " &&") { field in
                                    let valueName = "\(DartClass.deforbidify(field.name))"
                                    return "const DeepCollectionEquality().equals(other.\(valueName), \(valueName))"
                                }
                            }
                        }
                    }
                }

                fragment.blankLine()
                fragment.blankLine()

                fragment.output("@override")
                fragment.output("int get hashCode => ", newLineTerminated: false)
                if storedFields.isEmpty {
                    fragment.output("runtimeType.hashCode;")
                } else {
                    fragment.output("Object.hash", newLineTerminated: false)
                    fragment.outputBlock("(", closeWith: ");") {
                        fragment.output("runtimeType,")
                        let maxPositionalParamsPerObjectHashCall = 20
                        if storedFields.count < maxPositionalParamsPerObjectHashCall - 1 {
                            fragment.outputMap(storedFields, separator: ", ") { field in
                                "const DeepCollectionEquality().hash(\(DartClass.deforbidify(field.name)))"
                            }
                        } else {
                            // split up fields into groups of 20
                            for fieldGroupStartIndex in stride(from: storedFields.indices.lowerBound, to: storedFields.indices.upperBound, by: maxPositionalParamsPerObjectHashCall) {
                                if fieldGroupStartIndex != storedFields.indices.lowerBound {
                                    fragment.output(",")
                                }
                                fragment.output("Object.hash", newLineTerminated: false)
                                fragment.outputBlock("(", closeWith: ")", newLineTerminated: false) {
                                    let fieldGroup = Array(storedFields[fieldGroupStartIndex..<min(storedFields.indices.upperBound, fieldGroupStartIndex + maxPositionalParamsPerObjectHashCall)])
                                    fragment.outputMap(fieldGroup, separator: ", ") { field in
                                        "const DeepCollectionEquality().hash(\(DartClass.deforbidify(field.name)))"
                                    }
                                }
                            }
                            fragment.blankLine()
                        }
                    }
                }
                fragment.blankLine()
            }

            if constructor != .reference {
                fragment.output("\(unqualifiedName) copyWith", newLineTerminated: false)
                if storedFields.isEmpty {
                    fragment.output("()", newLineTerminated: false)
                } else {
                    fragment.outputBlock("({", closeWith: "})", newLineTerminated: false) {
                        fragment.outputMap(storedFields, separator: ",") {
                            "\($0.type.name(in: self).replacingOccurrences(of: "?", with: ""))? \(DartClass.deforbidify($0.name))"
                        }
                    }
                }
                fragment.output(" => \(unqualifiedName)", newLineTerminated: false)
                if storedFields.isEmpty {
                    fragment.output("();")
                } else {
                    fragment.outputBlock("(", closeWith: ");") {
                        fragment.outputMap(storedFields, separator: ",") {
                            let name = "\(DartClass.deforbidify($0.name))"
                            return "\(name): \(name) ?? this.\(name)"
                        }
                    }
                }
                fragment.blankLine()
            }

            fields.forEach { output(field: $0, to: fragment) }
            methods.forEach { output(method: $0, to: fragment) }

            fragment.blankLine()
            outputNativeMethodDeclarations(to: fragment)
        }
    }
}
