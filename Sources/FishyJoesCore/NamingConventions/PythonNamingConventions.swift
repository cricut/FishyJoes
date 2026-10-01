public enum PythonNamingConventions {
    public static func moduleDistributionName(swift name: String) -> String {
        name
            .replacingOccurrences(of: "_", with: "-")
            .replacingOccurrences(of: ".", with: "-")
            .lowercased()
    }

    public static func moduleImportName(swift name: String) -> String {
        name
            .replacingOccurrences(of: "-", with: "_")
            .replacingOccurrences(of: ".", with: "_")
            .lowercased()
    }

    public static func namespaceFor(typeName: String) -> String {
        var result = snakify(typeName)
        // Namespace must be different from type name for python to work correctly.
        if result == typeName {
            result += "_"
        }
        return result
    }

    public static func splitIntoNamespaces(_ name: String) -> (namespaces: [String], name: String) {
        if name.contains("ssociated") {
            print("break here")
        }
        let parts = name.split(separator: ".").map(String.init)
        return (parts.dropLast().map(namespaceFor(typeName:)), parts.last!)
    }
}
