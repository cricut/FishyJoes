import Foundation

public protocol SourceFragmentHeader {
    func combine(with other: any SourceFragmentHeader) -> any SourceFragmentHeader
    func renderLines() -> [String]
}

public class SourceFragment {
    public struct NoHeader: SourceFragmentHeader {
        public func combine(with other: any SourceFragmentHeader) -> any SourceFragmentHeader { other }
        public func renderLines() -> [String] { [] }
    }

    private let spacesPerIndent = 4
    public var destinationPath: String?
    public var createIntermediateDirectories: Bool
    public var stringBuilder: [String] = []
    private var isFreshLine = true
    private var currentIndent = 0

    public var header: some SourceFragmentHeader { NoHeader() }

    // Creating directories defaults to false to help avoid writing files into non-agreeing directories
    public init(destinationPath: String?, createIntermediateDirectories: Bool = false) {
        self.destinationPath = destinationPath
        self.createIntermediateDirectories = createIntermediateDirectories
    }

    // Copy fragment contents into a new fragment with a different path
    public func duplicate(destinationPath: String?, createIntermediateDirectories: Bool = false) -> SourceFragment {
        let result = SourceFragment(
            destinationPath: destinationPath,
            createIntermediateDirectories: createIntermediateDirectories
        )
        result.stringBuilder = self.stringBuilder
        return result
    }

    private func append(fragments: [String]) {
        stringBuilder.append(contentsOf: fragments)
    }

    public var contents: String {
        stringBuilder
            .joined()
            .trimmingCharacters(in: CharacterSet(charactersIn: "\n"))
            + "\n"
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

    private var currentIndentString: String {
        String(repeating: " ", count: spacesPerIndent * currentIndent)
    }

    public func output(_ line: String, newLineTerminated: Bool = true) {
        let line = newLineTerminated ? line.replacingOccurrences(of: #"[ \t]+$"#, with: "", options: .regularExpression) : line
        if line.isEmpty, newLineTerminated, isFreshLine {
            output()
            return
        }
        if isFreshLine {
            stringBuilder.append(currentIndentString)
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
            case ":":
                matchingClose = ""
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

    private static func combine(headers: [any SourceFragmentHeader]) -> any SourceFragmentHeader {
        headers.reduce(NoHeader()) {
            $0.combine(with: $1)
        }
    }

    // Concatenate SourceFragments and group by destination
    public static func combine(fragments: [SourceFragment]) -> [(path: String?, contents: String, createIntermediateDirectories: Bool)] {
        var collated: [String?: [SourceFragment]] = [:]
        for fragment in fragments {
            collated[fragment.destinationPath, default: []].append(fragment)
        }
        return collated.map {
            let (destination, fragments) = $0

            let header = combine(headers: fragments.map { $0.header })
            let combinedContents = fragments.map(\.contents).joined(separator: "\n")
            let createIntermediateDirectories = fragments.contains(where: \.createIntermediateDirectories)
            return (path: destination, contents: combinedContents, createIntermediateDirectories: createIntermediateDirectories)
        }.sorted { $0.path ?? "" < $1.path ?? "" }
    }

    public func conditionalWrap(if condition: Bool, wrapper: (_ inner: () -> Void) -> Void, body: @escaping () -> Void) {
        if condition {
            wrapper(body)
        } else {
            body()
        }
    }
}

extension SourceFragment: Comparable {
    public static func == (lhs: SourceFragment, rhs: SourceFragment) -> Bool {
        (lhs.destinationPath, lhs.stringBuilder) ==
            (rhs.destinationPath, rhs.stringBuilder)
    }

    public static func < (lhs: SourceFragment, rhs: SourceFragment) -> Bool {
        guard lhs.destinationPath == rhs.destinationPath else {
            return lhs.destinationPath ?? "" < rhs.destinationPath ?? ""
        }
        return lhs.contents < rhs.contents
    }
}
