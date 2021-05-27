import SourceryRuntime

class SourceFragment {
    var sourceryDestination: String
    var stringBuilder: [String] = []
    var isFreshLine = true
    var currentIndent = 0

    init(sourceryDestination: String) {
        self.sourceryDestination = sourceryDestination
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

    func output() {
        isFreshLine = true
        stringBuilder.append("\n")
    }

    func output(_ line: String, newLineTerminated: Bool = true) {
        if isFreshLine {
            stringBuilder.append(String(repeating: " ", count: 4 * currentIndent))
        }
        stringBuilder.append(line)
        if newLineTerminated {
            stringBuilder.append("\n")
        }
        isFreshLine = newLineTerminated
    }

    func outputBlock<R>(_ openingLine: String, closeWith close: String? = nil, newLineTerminated: Bool = true, _ body: () throws -> R) rethrows -> R {
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
        output(matchingClose, newLineTerminated: newLineTerminated)
        return result
    }

    func outputMap<S: Sequence>(_ source: S, separator: String, _ body: (S.Element) throws -> String) rethrows {
        var first = true
        for element in source {
            if !first {
                output(separator)
            }
            first = false
            output(try body(element), newLineTerminated: false)
        }
        if !first {
            output()
        }
    }

    func indent<R>(_ body: () throws -> R) rethrows -> R {
        currentIndent += 1
        defer { currentIndent -= 1 }
        return try body()
    }
}
