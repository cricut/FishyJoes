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
}
