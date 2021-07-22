import SourceryRuntime

struct TranslatedEnum: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let enumType: Enum

    init(context: FishyJoesContext, type: Enum) {
        guard let nodeName = type.exportAnnotation?.js else { fatalErr("js symbol not specified") }

        self.sourceType = BetterType(named: type)
        self.nodeName = nodeName
        self.enumType = type
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        let nodeFragment = context.swiftFragment(
            "NodeInterface/\(sourceType.name)+node.swift",
            additionalImports: ["FishyJoesRuntime"]
        )
        nodeFragment.outputBlock("extension \(sourceType.name): FishyJoesRuntime.NodeConvertible {") {
            nodeFragment.outputBlock("public init(fromNode value: napi_value?, env: napi_env) throws {") {
                nodeFragment.outputBlock("switch try String(fromNode: value, env: env) {") {
                    for enumCase in enumType.cases {
                        nodeFragment.output("case \"\(enumCase.name)\": self = .\(enumCase.name)")
                    }
                    nodeFragment.output("case let unknown: print(\"invalid enum string '\\(unknown)' for \(sourceType.name)\"); fatalError()")
                }
            }

            nodeFragment.outputBlock("public func toNode(env: napi_env) throws -> napi_value? {") {
                nodeFragment.outputBlock("switch self {") {
                    for enumCase in enumType.cases {
                        nodeFragment.output("case .\(enumCase.name): return try \"\(enumCase.name)\".toNode(env: env)")
                    }
                }
            }
        }

        context.tsFragment.typealiases.append(
            .init(
                name: nodeName,
                value: .union(enumType.cases.map { .exactString($0.name) })
            )
        )
        return [nodeFragment]
    }
}
