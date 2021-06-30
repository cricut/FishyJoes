import Foundation

extension Optional {
    var asArray: [Wrapped] { map { [$0] } ?? [] }
}

func fatalErr(_ message: String = "", file: StaticString = #file, line: UInt = #line) -> Never {
    fatalError("\n\(file):\(line): \(message)\n\(Thread.callStackSymbols.joined(separator: "\n"))\n")
}
