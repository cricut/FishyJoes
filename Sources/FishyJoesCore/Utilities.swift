import Foundation
@_exported import GenerationHelpers
import SourceryRuntime

func snakify<S: StringProtocol>(_ camel: S) -> String {
    camel
        .replacingOccurrences(of: #"(.)([A-Z][a-z]+)"#, with: #"$1_$2"#, options: .regularExpression)
        .replacingOccurrences(of: #"([a-z0-9])([A-Z])"#, with: #"$1_$2"#, options: .regularExpression)
}

func upperCaseFirst<S: StringProtocol>(_ camel: S) -> String {
    (camel.first?.uppercased() ?? "") + camel.dropFirst()
}

extension RandomAccessCollection {
    subscript(safe index: Index) -> Element? {
        startIndex <= index && index < endIndex ? self[index] : nil
    }
    subscript(safeOffsetBy offset: Int) -> Element? {
        guard let index = index(startIndex, offsetBy: offset, limitedBy: endIndex) else { return nil }
        return self[safe: index]
    }
    var first2: (Element?, Element?) {
        (self[safeOffsetBy: 0], self[safeOffsetBy: 1])
    }
    var first3: (Element?, Element?, Element?) {
        (self[safeOffsetBy: 0], self[safeOffsetBy: 1], self[safeOffsetBy: 2])
    }
    var first4: (Element?, Element?, Element?, Element?) {
        (self[safeOffsetBy: 0], self[safeOffsetBy: 1], self[safeOffsetBy: 2], self[safeOffsetBy: 3])
    }
}

extension String {
    /// Not a good or reversible mangling, but hopefully good enough
    var mangled: String {
        let lowercase = CharacterSet(charactersIn: "a"..."z")
        let uppercase = CharacterSet(charactersIn: "A"..."Z")
        let digits = CharacterSet(charactersIn: "0"..."9")
        let invalidCharacters = lowercase.union(uppercase).union(digits).inverted
        return components(separatedBy: invalidCharacters).joined(separator: "_")
    }
}

extension Variable {
    var isPubliclyWritable: Bool {
        isMutable && accessLevel.write == .public
    }
}
