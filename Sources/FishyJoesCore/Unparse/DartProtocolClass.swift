class DartProtocolClass: DartClass {
    init(
        module: Module,
        documentation: [String],
        name: String,
        fields: [Variable],
        methods: [Method],
        conformances: Set<String>
    ) {
        super.init(
            module: module,
            documentation: documentation,
            name: name,
            fields: fields,
            methods: methods,
            conformances: conformances
        )
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)

        let normalMethods = methods.filter { !$0.isInExtension }
        let defaultMethods = methods.filter { $0.isInExtension }

        fragment.outputBlock("abstract class \(unqualifiedName) {") {
            for method in normalMethods {
                // Dart does not support static method inheritance like Swift does.
                guard !method.isStatic else {
                    fragment.output("// \(method.name) omitted: static methods on protocols not supported in Dart.")
                    continue
                }

                fragment.output("\(method.isStatic ? "static " : "")", newLineTerminated: false)
                fragment.outputBlock("\(method.returnType.name(in: self)) \(method.name)(", closeWith: ");") {
                    func argumentString(parameter: Method.Parameter) -> String {
                        let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
                        return "\(parameter.type.name(in: self)) \(labelComment)\(DartClass.deforbidify(parameter.name))"
                    }

                    // put all optional parameters at the end, or dart gets unhappy
                    let requiredParams = method.parameters.filter { $0.defaultValue == nil }
                    let optionalParams = method.parameters.filter { $0.defaultValue != nil }

                    fragment.outputMap(requiredParams, separator: ",") {
                        argumentString(parameter: $0)
                    }
                    if !optionalParams.isEmpty {
                        fragment.outputBlock("[") {
                            fragment.outputMap(optionalParams, separator: ",") {
                                argumentString(parameter: $0)
                            }
                        }
                    }
                }
                fragment.blankLine()
            }

            for field in fields {
                // Dart does not support static property inheritance like Swift does.
                guard !field.isStatic else {
                    fragment.output("// \(field.name) static fields on protocols not supported in Dart.")
                    continue
                }

                fragment.blankLine()
                document(field.documentation, fragment: fragment)

                let staticMark = field.isStatic ? "static " : ""

                func outputAttributes() {
                    if let deprecation = field.deprecation {
                        fragment.output("@Deprecated(\"\(deprecation.quotedMessage)\")")
                    }
                }

                outputAttributes()
                fragment.output("\(staticMark)\(field.type.name(in: self)) get \(Self.deforbidify(field.name));")

                fragment.blankLine()

                if field.isPubliclyWritable {
                    outputAttributes()
                    fragment.output("\(staticMark)set \(Self.deforbidify(field.name))(\(field.type.name(in: self)) value);")
                }
            }
        }

        fragment.blankLine()

        let defaultImplsName = "\(unqualifiedName)_DefaultImplementations"
        fragment.outputBlock("extension \(defaultImplsName) on \(unqualifiedName) {") {
            for method in defaultMethods {
                // Dart does not support static method inheritance like Swift does.
                guard !method.isStatic else {
                    fragment.output("// \(method.name) omitted: static methods on protocols not supported in Dart.")
                    continue
                }

                fragment.output("\(method.isStatic ? "static " : "")", newLineTerminated: false)
                fragment.outputBlock("\(method.returnType.name(in: self)) \(method.name)(", closeWith: ")", newLineTerminated: false) {
                    func argumentString(parameter: Method.Parameter) -> String {
                        let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
                        return "\(parameter.type.name(in: self)) \(labelComment)\(DartClass.deforbidify(parameter.name))"
                    }

                    // put all optional parameters at the end, or dart gets unhappy
                    let requiredParams = method.parameters.filter { $0.defaultValue == nil }
                    let optionalParams = method.parameters.filter { $0.defaultValue != nil }

                    fragment.outputMap(requiredParams, separator: ",") {
                        argumentString(parameter: $0)
                    }
                    if !optionalParams.isEmpty {
                        fragment.outputBlock("[") {
                            fragment.outputMap(optionalParams, separator: ",") {
                                argumentString(parameter: $0)
                            }
                        }
                    }
                }

                fragment.outputBlock(" =>", closeWith: ";") {
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
                fragment.blankLine()

                fragment.outputBlock("static \(method.returnType.ffiCreatedName) ffi_\(method.name)(", newLineTerminated: false) {
                    fragment.output("UnownedRef obj,")
                    for param in method.parameters {
                        fragment.output("\(param.type.ffiUnownedName) \(param.name),")
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
                        methodCall = "\(defaultImplsName).\(method.name)"
                    } else {
                        methodCall = "peekRef<\(unqualifiedName)>(obj).\(method.name)"
                    }

                    fragment.outputBlock("\(methodCall)(", closeWith: ")") {
                        fragment.outputMap(method.parameters, separator: ",") {
                            $0.type.isObject ? "peekRef<\($0.type.name())>(\($0.name))" : $0.name
                        }
                    }
                }
                fragment.blankLine()
            }
            fragment.blankLine()
            outputNativeMethodDeclarations(to: fragment)
        }

        fragment.blankLine()

        let ffiHooksName = "\(unqualifiedName)_FfiHooks"
        fragment.outputBlock("extension \(ffiHooksName) on \(unqualifiedName) {") {
            ffiFor(fields: fields, fragment: fragment)
            ffiFor(methods: normalMethods, fragment: fragment)
        }
    }
}
