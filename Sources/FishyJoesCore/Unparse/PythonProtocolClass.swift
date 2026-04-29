class PythonProtocolClass: PythonClass {
    override func output(to fragment: SourceFragment) {
        fragment.outputBlock("class \(disambiguatedName)(typing.Protocol):", closeWith: "") {
            document(documentation, fragment: fragment, extra: ["Generated FishyJoes Python protocol surface."])
            if fields.isEmpty && methods.isEmpty {
                fragment.output("pass")
                return
            }

            for field in fields {
                output(field: field, to: fragment)
                fragment.blankLine()
            }
            for method in methods {
                output(method: method, to: fragment)
                fragment.blankLine()
            }
        }
    }

    private func output(field: Variable, to fragment: SourceFragment) {
        fragment.output("@property")
        fragment.outputBlock("def \(field.sourceName)(self) -> \(field.type.name):", closeWith: "") {
            document(field.documentation, fragment: fragment)
            fragment.output("...")
        }
    }

    private func output(method: Method, to fragment: SourceFragment) {
        let asyncMark = method.isAsync ? "async " : ""
        let returnTypeName = method.isAsync ? method.returnType.awaitedName : method.returnType.name
        fragment.outputBlock("\(asyncMark)def \(method.sourceName)(\(parameterList(explicit: ["self"], parameters: method.parameters))) -> \(returnTypeName):", closeWith: "") {
            document(method.documentation, fragment: fragment)
            fragment.output("...")
        }
    }
}
