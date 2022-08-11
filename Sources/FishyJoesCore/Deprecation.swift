import Foundation
import SourceryRuntime

struct Deprecation: Hashable {
    let message: String
    let swiftDeprecation: String
}

extension Deprecation {
    init?(from attributes: AttributeList) {
        guard let attr = attributes["available"]?.first,
              attr.arguments.values.contains("deprecated" as NSString)
        else {
            return nil
        }
        message = attr.arguments["message"] as? String ??
            (attr.arguments["renamed"] as? String).map { "replace with `\($0)` ( <-- swift name, sorry )" } ??
            attr.description
        swiftDeprecation = attr.description
    }

    var quotedMessage: String {
        message
            .replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "\"", with: "\\\"")
    }
}

extension SourceryRuntime.Method {
    var deprecation: Deprecation? {
        Deprecation(from: attributes)
    }
}

extension SourceryRuntime.Variable {
    var deprecation: Deprecation? {
        Deprecation(from: attributes)
    }
}
