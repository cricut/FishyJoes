import FishyJoesCore
import SourceryRuntime
import Foundation

guard CommandLine.argc > 2, CommandLine.arguments[1] == "--executing-from-within-sourcery" else {
    fatalError("Not meant to be called directly. Invoke via fishy-joes instead.")
}

guard let context = NSKeyedUnarchiver.unarchiveObject(withFile: CommandLine.arguments[2]) as? TemplateContext else {
    fatalError("Something went wrong with executing fishyjoes from sourcery")
}

print(FishyJoesContext(context: context).translateAll())
