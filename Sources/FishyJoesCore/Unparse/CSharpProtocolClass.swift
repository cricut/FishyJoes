class CSharpProtocolClass: CSharpClass {
    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)

        fragment.outputBlock("public interface \(unqualifiedName) {") {
            for field in fields {
                fragment.output("public \(field.type.name) \(CSharpClass.deforbidify(field.name)) { get; \(field.isPubliclyWritable ? "set;" : "internal set;") }")
            }
            fragment.blankLine()

            methods.forEach { output(method: $0, to: fragment) }
            fragment.blankLine()

            outputInner(to: fragment)

            fragment.output("static \(unqualifiedName)() { _TypeSetup._ensureLoaded(); }")
        }
    }
}
