protocol Translator {
    init()
    func setupFragments(context: FishyJoesContext, generatedTypes: Set<BetterType>) -> [SourceFragment]
}
