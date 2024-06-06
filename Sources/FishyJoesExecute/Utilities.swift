import Foundation
import swsh

#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#endif

// https://stackoverflow.com/a/51944613
enum AnsiColor: String {
    case reset = "\u{1b}[0m"

    case redBoldBright = "\u{1b}[1;91m"
    case greenBoldBright = "\u{1b}[1;92m"
    case yellowBoldBright = "\u{1b}[1;93m"
    case blueBoldBright = "\u{1b}[1;94m"
    case purpleBoldBright = "\u{1b}[1;95m"
    case cyanBoldBright = "\u{1b}[1;96m"
    case whiteBoldBright = "\u{1b}[1;97m"
}

enum Log {
    static func print(color: AnsiColor, _ message: String, terminator: String) {
        Swift.print(
            AnsiColor.reset.rawValue,
            color.rawValue,
            message,
            AnsiColor.reset.rawValue,
            separator: "",
            terminator: terminator
        )
    }

    static func info(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        print(
            color: .blueBoldBright,
            items.map(String.init(describing:)).joined(separator: separator),
            terminator: terminator
        )
        fflush(stdout)
    }

    static func warn(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        print(
            color: .yellowBoldBright,
            items.map(String.init(describing:)).joined(separator: separator),
            terminator: terminator
        )
        fflush(stdout)
    }

    static func error(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        print(
            color: .redBoldBright,
            items.map(String.init(describing:)).joined(separator: separator),
            terminator: terminator
        )
        fflush(stdout)
    }

    static func success(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        print(
            color: .greenBoldBright,
            items.map(String.init(describing:)).joined(separator: separator),
            terminator: terminator
        )
        fflush(stdout)
    }
}

struct EOFError: Error {}

enum Interactive {
    static func prompt(_ message: String, allowEmpty: Bool = false) throws -> String {
        while true {
            Log.info("\(message)", terminator: "")
            switch readLine() {
            case .none:
                Log.error("ERROR: Unexpected EOF")
                throw EOFError()
            case "" where !allowEmpty:
                continue
            case .some(let answer):
                return answer
            }
        }
    }

    static func promptYesNo(`default` defaultYes: Bool = true) throws -> Bool {
        while true {
            switch try prompt(defaultYes ? "[Y/n] " : "[y/N] ", allowEmpty: true).lowercased() {
            case "":
                return defaultYes
            case "y", "yes", "oui", "да":
                return true
            case "n", "no", "non", "нет":
                return false
            default:
                Log.error("unrecognized input")
            }
        }
    }

    static func confirmCommand(description: String, _ command: Command) throws {
        Log.info()
        Log.info("\(description)? Will run:")
        if let describableCommand = command as? CustomStringConvertible {
            Log.info("    \(describableCommand.description)")
        } else {
            Log.info("    \(command)")
        }
        if try promptYesNo() {
            try command.run()
            Log.success("SUCCESS: \(description)")
        } else {
            Log.warn("WARNING: \(description) skipped. Further steps may fail.")
        }
    }
}

struct Lazy<T> {
    private let box: Box

    init(_ thunk: @escaping @autoclosure () -> T) {
        box = Box(.thunk(thunk))
    }

    private enum Storage {
        case thunk(() -> T)
        case computed(T)
    }

    private class Box {
        var storage: Storage
        init(_ storage: Storage) {
            self.storage = storage
        }
    }

    func get() -> T {
        switch box.storage {
        case .computed(let value):
            return value
        case .thunk(let thunk):
            let value = thunk()
            box.storage = .computed(value)
            return value
        }
    }
}

extension Lazy: Hashable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        ObjectIdentifier(lhs.box) == ObjectIdentifier(rhs.box)
    }

    func hash(into hasher: inout Hasher) {
        ObjectIdentifier(box).hash(into: &hasher)
    }
}

func printAndFlush(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    print(items.map(String.init(describing:)).joined(separator: separator))
    fflush(stdout)
}

extension JSONEncoder {
    func encodeToString<T: Encodable>(_ value: T) throws -> String {
        String(data: try encode(value), encoding: .utf8)!
    }
}

class PrettyJSONEncoder: JSONEncoder {
    override init() {
        super.init()
        outputFormatting = [
            .prettyPrinted,
            .withoutEscapingSlashes
        ]
    }

    override func encode<E: Encodable>(_ object: E) throws -> Data {
        var data = try super.encode(object)
        data.append("\n".data(using: .utf8)!)
        return data
    }
}

extension Optional {
    subscript(default defaultValue: Wrapped) -> Wrapped {
        get {
            self ?? defaultValue
        }
        set {
            self = newValue
        }
    }
}

extension Sequence {
    // like filter, but returns filtered items in separate array
    func partition(_ isIncluded: (Element) throws -> Bool) rethrows -> (included: [Element], excluded: [Element]) {
        var included: [Element] = []
        var excluded: [Element] = []
        for item in self {
            if try isIncluded(item) {
                included.append(item)
            } else {
                excluded.append(item)
            }
        }
        return (included, excluded)
    }
}

extension String {
    func trimmingIfPrefixed(_ prefix: any StringProtocol) -> Substring? {
        guard hasPrefix(prefix) else { return nil }
        return dropFirst(prefix.count)
    }
}
