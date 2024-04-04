class CSharpProtocolClass: CSharpClass {
    let fields: [Variable]
    let methods: [Method]

    init(
        module: Module,
        documentation: [String],
        name: String,
        fields: [Variable],
        methods: [Method]
    ) {
        self.fields = fields
        self.methods = methods
        super.init(module: module, documentation: documentation, name: name)
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)

        fragment.outputBlock("interface \(unqualifiedName) {") {
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
