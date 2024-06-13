import SourceryRuntime

class SourceFragment {
    static let spacesPerIndent = 4
    var sourceryDestination: String
    var stringBuilder: [String] = []
    var isFreshLine = true
    var currentIndent = 0
    var sortKey: String

    init(sourceryDestination: String, sortKey: String) {
        self.sourceryDestination = sourceryDestination
        self.sortKey = sortKey
    }

    func append(fragments: [String]) {
        stringBuilder.append(contentsOf: fragments)
    }

    var contents: String {
        """
            // sourcery:\(sourceryDestination)
            \(stringBuilder.joined())
            // sourcery:end

            """
    }

    func blankLine() {
        if !stringBuilder.suffix(2).joined().hasSuffix("\n\n") {
            output()
        }
    }

    func output() {
        isFreshLine = true
        stringBuilder.append("\n")
    }

    var currentIndentString: String {
        String(repeating: " ", count: SourceFragment.spacesPerIndent * currentIndent)
    }

    func output(_ line: String, newLineTerminated: Bool = true, semicolonTerminated: Bool = false) {
        if isFreshLine {
            stringBuilder.append(currentIndentString)
        }
        stringBuilder.append(line)
        if semicolonTerminated {
            stringBuilder.append(";")
        }
        if newLineTerminated {
            stringBuilder.append("\n")
        }
        isFreshLine = newLineTerminated
    }

    func outputBlock<R>(_ openingLine: String, closeWith close: String? = nil, newLineTerminated: Bool = true, semicolonTerminated: Bool = false, _ body: () throws -> R) rethrows -> R {
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
        output(matchingClose, newLineTerminated: newLineTerminated, semicolonTerminated: semicolonTerminated)
        return result
    }

    func outputMap<S: Sequence>(_ source: S, separator: String, newLineTerminated: Bool = true, _ body: (S.Element) throws -> String) rethrows {
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

    func indent<R>(_ body: () throws -> R) rethrows -> R {
        currentIndent += 1
        defer { currentIndent -= 1 }
        return try body()
    }
}
