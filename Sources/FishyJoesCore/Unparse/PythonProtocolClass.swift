class PythonProtocolClass: PythonClass2 {
    override func publicFragments(context: FishyJoesContext) -> [SourceFragment] {
        let fragment = context.pythonFragment("_\(snakify(unqualifiedName))_type.py", additionalImports: ["import abc"])

        // let normalFields = fields.filter { !$0.isDefaultImplementation }
        // let defaultFields = fields.filter { $0.isDefaultImplementation }

        // let normalMethods = methods.filter { !$0.isDefaultImplementation }
        // let defaultMethods = methods.filter { $0.isDefaultImplementation }

        fragment.outputBlock("class \(unqualifiedName)(abc.ABC):") {
            document(documentation, fragment: fragment)
            // for method in normalMethods {
            //     // Python does not support static method inheritance like Swift does.
            //     guard !method.isStatic else {
            //         fragment.output("// \(method.name) omitted: static methods on protocols not supported in Python.")
            //         continue
            //     }

            //     fragment.output("\(method.isStatic ? "static " : "")", newLineTerminated: false)
            //     fragment.outputBlock("\(method.returnType.name(in: self)) \(method.name)(", closeWith: ");") {
            //         func argumentString(parameter: Method.Parameter) -> String {
            //             let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
            //             return "\(parameter.type.name(in: self)) \(labelComment)\(PythonClass2.deforbidify(parameter.name))"
            //         }

            //         // put all optional parameters at the end, or python gets unhappy
            //         let requiredParams = method.parameters.filter { $0.defaultValue == nil }
            //         let optionalParams = method.parameters.filter { $0.defaultValue != nil }

            //         fragment.outputMap(requiredParams, separator: ",") {
            //             argumentString(parameter: $0)
            //         }
            //         if !optionalParams.isEmpty {
            //             fragment.outputBlock("[") {
            //                 fragment.outputMap(optionalParams, separator: ",") {
            //                     argumentString(parameter: $0)
            //                 }
            //             }
            //         }
            //     }
            //     fragment.blankLine()
            // }

            // for field in normalFields {
            //     // Python does not support static property inheritance like Swift does.
            //     guard !field.isStatic else {
            //         fragment.output("// \(field.name) static fields on protocols not supported in Python.")
            //         continue
            //     }

            //     fragment.blankLine()
            //     document(field.documentation, fragment: fragment)

            //     let staticMark = field.isStatic ? "static " : ""

            //     func outputAttributes() {
            //         if let deprecation = field.deprecation {
            //             fragment.output("@Deprecated(\"\(deprecation.quotedMessage)\")")
            //         }
            //     }

            //     outputAttributes()
            //     fragment.output("\(staticMark)\(field.type.name(in: self)) get \(PythonClass2.deforbidify(field.name));")

            //     fragment.blankLine()

            //     if field.isPubliclyWritable {
            //         outputAttributes()
            //         fragment.output("\(staticMark)set \(PythonClass2.deforbidify(field.name))(\(field.type.name(in: self)) value);")
            //     }
            // }
        }

        fragment.blankLine()

        // let defaultImplsName = "\(unqualifiedName)_DefaultImplementations"
        // fragment.outputBlock("extension \(defaultImplsName) on \(unqualifiedName) {") {
        //     for field in defaultFields {
        //         // Python does not support static property inheritance like Swift does.
        //         guard !field.isStatic else {
        //             fragment.output("// \(field.name) static fields on protocols not supported in Python.")
        //             continue
        //         }

        //         fragment.blankLine()
        //         document(field.documentation, fragment: fragment)

        //         output(field: field, to: fragment)
        //     }

        //     for method in defaultMethods {
        //         // Python does not support static method inheritance like Swift does.
        //         guard !method.isStatic else {
        //             fragment.output("// \(method.name) omitted: static methods on protocols not supported in Python.")
        //             continue
        //         }

        //         fragment.output("\(method.isStatic ? "static " : "")", newLineTerminated: false)
        //         fragment.outputBlock("\(method.returnType.name(in: self)) \(method.name)(", closeWith: ")", newLineTerminated: false) {
        //             func argumentString(parameter: Method.Parameter) -> String {
        //                 let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
        //                 return "\(parameter.type.name(in: self)) \(labelComment)\(PythonClass2.deforbidify(parameter.name))"
        //             }

        //             // put all optional parameters at the end, or python gets unhappy
        //             let requiredParams = method.parameters.filter { $0.defaultValue == nil }
        //             let optionalParams = method.parameters.filter { $0.defaultValue != nil }

        //             fragment.outputMap(requiredParams, separator: ",") {
        //                 argumentString(parameter: $0)
        //             }
        //             if !optionalParams.isEmpty {
        //                 fragment.outputBlock("[") {
        //                     fragment.outputMap(optionalParams, separator: ",") {
        //                         argumentString(parameter: $0)
        //                     }
        //                 }
        //             }
        //         }

        //         fragment.outputBlock(" =>", closeWith: ";") {
        //             var wrap: (() -> Void) -> Void = { body in
        //                 if !method.isStatic {
        //                     fragment.outputBlock("GCRef.using(this, (_thisHandle) =>", closeWith: ")", body)
        //                 } else {
        //                     body()
        //                 }
        //             }

        //             var paramStrings: [String] = method.isStatic ? [] : ["_thisHandle.ptr"]
        //             // Keep the parameters in original order here, because the swift-side expects them in that order
        //             for param in method.parameters {
        //                 if param.type.isObject {
        //                     let oldWrap = wrap
        //                     wrap = { body in
        //                         oldWrap {
        //                             fragment.outputBlock("GCRef.using(\(PythonClass2.deforbidify(param.name)), (_\(param.name)Handle) =>", closeWith: ")", body)
        //                         }
        //                     }
        //                     paramStrings.append("_\(param.name)Handle.ptr")
        //                 } else {
        //                     paramStrings.append("\(PythonClass2.deforbidify(param.name))")
        //                 }
        //             }
        //             paramStrings.append("_exn")

        //             let methodName = "__iota_\(method.mangledName)"
        //             let body = "check((OutCreatedRef _exn) => \(methodName)(fishyjoes_runtime.Runtime.shared.env_ref, \(paramStrings.joined(separator: ", "))))"
        //             wrap {
        //                 if method.returnType.isObject {
        //                     fragment.output("consumeCreatedRef<\(method.returnType.name(in: self))>(\(body))")
        //                 } else {
        //                     fragment.output(body)
        //                 }
        //             }
        //         }
        //         fragment.blankLine()

        //         fragment.outputBlock("static \(method.returnType.ffiCreatedName) ffi_\(method.name)(", newLineTerminated: false) {
        //             fragment.output("UnownedRef obj,")
        //             for param in method.parameters {
        //                 fragment.output("\(param.type.ffiUnownedName) \(param.name),")
        //             }
        //             fragment.output("OutCreatedRef exn")
        //         }
        //         var wrapper: (() -> Void) -> Void
        //         if method.returnType.isObject {
        //             wrapper = { body in
        //                 fragment.outputBlock("catchingRef(exn, () =>", closeWith: ");") {
        //                     fragment.outputBlock("createRef(") {
        //                         body()
        //                     }
        //                 }
        //             }
        //         } else {
        //             wrapper = { body in
        //                 let defaultValue = method.returnType.defaultReturnValue.map { " ?? \($0)" } ?? ""
        //                 fragment.outputBlock("catching(exn, () =>", closeWith: ")\(defaultValue);") {
        //                     body()
        //                 }
        //             }
        //         }

        //         fragment.output(" => ", newLineTerminated: false)
        //         wrapper {
        //             let methodCall: String
        //             if method.isStatic {
        //                 methodCall = "\(defaultImplsName).\(method.name)"
        //             } else {
        //                 methodCall = "peekRef<\(unqualifiedName)>(obj).\(method.name)"
        //             }

        //             fragment.outputBlock("\(methodCall)(", closeWith: ")") {
        //                 fragment.outputMap(method.parameters, separator: ",") {
        //                     $0.type.isObject ? "peekRef<\($0.type.name())>(\($0.name))" : $0.name
        //                 }
        //             }
        //         }
        //         fragment.blankLine()
        //     }
        //     fragment.blankLine()
        //     outputNativeMethodDeclarations(methods: nativeMethods, fragment: fragment)
        // }

        // fragment.blankLine()

        // let ffiHooksName = "\(unqualifiedName)_FfiHooks"
        // fragment.outputBlock("extension \(ffiHooksName) on \(unqualifiedName) {") {
        //     ffiFor(fields: fields, fragment: fragment)
        //     ffiFor(methods: normalMethods, fragment: fragment)
        // }
        return [fragment]
    }

    override var nativeMethods: [String: (args: [(String, PythonType)], return: PythonType, isDefaultImplementation: Bool, isProtocol: Bool)] {
        let result: [String: (args: [(String, PythonType)], return: PythonType, isDefaultImplementation: Bool, isProtocol: Bool)] = [:]

        // let thisArg = ("_this", PythonType.named(package: module.pythonNamespace, name: name))

        // for field in fields {
        //     if field.isDefaultImplementation {
        //         let baseArgs = field.isStatic ? [] : [thisArg]

        //         let resultName = "__iota__default_\(field.mangledName)"
        //         // Don't add methods (except for default implementations) for PythonProtocolClass to pythonTranslator
        //         // They will be handled by the ExternalWitness for that Protocol
        //         // We still need it default implementations in order to accomodate foreign side user defined types that conform to the protocol.

        //         result[resultName] = (args: baseArgs, return: field.type, isDefaultImplementation: true, isProtocol: true)
        //     }
        // }

        // for method in methods {
        //     // Don't add methods (except for default implementations) for PythonProtocolClass to pythonTranslator
        //     // They will be handled by the ExternalWitness for that Protocol
        //     // We still need it default implementations in order to accomodate foreign side user defined types that conform to the protocol.
        //     if method.isDefaultImplementation {
        //         if method.body != nil { continue }

        //         var params = method.isStatic ? [] : [thisArg]

        //         // Keep the parameters in original order here, because the swift-side expects them in that order
        //         for param in method.parameters {
        //             params.append((param.name, param.type))
        //         }

        //         result["__iota_\(method.mangledName)"] = (args: params, return: method.returnType, isDefaultImplementation: true, isProtocol: true)
        //     }
        // }

        return result
    }
}
