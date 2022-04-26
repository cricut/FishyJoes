import Foundation
import SourceryRuntime

struct ExportAnnotation: Hashable {
    let kind: Kind
    let name: String
    let isOverride: Bool
    let genericOverrides: [String: BetterType]
    let omitParameters: [String]

    init(
        kind: Kind = .unmodified,
        name: String,
        isOverride: Bool = false,
        genericOverrides: [String: BetterType] = [:],
        omitParameters: [String] = []
    ) {
        self.kind = kind
        self.name = name // ?? "_\(UUID())".replacingOccurrences(of: "-", with: "_")
        self.isOverride = isOverride
        self.genericOverrides = genericOverrides
        self.omitParameters = omitParameters
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
        case .token(let str): return .named(.init(name: str))
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
            character.isLetter || character.isNumber || character == "."
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

private let annotationPattern = try! NSRegularExpression(pattern: #"^\s*<!--\s*FishyJoes\.(.*)\((.*)\)\s*-->\s*$"#)
extension Documented {
    var exportAnnotation: ExportAnnotation? {
        for docLine in documentation {
            let nsString = docLine as NSString
            guard let match = annotationPattern.firstMatch(in: docLine, range: NSRange(location: 0, length: nsString.length)) else {
                continue
            }
            let annotationName = nsString.substring(with: match.range(at: 1))
            guard let kind = ExportAnnotation.Kind(rawValue: annotationName) else {
                // TODO: remove after things stabilize to allow compatibility with other templates
                fatalErr("unknown FishyJoes annotation: \(docLine)")
                // continue
            }

            let parseString = nsString.substring(with: match.range(at: 2))
            guard var tree = ExportAnnotation.SimpleParse.parse(parseString) else {
                fatalErr("couldn't parse annotation: \(docLine)")
            }

            let exportName: String
            switch tree.first3 {
            case (.token(let name), nil, nil), (.token(let name), .comma, .some):
                exportName = name
                tree.removeFirst(min(2, tree.count))
            default:
                fatalErr("Expected export name first in export annotation: \(tree.map(\.asString))")
            }

            var attrs: [String: ExportAnnotation.SimpleParse] = [:]
            for commaSeparatedBit in tree.split(separator: .comma).map({ Array($0) }) {
                switch commaSeparatedBit.first4 {
                case (.token(let key), .colon, .some(let value), nil):
                    attrs[key] = value
                default:
                    fatalErr("invalid attribute in \(docLine): \(commaSeparatedBit)")
                }
            }

            if let unknown = Set(attrs.keys).subtracting(["omitParameters", "generic", "override"]).first {
                fatalErr("unknown attribute \(unknown) in \(docLine)")
            }

            var omitParameters: [String] = []
            if let omitParse = attrs["omitParameters"] {
                guard case .squareBracketed(let omitList) = omitParse else {
                    fatalErr("invalid omitParameters in \(docLine). Expected [name, ...]")
                }
                omitParameters = omitList.split(separator: .comma).map { tokens in
                    guard tokens.count == 1,
                          case .token(let name) = tokens.first
                    else {
                        fatalErr("invalid omitParameters in \(docLine). Expected [name, ...]")
                    }
                    return name
                }
            }

            var genericOverrides: [String: BetterType] = [:]
            if let genericParse = attrs["generic"] {
                guard case .squareBracketed(let list) = genericParse else {
                    fatalErr("invalid generic in \(docLine). Expected [type: substitute, ...]")
                }
                for parts in list.split(separator: .comma) {
                    guard parts.count == 3,
                          case .token(let generic) = parts[0],
                          case .colon = parts[1]
                    else {
                        fatalErr("invalid omitParameters in \(docLine). Expected [type: substitute, ...]")
                    }
                    genericOverrides[generic] = parts[2].asType
                }
            }

            var isOverride = false
            if case .token("true") = attrs["override"] {
                isOverride = true
            }

            // func idAttr(_ key: String) -> String? {
            //     guard let tree = attrs[key] else { return nil }
            //     guard case .token(let id) = tree else {
            //         fatalErr("invalid identifier \(tree) in attribute \(key)")
            //     }
            //     return id
            // }

            return ExportAnnotation(
                kind: kind,
                name: exportName,
                isOverride: isOverride,
                genericOverrides: genericOverrides,
                omitParameters: omitParameters
            )
        }
        return nil
    }
}
