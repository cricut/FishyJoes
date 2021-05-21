import SourceryRuntime

// SourceryRuntime.TypeName is bad; Types are trees, not structs full of booleanss.
// An Optional<Int> isn't a Int that happens to be optional, it's an Optional that may contain an Int!
indirect enum BetterType: Hashable {
    case unknown(String)
    case optional(BetterType)
    case tuple([TupleElement])
    case void
    case array(BetterType)
    case dictionary(BetterType, BetterType)
    case function([BetterType], BetterType)
    case selfType
    case unsafeMutablePointer(BetterType)

    struct TupleElement: Hashable {
        let label: String
        let type: BetterType
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
        } else {
            better = .unknown(name.unwrappedTypeName)
        }

        if name.isOptional || name.isImplicitlyUnwrappedOptional {
            better = .optional(better)
        }

        return better
    }
}
