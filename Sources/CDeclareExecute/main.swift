import CDeclareLib
import SourceryRuntime
import Foundation

let context = ProcessInfo.processInfo.context!
print(CDeclareContext(context: context).translateAll())
