/// Renders FishyJoes documentation metadata as Python docstring lines.
///
/// One renderer feeds both generated `.py` wrappers and `.pyi` stubs so the
/// two surfaces cannot diverge. See decision 0013.
enum PythonDocstring {
    /// Returns the docstring block for the given documentation lines, or an
    /// empty array when nothing user-facing remains after filtering.
    static func lines(_ documentation: [String]) -> [String] {
        let content = renderableLines(documentation)
        guard let first = content.first else { return [] }
        if content.count == 1 {
            return ["\"\"\"\(closingSafe(first))\"\"\""]
        }
        return ["\"\"\"\(first)"] + content.dropFirst() + ["\"\"\""]
    }

    private static func renderableLines(_ documentation: [String]) -> [String] {
        documentation.map(escape)
    }

    private static func escape(_ line: String) -> String {
        line
            .replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "\"\"\"", with: "\\\"\\\"\\\"")
    }

    /// A single-line docstring ending in an unescaped quote would produce
    /// `""""`, making the closing delimiter ambiguous. Escape only a *literal*
    /// trailing quote: a quote that `escape(_:)` already turned into `\"` (for
    /// example from a trailing `"""`) is preceded by an odd number of
    /// backslashes and must be left intact, otherwise dropping it would orphan
    /// a backslash and produce an unterminated string literal.
    private static func closingSafe(_ line: String) -> String {
        guard line.hasSuffix("\"") else { return line }
        let withoutFinalQuote = line.dropLast()
        let trailingBackslashes = withoutFinalQuote.reversed().prefix { $0 == "\\" }.count
        guard trailingBackslashes.isMultiple(of: 2) else { return line }
        return String(withoutFinalQuote) + "\\\""
    }
}
