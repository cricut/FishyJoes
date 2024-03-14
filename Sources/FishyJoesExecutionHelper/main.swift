import FishyJoesCore
import Foundation
import SourceryRuntime

guard CommandLine.argc > 2, CommandLine.arguments[1] == "--executing-from-within-sourcery" else {
    fatalError("Not meant to be called directly. Invoke via fishy-joes instead.")
}

if let dumpPath = ProcessInfo.processInfo.environment["DUMP_SOURCERY_DATA"] {
    let data = NSData(contentsOfFile: CommandLine.arguments[2])!
    data.write(toFile: dumpPath, atomically: false)
}

let inputPath = (CommandLine.arguments[2] as NSString).expandingTildeInPath as String
protocol UndeprecatedNSKeyedUnarchiver {
    static func unarchiveObject(withFile file: String) -> Any?
}
enum DeprecatedNSKeyedUnarchiver: UndeprecatedNSKeyedUnarchiver {
    @available(macOS, deprecated: 10.14)
    static func unarchiveObject(withFile file: String) -> Any? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: file)
    }
}
guard let context = (DeprecatedNSKeyedUnarchiver.self as UndeprecatedNSKeyedUnarchiver.Type).unarchiveObject(withFile: inputPath) as? TemplateContext else {
    fatalError("inputPath: \(inputPath) CommandLine.arguments: \(CommandLine.arguments) Something went wrong with executing fishyjoes from sourcery")
}

var noStdErrFifo = true
if CommandLine.argc >= 4,
      CommandLine.arguments[3] == "--stderrFifo" {
    noStdErrFifo = false
}

print(FishyJoesContext(context: context, noStdErrFifo: noStdErrFifo).translateAll())
