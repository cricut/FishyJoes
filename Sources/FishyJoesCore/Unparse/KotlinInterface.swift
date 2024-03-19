class KotlinInterface: KotlinClass {
    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)
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
                fragment.outputBlock("init {", closeWith: "}") {
                    fragment.output("loadNativeLibs()")
                }
            }
            outputInner(to: fragment)
        }
    }
}
