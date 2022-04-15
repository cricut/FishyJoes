protocol Translator {
    init()
    func setupFragment(context: FishyJoesContext, generatedTypes: Set<BetterType>) -> SourceFragment
}
