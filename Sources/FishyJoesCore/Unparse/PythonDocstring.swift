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
        var lines = documentation
            .filter { !isAnnotationLine($0) }
            .map(escape)
        while lines.first?.trimmingCharacters(in: .whitespaces).isEmpty == true {
            lines.removeFirst()
        }
        while lines.last?.trimmingCharacters(in: .whitespaces).isEmpty == true {
            lines.removeLast()
        }
        return lines
    }

    private static func isAnnotationLine(_ line: String) -> Bool {
        let trimmed = line.trimmingCharacters(in: .whitespaces)
        return trimmed.hasPrefix("<!--") && trimmed.hasSuffix("-->")
    }

    private static func escape(_ line: String) -> String {
        line
            .replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "\"\"\"", with: "\\\"\\\"\\\"")
    }

    /// A single-line docstring ending in a quote would produce `""""`;
    /// escape the final quote so the delimiter stays unambiguous.
    private static func closingSafe(_ line: String) -> String {
        line.hasSuffix("\"") ? String(line.dropLast()) + "\\\"" : line
    }
}
