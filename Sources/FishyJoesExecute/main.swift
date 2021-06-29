import FishyJoesCore
import SourceryRuntime
import Foundation

guard CommandLine.argc == 2,
      let context = ProcessInfo.processInfo.context else {
    fatalError("fishy-joes is not meant to be called directly, but by sourcery using the template `FishyJoes.swifttemplate`")
}

print(FishyJoesContext(context: context).translateAll())
