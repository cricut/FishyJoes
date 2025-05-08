import Foundation
import SourceryDataModel

struct Deprecation: Hashable {
    let message: String
    let swiftDeprecation: String
}

extension Deprecation {
    init?(from attributes: [SourceryAttribute]) {
        guard let attr = attributes.first(where: { $0.name == "available" && $0.arguments.values.contains("deprecated") }) else {
            return nil
        }
        if let message = attr.arguments["message"] {
            self.message = message.trimmingCharacters(in: ["\""])
        } else if let renamed = attr.arguments["renamed"] {
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

extension SourceryMethod {
    var deprecation: Deprecation? {
        Deprecation(from: attributes)
    }
}

extension SourceryVariable {
    var deprecation: Deprecation? {
        Deprecation(from: attributes)
    }
}
