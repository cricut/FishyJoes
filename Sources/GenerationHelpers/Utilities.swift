import Foundation

extension Optional {
    public var asArray: [Wrapped] { map { [$0] } ?? [] }
}

public func debug(file: StaticString = #file, line: UInt = #line, _ msgs: Any? ...) {
    let message = "\(file):\(line): " + msgs.map { "\($0 ?? "<null>")" }.joined(separator: " ") + "\n"
    _ = message.withCString { fputs($0, stderr) }
}

infix operator ||=
public func ||= (left: inout Bool, right: Bool) { left = left || right }

public func fatalErr(_ message: String = "", file: StaticString = #file, line: UInt = #line) -> Never {
    fatalError("\n\(file):\(line): \(message)\n\(Thread.callStackSymbols.joined(separator: "\n"))\n")
}

extension FileHandle: Swift.TextOutputStream {
    public func write(_ string: String) {
        let data = Data(string.utf8)
        self.write(data)
    }
}

extension Result where Failure == Never {
    public var neverFails: Success {
        switch self {
        case .success(let success):
            return success
        }
    }
}
