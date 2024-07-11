public class SourceFragment {
    public var sourceryDestination: String?
    private var stringBuilder: [String] = []
    private var isFreshLine = true
    private var currentIndent = 0

    public init(sourceryDestination: String?) {
        self.sourceryDestination = sourceryDestination
    }

    private func append(fragments: [String]) {
        stringBuilder.append(contentsOf: fragments)
    }

    public var contents: String {
        if let sourceryDestination = sourceryDestination {
            return """
                // sourcery:\(sourceryDestination)
                \(stringBuilder.joined())
                // sourcery:end

                """
        } else {
            return "\(stringBuilder.joined())\n"
        }
    }

    public func blankLine() {
        if !stringBuilder.suffix(2).joined().hasSuffix("\n\n") {
            output()
        }
    }

    public func output() {
        isFreshLine = true
        stringBuilder.append("\n")
    }

    public func output(_ line: String, newLineTerminated: Bool = true) {
        if isFreshLine {
            stringBuilder.append(String(repeating: " ", count: 4 * currentIndent))
        }
        stringBuilder.append(line)
        if newLineTerminated {
            stringBuilder.append("\n")
        }
        isFreshLine = newLineTerminated
    }

    public func dedentedOutput(_ line: String, newLineTerminated: Bool = true) {
        dedent { output(line, newLineTerminated: newLineTerminated) }
    }

    public func outputBlock<R>(_ openingLine: String, closeWith close: String? = nil, newLineTerminated: Bool = true, _ body: () throws -> R) rethrows -> R {
        output(openingLine)
        let matchingClose: String
        if let close = close {
            matchingClose = close
        } else {
            switch openingLine.last {
            case "{":
                matchingClose = "}"
            case "(":
                matchingClose = ")"
            case "[":
                matchingClose = "]"
            default:
                fatalErr("don't know how to close \"\(openingLine)\". Specify explicitly.")
            }
        }
        let result = try indent(body)

        // eat newline before close brace
        let previousLines = stringBuilder.suffix(2)
        if previousLines.count == 2, previousLines.last == "\n", previousLines.first?.hasSuffix("\n") == true {
            _ = stringBuilder.popLast()
        }
        output(matchingClose, newLineTerminated: newLineTerminated)
        return result
    }

    public func outputMap<S: Sequence>(_ source: S, separator: String, newLineTerminated: Bool = true, _ body: (S.Element) throws -> String) rethrows {
        var first = true
        for element in source {
            if !first {
                output(separator)
            }
            first = false
            output(try body(element), newLineTerminated: false)
        }
        if newLineTerminated, !first {
            output()
        }
    }

    public func indent<R>(_ body: () throws -> R) rethrows -> R {
        currentIndent += 1
        defer { currentIndent -= 1 }
        return try body()
    }

    public func dedent<R>(_ body: () throws -> R) rethrows -> R {
        currentIndent -= 1
        defer { currentIndent += 1 }
        return try body()
    }
}
