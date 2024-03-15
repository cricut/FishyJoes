protocol Translator {
    func setupFragments(context: FishyJoesContext, generatedTypes: [BetterType]) -> [SourceFragment]
}
