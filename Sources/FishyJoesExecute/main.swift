import FishyJoesCore
import SourceryRuntime
import Foundation

if CommandLine.argc > 2, CommandLine.arguments[1] == "--executing-from-within-sourcery" {
    guard let context = NSKeyedUnarchiver.unarchiveObject(withFile: CommandLine.arguments[2]) as? TemplateContext else {
        fatalError("Something went wrong with executing fishyjoes from sourcery")
    }
    print(FishyJoesContext(context: context).translateAll())
} else {
    CodeGen.main()
}
