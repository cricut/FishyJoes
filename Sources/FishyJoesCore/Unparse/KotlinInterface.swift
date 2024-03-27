class KotlinInterface: KotlinClass {
    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)
        if unqualifiedName.contains("TestAsyncFunctions") {
            let elegoo = 1
        }
        fragment.outputBlock("interface \(unqualifiedName) {") {
            fields.filter { !$0.isStatic }.forEach { output(field: $0, to: fragment, external: false) }
            methods.filter { !$0.isStatic }.forEach { output(method: $0, to: fragment, external: false) }

            fragment.blankLine()

            fragment.outputBlock("companion object {") {
                fields.filter { $0.isStatic }.forEach { output(field: $0, to: fragment) }
                methods.filter { $0.isStatic }.forEach {
                    // Hack to suppress JvmStatic annotations for protocols
                    var unstaticked = $0
                    unstaticked.isStatic = false
                    output(method: unstaticked, to: fragment)
                }
                for method in methods {
                    if method.isSuspend {
                        fragment.output("@JvmStatic")
                        fragment.outputBlock("fun \(method.name)(", newLineTerminated: false) {
                            fragment.output("self: \(unqualifiedName),")
                            fragment.outputMap(method.parameters, separator: ",") {
                                "\($0.name): \($0.type.kotlinType)"
                            }
                        }
                        fragment.output(": Deferred<\(method.returnType.kotlinType)> = CoroutineScope(Dispatchers.Default).async { self.\(method.name)(\(method.parameters.map { $0.name }.joined(separator: ", "))) }")
                        fragment.blankLine()
                    }
                }
                fragment.outputBlock("init {", closeWith: "}") {
                    fragment.output("loadNativeLibs()")
                }
            }
            outputInner(to: fragment)
        }
    }
}
