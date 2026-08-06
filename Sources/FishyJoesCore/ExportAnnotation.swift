import Foundation
import SourceryDataModel

private enum AttributeName: String, Hashable, CaseIterable {
    case omitParameters
    case generic
    case `override`
    case cSharp
    case noReturn
    case compatibilityOrder
}

struct ExportAnnotation: Hashable {
    let kind: Kind
    let name: String
    let cSharpName: String
    let isOverride: Bool
    let noReturn: Bool
    let genericOverrides: [String: BetterType]
    let omitParameters: [String]
    let compatibilityOrder: [String]

    init(
        kind: Kind = .unmodified,
        name: String,
        cSharpName: String?,
        isOverride: Bool = false,
        noReturn: Bool = false,
        genericOverrides: [String: BetterType] = [:],
        omitParameters: [String] = [],
        compatibilityOrder: [String] = []
    ) {
        self.kind = kind
        self.name = name
        self.cSharpName = cSharpName ?? name
        self.isOverride = isOverride
        self.noReturn = noReturn
        self.genericOverrides = genericOverrides
        self.omitParameters = omitParameters
        self.compatibilityOrder = compatibilityOrder
    }

    indirect enum SimpleParse: Hashable {
        case token(String)
        case comma
        case colon
        case parenthesized([SimpleParse])
        case squareBracketed([SimpleParse])
        case curlyBracketed([SimpleParse])
    }

    enum Kind: String, Hashable, CaseIterable {
        case unmodified = "export"
        case asReference = "exportReference"
        case asMethod = "exportAsMethod"
    }

    enum ParseError: Error, Equatable {
        case invalidSyntax
        case unknownKind(String)
        case invalidExportName([SimpleParse])
    }

    struct ParsedDocumentationHeader: Equatable {
        let annotationText: String
        let kind: Kind
        let exportName: String
        let remainingTree: [SimpleParse]
    }

    private static let annotationPattern = try! NSRegularExpression(
        pattern: #"^\s*<!--\s*FishyJoes\.([A-Za-z_][A-Za-z0-9_]*)\((.*)\)\s*-->\s*$"#
    )

    static func parseDocumentationHeader(from docLine: String) -> Result<ParsedDocumentationHeader, ParseError>? {
        guard let rawAnnotation = rawAnnotationText(in: docLine) else { return nil }

        let nsString = rawAnnotation as NSString
        guard let match = annotationPattern.firstMatch(
            in: rawAnnotation,
            range: NSRange(location: 0, length: nsString.length)
        ) else {
            return .failure(.invalidSyntax)
        }

        let annotationName = nsString.substring(with: match.range(at: 1))
        guard let kind = Kind(rawValue: annotationName) else {
            return .failure(.unknownKind(annotationName))
        }

        let parseString = nsString.substring(with: match.range(at: 2))
        guard var tree = SimpleParse.parse(parseString) else {
            return .failure(.invalidSyntax)
        }

        let exportName: String
        switch tree.first3 {
        case (.token(let name), nil, nil), (.token(let name), .comma, .some):
            exportName = name
            tree.removeFirst(min(2, tree.count))
        default:
            return .failure(.invalidExportName(tree))
        }

        return .success(
            .init(
                annotationText: rawAnnotation,
                kind: kind,
                exportName: exportName,
                remainingTree: tree
            )
        )
    }

    private static func rawAnnotationText(in line: String) -> String? {
        guard let start = line.range(of: "<!--"),
              let end = line.range(of: "-->", range: start.upperBound ..< line.endIndex)
        else {
            return nil
        }
        let rawAnnotation = line[start.lowerBound ..< end.upperBound].trimmingCharacters(in: .whitespaces)
        guard rawAnnotation.contains("FishyJoes.") else { return nil }
        return rawAnnotation
    }
}

extension ExportAnnotation.SimpleParse {
    struct Reader {
        var data: String
        var pos: String.Index
    }

    static func parse(_ source: String) -> [Self]? {
        var reader = Reader(data: source, pos: source.startIndex)
        let result = reader.parseMultiple()
        if reader.peek != nil {
            // unexpected end of parse, a failure
            return nil
        }
        return result
    }

    var asString: String {
        switch self {
        case .token(let str): return str
        case .comma: return ","
        case .colon: return ":"
        case .parenthesized(let parts): return "(\(parts.map(\.asString).joined(separator: " ")))"
        case .squareBracketed(let parts): return "[\(parts.map(\.asString).joined(separator: " "))]"
        case .curlyBracketed(let parts): return "{\(parts.map(\.asString).joined(separator: " "))}"
        }
    }

    var asType: BetterType {
        switch self {
        case .token(let str): return .named(.init(name: str, module: nil))
        case .squareBracketed(let parts) where parts.count == 1:
            return .array(parts[0].asType)
        case .squareBracketed(let parts) where parts.count == 3 && parts[1] == .colon:
            return .dictionary(parts[0].asType, parts[2].asType)
        default:
            fatalErr("don't know how to parse \(self.asString) as a type")
        }
    }
}

extension ExportAnnotation.SimpleParse.Reader {
    var peek: Character? {
        return pos < data.endIndex ? data[pos] : nil
    }

    @discardableResult
    mutating func pop() -> Character? {
        defer { pos = data.index(after: pos) }
        return peek
    }

