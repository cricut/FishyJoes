import Foundation

func debug(_ any: Any) {
    #if false
    fputs("\(any)\n", stderr)
    fflush(stderr)
    #endif
}

func fatalErr(_ message: String = "", file: StaticString = #file, line: UInt = #line) -> Never {
    fatalError("\n\(file):\(line): \(message)\n\(Thread.callStackSymbols.joined(separator: "\n"))\n")
}
