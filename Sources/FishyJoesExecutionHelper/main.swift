import FishyJoesCore
import SourceryRuntime
import Foundation

guard CommandLine.argc > 2, CommandLine.arguments[1] == "--executing-from-within-sourcery" else {
    fatalError("Not meant to be called directly. Invoke via fishy-joes instead.")
}

if let dumpPath = ProcessInfo.processInfo.environment["DUMP_SOURCERY_DATA"] {
    let data = NSData(contentsOfFile: CommandLine.arguments[2])!
    data.write(toFile: dumpPath, atomically: false)
}

let inputPath = (CommandLine.arguments[2] as NSString).expandingTildeInPath as String
guard let context = NSKeyedUnarchiver.unarchiveObject(withFile: inputPath) as? TemplateContext else {
    fatalError("Something went wrong with executing fishyjoes from sourcery")
}

print(FishyJoesContext(context: context).translateAll())