    mutating func parseMultiple() -> [ExportAnnotation.SimpleParse]? {
        func isIdentifierCharacter(_ character: Character) -> Bool {
            character.isLetter || character.isNumber || character == "." || character == "_"
        }

        var result: [ExportAnnotation.SimpleParse] = []
        while let next = peek {
            switch next {
            case _ where next.isWhitespace:
                pop()
            case ",":
                pop()
                result.append(.comma)
            case ":":
                pop()
                result.append(.colon)
            case "(":
                pop()
                guard let subList = parseMultiple(), pop() == ")" else {
                    return nil
                }
                result.append(.parenthesized(subList))
            case "[":
                pop()
                guard let subList = parseMultiple(), pop() == "]" else {
                    return nil
                }
                result.append(.squareBracketed(subList))
            case "{":
                pop()
                guard let subList = parseMultiple(), pop() == "}" else {
                    return nil
                }
                result.append(.curlyBracketed(subList))
            case "]", ")", "}":
                return result
            case _ where isIdentifierCharacter(next):
                let tokenEnd = data[pos...].firstIndex { !isIdentifierCharacter($0) } ?? data.endIndex
                result.append(.token(String(data[pos ..< tokenEnd])))
                pos = tokenEnd
            default:
                return nil
            }
        }
        return result
    }
}

extension Documented {
    var exportAnnotation: ExportAnnotation? {
        for docLine in documentation {
            guard let parsedHeader = ExportAnnotation.parseDocumentationHeader(from: docLine) else { continue }

            let header: ExportAnnotation.ParsedDocumentationHeader
            switch parsedHeader {
            case .success(let parsed):
                header = parsed
            case .failure(.unknownKind):
                // TODO: remove after things stabilize to allow compatibility with other templates
                fatalErr("unknown FishyJoes annotation: \(docLine)")
                // continue
            case .failure(.invalidSyntax):
                fatalErr("couldn't parse annotation: \(docLine)")
            case .failure(.invalidExportName(let tree)):
                fatalErr("Expected export name first in export annotation: \(tree.map(\.asString))")
            }

            let tree = header.remainingTree

            var attrs: [AttributeName: ExportAnnotation.SimpleParse] = [:]
            for commaSeparatedBit in tree.split(separator: .comma).map({ Array($0) }) {
                switch commaSeparatedBit.first4 {
                case (.token(let key), .colon, .some(let value), nil):
                    guard let attrName = AttributeName(rawValue: key) else {
                        fatalErr("unknown attribute \(key) in \(docLine)")
                    }
                    attrs[attrName] = value
                default:
                    fatalErr("invalid attribute in \(docLine): \(commaSeparatedBit)")
                }
            }

            var omitParameters: [String] = []
            if let omitParse = attrs[.omitParameters] {
                guard case .squareBracketed(let omitList) = omitParse else {
                    fatalErr("invalid omitParameters in \(docLine). Expected [name, ...]")
                }
                for tokens in omitList.split(separator: .comma) {
                    guard case (.token(let name), nil) = tokens.first2 else {
                        fatalErr("invalid omitParameters in \(docLine). Expected [name, ...]")
                    }
                    omitParameters.append(name)
                }
            }

            var compatibilityOrder: [String] = []
            if let parse = attrs[.compatibilityOrder] {
                guard case .squareBracketed(let paramList) = parse else {
                    fatalErr("invalid compatibilityOrder in \(docLine). Expected [name, ...]")
                }
                compatibilityOrder = paramList.split(separator: .comma).map { tokens in
                    guard case (.token(let name), nil) = tokens.first2 else {
                        fatalErr("invalid compatibilityOrder in \(docLine). Expected [name, ...]")
                    }
                    return name
                }
            }

            var cSharpName: String?
            if let cSharpParse = attrs[.cSharp] {
                guard case .token(let name) = cSharpParse else {
                    fatalErr("invalid cSharp name in \(docLine).")
                }
                cSharpName = name
            }

            var genericOverrides: [String: BetterType] = [:]
            if let genericParse = attrs[.generic] {
                guard case .squareBracketed(let list) = genericParse else {
                    fatalErr("invalid generic in \(docLine). Expected [type: substitute, ...]")
                }
                for parts in list.split(separator: .comma) {
                    guard parts.count == 3,
                          case .token(let generic) = parts[0],
                          case .colon = parts[1]
                    else {
                        fatalErr("invalid generic in \(docLine). Expected [type: substitute, ...]")
                    }
                    genericOverrides[generic] = parts[2].asType
                }
            }

            var isOverride = false
            if case .token("true") = attrs[.override] {
                isOverride = true
            }

            var noReturn = false
            if case .token("true") = attrs[.noReturn] {
                noReturn = true
            }

            // func idAttr(_ key: String) -> String? {
            //     guard let tree = attrs[key] else { return nil }
            //     guard case .token(let id) = tree else {
            //         fatalErr("invalid identifier \(tree) in attribute \(key)")
            //     }
            //     return id
            // }

            return ExportAnnotation(
                kind: header.kind,
                name: header.exportName,
                cSharpName: cSharpName,
                isOverride: isOverride,
                noReturn: noReturn,
                genericOverrides: genericOverrides,
                omitParameters: omitParameters,
                compatibilityOrder: compatibilityOrder
            )
        }
        return nil
    }
}
