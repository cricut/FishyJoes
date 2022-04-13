import SourceryRuntime

struct TranslatedTuple: TranslatedType {
    struct Element {
        let label: String
        let type: TranslatedType
    }
    let elements: [Element]

    var converterType: BetterType {
        .generic(
            base: .init(stringLiteral: "Tuple\(elements.count)Converter"),
            args: elements.map { $0.type.converterType }
        )
    }

    let sourceType: BetterType
    var nodeName: String { "[\(elements.lazy.map(\.type.nodeName).joined(separator: ", "))]" }
    var kotlinName: String {
        if elements.count == 2 {
            return "Pair<\(elements.lazy.map(\.type.kotlinName).joined(separator: ", "))>"
        } else if elements.count == 3 {
            return "Triple<\(elements.lazy.map(\.type.kotlinName).joined(separator: ", "))>"
        } else {
            return "Tuple\(elements.count)<\(elements.lazy.map(\.type.kotlinName).joined(separator: ", "))>"
        }
    }
    var kotlinPackage: String? {
        if elements.count == 2 {
            return "kotlin"
        } else if elements.count == 3 {
            return "kotlin"
        } else {
            return "com.cricut.fishyjoes.runtime"
        }
    }
    
    var cSharpName: String {
        "(\(elements.lazy.map(\.type.cSharpName).joined(separator: ", ")))"
    }

    let cSharpNamespace: String? = nil

    init(elements: [Element]) {
        self.elements = elements
        if elements.count == 2 {
            self.jniType = .object("kotlin/Pair")
        } else if elements.count == 3 {
            self.jniType = .object("kotlin/Triple")
        } else {
            self.jniType = .object("com/cricut/fishyjoes/runtime/Tuple\(elements.count)")
        }
        sourceType = .tuple(elements.map { .init(label: $0.label, type: $0.type.sourceType) })
    }

    let jniType: JNIType
}
