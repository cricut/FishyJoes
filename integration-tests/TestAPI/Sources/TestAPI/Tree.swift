/// <!-- FishyJoes.export(Tree) -->
public struct Tree {
    public let value: Int
    public let children: [Tree]

    public init(value: Int, children: [Tree]) {
        self.value = value
        self.children = children
    }
}
