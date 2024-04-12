class CSharpProtocolClass: CSharpClass {
    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)

        fragment.outputBlock("public interface \(unqualifiedName) {") {
            // All fields in protocols treated as methods with "Get" prefix because of C# tradition; and we can only do `get throws` for computed properties in Swift because there's no `set throws`.
            for field in fields {
                var fieldAsMethod = field
                fieldAsMethod.asMethod = true
                output(field: fieldAsMethod, to: fragment)
                fragment.blankLine()
            }

            methods.forEach { output(method: $0, to: fragment) }
            fragment.blankLine()

            outputInner(to: fragment)

            fragment.output("static \(unqualifiedName)() { _TypeSetup._ensureLoaded(); }")
        }
    }
}
