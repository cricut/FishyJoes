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
        if let message = attr.arguments["message"] as? String {
            self.message = message.trimmingCharacters(in: ["\""])
        } else if let renamed = attr.arguments["renamed"] as? String {
            self.message = "replace with `\(renamed.trimmingCharacters(in: ["\""]))`" +
                " (This is the swift name of the replacement function, due to technical limitations)"
        } else {
            self.message = attr.description
        }
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
