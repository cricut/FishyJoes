import Foundation
import SourceryRuntime

// SourceryRuntime.TypeName is bad; Types are trees, not structs full of booleans.
// An Optional<Int> isn't a Int that happens to be optional, it's an Optional that may contain an Int!
indirect enum BetterType: Codable, Hashable {
    struct Name: Codable, Hashable {
        var module: String?
        var namespace: [String]
        let name: String
    }

    case named(Name)
    case tuple([TupleElement])
    case void
    case function([BetterType], BetterType, isAsync: Bool, isThrowing: Bool)
    case generic(base: Name, args: [BetterType])
    case selfType

    struct TupleElement: Codable, Hashable {
        let label: String
        let type: BetterType
    }
}

extension BetterType {
    static func `optional`(_ wrapped: BetterType) -> BetterType {
        .generic(base: .swift("Optional"), args: [wrapped])
    }

    static func array(_ element: BetterType) -> BetterType {
        .generic(base: .swift("Array"), args: [element])
    }

    static func dictionary(_ key: BetterType, _ value: BetterType) -> BetterType {
        .generic(base: .swift("Dictionary"), args: [key, value])
    }

    static func `set`(_ element: BetterType) -> BetterType {
        .generic(base: .swift("Set"), args: [element])
    }

    static func result(_ success: BetterType, _ failure: BetterType) -> BetterType {
        .generic(base: .swift("Result"), args: [success, failure])
    }

    static func future(_ output: BetterType) -> BetterType {
        .generic(base: .runtime("Future"), args: [output])
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
            better = .function(
                closure.parameters.map(\.typeName.better),
                closure.returnTypeName.better,
                isAsync: closure.isAsync,
                isThrowing: closure.throws
            )
        } else if name.unwrappedTypeName == "Self" {
            better = .selfType
        } else if let generic = name.generic {
            better = .generic(base: .init(name: generic.name, module: nil), args: generic.typeParameters.map(\.typeName.better))
        } else {
            // TODO: is there a way to know what the module is?
            better = .named(.init(name: name.unwrappedTypeName, module: nil))
        }

        if name.isOptional || name.isImplicitlyUnwrappedOptional {
            better = .optional(better)
        }

        return better
    }
}

extension BetterType.Name {
    // init(stringLiteral value: String) {
    //     self.init(name: value)
    // }

    init(name: String, module: String?) {
        let parts = name.split(separator: ".").map(String.init)
        self.module = module
        self.namespace = Array(parts.dropLast())
        self.name = parts.last!
    }

    static func swift(_ name: String) -> BetterType.Name {
        BetterType.Name(name: name, module: "Swift")
    }

    static func foundation(_ name: String) -> BetterType.Name {
        BetterType.Name(name: name, module: "Foundation")
    }

    static func runtime(_ name: String) -> BetterType.Name {
        BetterType.Name(name: name, module: "FishyJoesCommonRuntime")
    }

    var globalName: String {
        (module.asArray + namespace + [name]).joined(separator: ".")
    }

    var mangledName: String {
        globalName.mangled
    }
}

extension BetterType {
    init(named type: SourceryRuntime.`Type`, context: FishyJoesContext) {
        // All this extra logic is to handle the case where an extension to some other library's type contains an exported type
        // (Looking at you, UnicodeScalar.Script)
        let parts = type.globalName.split(separator: ".").map(String.init)
        let defaultModule = context.module.name
        // Unicode & UnicodeScalar are not actually a FishyJoes type, so we need extra special logic here
        if parts.first == "Unicode" || parts.first == "UnicodeScalar" {
            self = .named(.swift(parts.joined(separator: ".")))
        } else if parts.first == "Swift" {
            self = .named(.swift(parts.dropFirst().joined(separator: ".")))
        } else if parts.first == "Foundation" {
            self = .named(.foundation(parts.dropFirst().joined(separator: ".")))
        } else if
            parts.count > 1,
            case let .named(baseName) = try? context.tryResolve(type: .named(.init(name: parts[0], module: nil))).sourceType
        {
            self = .init(named: type, module: baseName.module)
        } else if
            parts.count > 2,
            case let .named(baseName) = try? context.tryResolve(type: .named(.init(name: parts[1], module: parts[0]))).sourceType
        {
              self = .named(
                .init(
                    module: baseName.module,
                    namespace: baseName.namespace + [baseName.name] + parts.dropFirst(2).dropLast(),
                    name: parts.last!
                )
            )
        } else {
            self = .init(named: type, module: defaultModule)
        }
    }

    init(named type: SourceryRuntime.`Type`, module: String?) {
        self = .named(Name(name: type.globalName, module: module))
    }

    var name: String {
        switch self {
        case let .named(name):
            return name.globalName
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
        case let .function(args, ret, isAsync, isThrowing):
            return "(\(args.map(\.escapingName).joined(separator: ", ")))\(isAsync ? " async" : "")\(isThrowing ? " throws" : "") -> \(ret.name)"
        case .generic(let base, let args):
            return "\(base.name)<\(args.map(\.name).joined(separator: ", "))>"
        case .selfType:
            return "Self"
        }
    }

    var nonNamespacedName: String {
        switch self {
        case let .named(name):
            return name.name
        default:
            return name
        }
    }

    var escapingName: String {
        switch self {
        case .function:
            return "@escaping \(name)"
        default:
            return name
        }
    }

    var module: String? {
        switch self {
        case let .named(name):
            return name.module
        case .void:
            return "Swift"
        case let .generic(base: base, args: _):
            return base.module
        default:
            return nil
        }
    }

    var namespace: [String] {
        switch self {
        case let .named(name):
            return name.module.asArray + name.namespace
        case let .generic(name, _):
            return name.module.asArray + name.namespace
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
            return Name(module: nil, namespace: [], name: name)
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

    var mangledName: String {
        // Not a good or reversible mangling, but hopefully good enough
        let lowercase = CharacterSet(charactersIn: "a"..."z")
        let uppercase = CharacterSet(charactersIn: "A"..."Z")
        let digits = CharacterSet(charactersIn: "0"..."9")
        let invalidCharacters = lowercase.union(uppercase).union(digits).inverted
        return name.components(separatedBy: invalidCharacters).joined(separator: "_")
    }

    var withoutModule: BetterType {
        guard case .named(var name) = self else {
            fatalErr("Internal error: withoutModule is expected to be used on named types only. Got \(self)")
        }
        guard name.module != nil else {
            fatalErr("Internal error: withoutModule called on \(self.name), which already is without module (probably a bug?)")
        }
        name.module = nil
        return .named(name)
    }
}
