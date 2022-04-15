import Foundation
import SourceryRuntime

struct CSharpTranslator: Translator {
    init() {}

    func setupFragment(context: FishyJoesContext, generatedTypes: Set<BetterType>) -> SourceFragment {
        .init(sourceryDestination: "CSharpFragment")
    }
}

