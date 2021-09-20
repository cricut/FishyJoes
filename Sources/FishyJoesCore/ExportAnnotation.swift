import SourceryRuntime
import Foundation

struct ExportAnnotation {
    let exportAsReference: Bool
    let c: String?
    let cSet: String?
    let js: String?
    let genericOverrides: [String: BetterType]
    let omitParameters: [String]

    indirect enum SimpleParse: Hashable {
        case token(String)
        case comma
        case colon
        case parenthesized([SimpleParse])
        case squareBracketed([SimpleParse])
        case curlyBracketed([SimpleParse])
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

extension Annotated {
    var exportAnnotation: ExportAnnotation? {
        for (key, value) in annotations {
            guard key.hasPrefix("\"export(") || key.hasPrefix("\"exportReference(") else {
                // TODO: remove after things stabilize to allow compatibility with other templates
                fatalErr("unknown attribute \(key) = \(value)")
                // continue
            }
            let parts = key.split(separator: "(", maxSplits: 1)
            let annotationName = String(parts[0].dropFirst())
            guard parts[1].hasSuffix(")\"") else {
                fatalErr("missing close ')\"' in \(key)")
            }

            let foo = String(parts[1].dropLast(2))
            guard let tree = ExportAnnotation.SimpleParse.parse(foo) else {
                fatalErr("couldn't parse annotation \(key)")
            }

            var attrs: [String: ExportAnnotation.SimpleParse] = [:]
            for commaSeparatedBit in tree.split(separator: .comma).map({ Array($0) }) {
                guard commaSeparatedBit.count == 3,
                      case .token(let attrKey) = commaSeparatedBit[0],
                      .colon == commaSeparatedBit[1]
                else {
                    fatalErr("invalid attribute in \(key): \(commaSeparatedBit)")
                }
                attrs[attrKey] = commaSeparatedBit[2]
            }

            if let unknown = Set(attrs.keys).subtracting(["c", "cSet", "js", "omitParameters", "generic"]).first {
                fatalErr("unknown attribute \(unknown) in \(key)")
            }

            var omitParameters: [String] = []
            if let omitParse = attrs["omitParameters"] {
                guard case .squareBracketed(let omitList) = omitParse else {
                    fatalErr("invalid omitParameters in \(key). Expected [name, ...]")
                }
                omitParameters = omitList.split(separator: .comma).map { tokens in
                    guard tokens.count == 1,
                          case .token(let name) = tokens.first
                    else {
                        fatalErr("invalid omitParameters in \(key). Expected [name, ...]")
                    }
                    return name
                }
            }

            var genericOverrides: [String: BetterType] = [:]
            if let genericParse = attrs["generic"] {
                guard case .squareBracketed(let list) = genericParse else {
                    fatalErr("invalid generic in \(key). Expected [type: substitute, ...]")
                }
                for parts in list.split(separator: .comma) {
                    guard parts.count == 3,
                          case .token(let generic) = parts[0],
                          case .colon = parts[1]
                    else {
                        fatalErr("invalid omitParameters in \(key). Expected [type: substitute, ...]")
                    }
                    genericOverrides[generic] = parts[2].asType
                }
            }

            func idAttr(_ key: String) -> String? {
                guard let tree = attrs[key] else { return nil }
                guard case .token(let id) = tree else {
                    fatalErr("invalid identifier \(tree) in attribute \(key)")
                }
                return id
            }

            return ExportAnnotation(
                exportAsReference: annotationName == "exportReference",
                c: idAttr("c"),
                cSet: idAttr("cSet"),
                js: idAttr("js"),
                genericOverrides: genericOverrides,
                omitParameters: omitParameters
            )
        }
        return nil
    }
}
