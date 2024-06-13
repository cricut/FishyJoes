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
        fields: [Variable],
        methods: [Method],
        conformances: Set<DartType>,
        isExternalWitness: Bool = false
    ) {
        self.constructor = constructor
        self.isExternalWitness = isExternalWitness
        super.init(
            module: module,
            documentation: documentation,
            name: name,
            fields: fields,
            methods: methods,
            conformances: conformances
        )
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
            conformancesPart.append(conformances.map { $0.name(in: self) }.joined(separator: ", "))
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
                fragment.blankLine()

                toStringImpl(fields: fields, fragment: fragment)
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
                        fragment.output("\(field.type.ffiConsumedName) \(DartClass.deforbidify(field.name)),")
                    }
                    fragment.output("OutCreatedRef exn")
                }
                fragment.outputBlock(" => catchingRef(exn, () =>", closeWith: ");") {
                    fragment.outputBlock("createRef(\(unqualifiedName)(", closeWith: "))") {
                        for field in fields {
                            if field.type.isObject {
                                fragment.output("\(DartClass.deforbidify(field.name)): consumeRef(\(DartClass.deforbidify(field.name))),")
                            } else {
                                fragment.output("\(DartClass.deforbidify(field.name)): \(DartClass.deforbidify(field.name)),")
                            }
                        }
                    }
                }

                toStringImpl(fields: storedFields, fragment: fragment)
            }

            fragment.blankLine()

            if !isExternalWitness {
                ffiFor(fields: storedFields, fragment: fragment, isReference: constructor == .reference)
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
            outputNativeMethodDeclarations(methods: nativeMethods, fragment: fragment)
        }
    }
}
