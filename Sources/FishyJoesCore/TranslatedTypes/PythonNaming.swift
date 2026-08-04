import Foundation

/// Python identifier and name shaping shared by `PythonTranslator` (member,
/// class, and module names) and `PythonTranslationContext` (annotation class
/// names), so the rules — keyword reservation, builtin/case handling, snake
/// casing — live in exactly one place.
enum PythonNaming {
    static func moduleName(_ name: String) -> String {
        safeIdentifier(name)
    }

    static func className(_ name: String) -> String {
        name.replacingOccurrences(of: ".", with: "_")
    }

    static func stringLiteral(_ value: String) -> String {
        "\"\(value.replacingOccurrences(of: "\\", with: "\\\\").replacingOccurrences(of: "\"", with: "\\\""))\""
    }

    static func safeIdentifier(_ name: String) -> String {
        var identifier = pythonName(swiftIdentifierName(name)).trimmingCharacters(in: CharacterSet(charactersIn: "_"))
        if identifier.isEmpty {
            identifier = "value"
        }
        if identifier.first?.isNumber == true {
            identifier = "value_\(identifier)"
        }
        if isReserved(identifier) {
            identifier += "_"
        }
        return identifier
    }

    static func safeAssociatedValueIdentifier(_ name: String) -> String {
        let normalized = swiftIdentifierName(name)
        let pythonIdentifier = pythonName(normalized)
        if pythonIdentifier.hasPrefix("_") || pythonIdentifier.first?.isNumber == true {
            return "m_\(pythonIdentifier.trimmingCharacters(in: CharacterSet(charactersIn: "_")))"
        }
        return safeIdentifier(normalized)
    }

    static func isReserved(_ name: String) -> Bool {
        reservedNames.contains(name)
    }

    static func canEmitStubAttribute(_ name: String) -> Bool {
        guard name.range(of: #"^[A-Za-z_][A-Za-z0-9_]*$"#, options: .regularExpression) != nil else {
            return false
        }
        return !syntaxNames.contains(name)
    }

    private static func pythonName(_ name: String) -> String {
        let normalized = name
            .replacingOccurrences(of: "NaN", with: "Nan")
            .replacingOccurrences(of: "UInt", with: "Uint")
            .replacingOccurrences(of: "URL", with: "Url")
            .replacingOccurrences(of: "UTF", with: "Utf")
        return snakify(normalized).lowercased()
    }

    private static func swiftIdentifierName(_ name: String) -> String {
        name.unescapedSwiftIdentifier
    }

    /// Names that cannot appear as a bare class-level stub attribute: Python
    /// keywords plus the `True`/`False`/`None` constants.
    static let syntaxNames: Set<String> = keywords.union([
        "False",
        "None",
        "True",
    ])

    /// Identifiers `safeIdentifier` must never produce: Python keywords plus the
    /// synthesized method receivers `self` and `cls`. A Swift parameter or
    /// associated value named `self`/`cls` would otherwise collide with the
    /// receiver in the generated `def`, e.g. `def case(cls, cls)`.
    static let reservedNames: Set<String> = keywords.union([
        "cls",
        "self",
    ])

    private static let keywords: Set<String> = [
        "and",
        "as",
        "assert",
        "async",
        "await",
        "break",
        "case",
        "class",
        "continue",
        "def",
        "del",
        "elif",
        "else",
        "except",
        "finally",
        "for",
        "from",
        "global",
        "if",
        "import",
        "in",
        "is",
        "lambda",
        "match",
        "nonlocal",
        "not",
        "or",
        "pass",
        "raise",
        "return",
        "try",
        "while",
        "with",
        "yield",
    ]
}
