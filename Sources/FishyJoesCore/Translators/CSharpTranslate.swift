import Foundation
import SourceryRuntime

struct CSharpTranslator: Translator {
    init() {}

    func setupFragments(context: FishyJoesContext, generatedTypes: Set<BetterType>) -> [SourceFragment] {
        []
    }
}
