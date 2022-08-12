import Foundation

extension Optional {
    var asArray: [Wrapped] { map { [$0] } ?? [] }
}

infix operator ||=
func ||= (left: inout Bool, right: Bool) { left = left || right }

public func fatalErr(_ message: String = "", file: StaticString = #file, line: UInt = #line) -> Never {
    fatalError("\n\(file):\(line): \(message)\n\(Thread.callStackSymbols.joined(separator: "\n"))\n")
}

public func extLog(_ message: String) {
    let data = (message + "\n").data(using: String.Encoding.utf8)!
    if let fileHandle = FileHandle(forWritingAtPath: ".sourcery-log") {
        defer {
            fileHandle.closeFile()
        }
        fileHandle.seekToEndOfFile()
        fileHandle.write(data)
    } else {
        try! data.write(to: URL(fileURLWithPath: ".sourcery-log"), options: .atomic)
    }
}

extension FileHandle: TextOutputStream {
    public func write(_ string: String) {
        let data = Data(string.utf8)
        self.write(data)
    }
}

func debug(file: StaticString = #file, line: UInt = #line, _ msgs: Any? ...) {
    var errorHandle = FileHandle.standardError
    print("\(file):\(line): " + msgs.map { "\($0 ?? "<null>")" }.joined(separator: " "), to: &errorHandle)
}

func snakify<S: StringProtocol>(_ camel: S) -> String {
    camel
        .replacingOccurrences(of: #"(.)([A-Z][a-z]+)"#, with: #"$1_$2"#, options: .regularExpression)
        .replacingOccurrences(of: #"([a-z0-9])([A-Z])"#, with: #"$1_$2"#, options: .regularExpression)
}

func upperCaseFirst<S: StringProtocol>(_ camel: S) -> String {
    (camel.first?.uppercased() ?? "") + camel.dropFirst()
}

extension Array {
    subscript(safe index: Index) -> Element? {
        startIndex <= index && index < endIndex ? self[index] : nil
    }
    var first2: (Element?, Element?) {
        (self[safe: 0], self[safe: 1])
    }
    var first3: (Element?, Element?, Element?) {
        (self[safe: 0], self[safe: 1], self[safe: 2])
    }
    var first4: (Element?, Element?, Element?, Element?) {
        (self[safe: 0], self[safe: 1], self[safe: 2], self[safe: 3])
    }
}

extension Result where Failure == Never {
    var neverFails: Success {
        switch self {
        case .success(let success):
            return success
        }
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
