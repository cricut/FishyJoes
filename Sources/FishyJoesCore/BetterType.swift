import Foundation
import SourceryRuntime

// SourceryRuntime.TypeName is bad; Types are trees, not structs full of booleans.
// An Optional<Int> isn't a Int that happens to be optional, it's an Optional that may contain an Int!
indirect enum BetterType: Codable, Hashable {
    struct Name: Codable, Hashable {
        let name: String
        var namespace: [String]
    }

    case named(Name)
    case tuple([TupleElement])
    case void
    case function([BetterType], BetterType)
    case generic(base: Name, args: [BetterType])
    case selfType

    struct TupleElement: Codable, Hashable {
        let label: String
        let type: BetterType
    }
}

extension BetterType {
    static func `optional`(_ wrapped: BetterType) -> BetterType {
        .generic(base: "Optional", args: [wrapped])
    }

    static func array(_ element: BetterType) -> BetterType {
        .generic(base: "Array", args: [element])
    }

    static func dictionary(_ key: BetterType, _ value: BetterType) -> BetterType {
        .generic(base: "Dictionary", args: [key, value])
    }

    static func `set`(_ element: BetterType) -> BetterType {
        .generic(base: "Set", args: [element])
    }

    static func result(_ success: BetterType, _ failure: BetterType) -> BetterType {
        .generic(base: "Result", args: [success, failure])
    }
}

extension SourceryRuntime.`Type` {
    var namespace: [String] {
        globalName.split(separator: ".").dropLast().map(String.init)
    }
    var hashable: Bool {
        based["Hashable"] != nil
    }
    var equatable: Bool {
        hashable || based["Equatable"] != nil
    }
}

extension TypeName {
    // Unless I want to do my own parsing, I don't see a way to handle cases like `Int??` correctly...
    var better: BetterType {
        var name = self
        while let actual = name.actualTypeName {
            name = actual
        }

        var better: BetterType
        if name.isVoid {
            better = .void
        } else if let tuple = name.tuple {
            better = .tuple(tuple.elements.map { .init(label: $0.name!, type: $0.typeName.better) })
        } else if let array = name.array {
            better = .array(array.elementTypeName.better)
        } else if let dictionary = name.dictionary {
            better = .dictionary(dictionary.keyTypeName.better, dictionary.valueTypeName.better)
        } else if let closure = name.closure {
            better = .function(closure.parameters.map(\.typeName.better), closure.returnTypeName.better)
        } else if name.unwrappedTypeName == "Self" {
            better = .selfType
        } else if let generic = name.generic {
            better = .generic(base: .init(name: generic.name), args: generic.typeParameters.map(\.typeName.better))
        } else {
            better = .named(.init(name: name.unwrappedTypeName))
        }

        if name.isOptional || name.isImplicitlyUnwrappedOptional {
            better = .optional(better)
        }

        return better
    }
}

extension BetterType.Name: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        self.init(name: value)
    }

    init(name: String) {
        let parts = name.split(separator: ".").map(String.init)
        self.name = parts.last!
        self.namespace = Array(parts.dropLast())
    }

    var globalName: String {
        (namespace + [name]).joined(separator: ".")
    }

    var mangledName: String {
        globalName.mangled
    }
}

extension BetterType {
    init(named type: SourceryRuntime.`Type`) {
        self = .named(.init(name: type.globalName))
    }

    var name: String {
        switch self {
        case let .named(name):
            return (name.namespace + [name.name]).joined(separator: ".")
        case .tuple(let elements):
            return "(" + elements.map {
                if Int($0.label) == nil {
                    return "\($0.label): \($0.type.name)"
                } else {
                    return $0.type.name
                }
            }.joined(separator: ", ") + ")"
        case .void:
            return "Void"
        case .function(let args, let ret):
            return "(\(args.map(\.name).joined(separator: ", "))) -> \(ret.name)"
        case .generic(let base, let args):
            return "\(base.name)<\(args.map(\.name).joined(separator: ", "))>"
        case .selfType:
            return "Self"
        }
    }

    var namespace: [String] {
        switch self {
        case let .named(name):
            return name.namespace
        case let .generic(name, _):
            return name.namespace
        default:
            return []
        }
    }

    var genericBaseName: Name {
        switch self {
        case let .generic(name, _):
            return name
        case let .named(name):
            return name
        default:
            return Name(name: name, namespace: [])
        }
    }

    var isGeneric: Bool {
        switch self {
        case .generic, .tuple, .function:
            return true
        default:
            return false
        }
    }
}
