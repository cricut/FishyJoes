import Foundation

indirect enum SwiftDefaultExpression: Equatable {
    case nilLiteral
    case boolLiteral(Bool)
    case integerLiteral(String)
    case floatingPointLiteral(String)
    case implicitMember(String)
    case memberAccess([String])
    case call(callee: SwiftDefaultExpression, arguments: [SwiftDefaultExpression])

    static func parse(_ value: String) -> SwiftDefaultExpression? {
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        switch trimmed {
        case "nil":
            return .nilLiteral
        case "true":
            return .boolLiteral(true)
        case "false":
            return .boolLiteral(false)
        default:
            break
        }

        if isIntegerLiteral(trimmed) {
            return .integerLiteral(trimmed)
        }
        if isFloatingPointLiteral(trimmed) {
            return .floatingPointLiteral(trimmed)
        }
        if trimmed.hasSuffix("()") {
            let calleeText = String(trimmed.dropLast(2))
            guard let callee = parseMemberAccess(calleeText) else {
                return nil
            }
            return .call(callee: callee, arguments: [])
        }
        return parseMemberAccess(trimmed)
    }

    private static func parseMemberAccess(_ value: String) -> SwiftDefaultExpression? {
        if value.hasPrefix(".") {
            let member = String(value.dropFirst())
            guard isIdentifier(member) else {
                return nil
            }
            return .implicitMember(member)
        }

        let components = value.split(separator: ".").map(String.init)
        guard components.count > 1,
              components.allSatisfy(isIdentifier) else {
            return nil
        }
        return .memberAccess(components)
    }

    private static func isIntegerLiteral(_ value: String) -> Bool {
        matches(value, #"^-?[0-9]+$"#)
    }

    private static func isFloatingPointLiteral(_ value: String) -> Bool {
        matches(value, #"^-?([0-9]+\.[0-9]*|[0-9]*\.[0-9]+)([eE][+-]?[0-9]+)?$"#)
    }

    private static func isIdentifier(_ value: String) -> Bool {
        matches(value, #"^[A-Za-z_][A-Za-z0-9_]*$"#)
    }

    private static func matches(_ value: String, _ pattern: String) -> Bool {
        value.range(of: pattern, options: .regularExpression) != nil
    }
}

extension SwiftDefaultExpression {
    var swiftFloatingPointConstantLiteral: String? {
        guard let value = swiftFloatingPointConstantValue else {
            return nil
        }
        return String(value)
            .replacingOccurrences(of: "e", with: "E")
            .replacingOccurrences(of: "E-0", with: "E-")
            .replacingOccurrences(of: "E+0", with: "E+")
    }

    var swiftIntegerLimitValue: String? {
        guard case let .memberAccess(components) = self,
              components.count == 2 else {
            return nil
        }

        switch (components[0], components[1]) {
        case ("Int8", "min"):
            return String(Int8.min)
        case ("Int8", "max"):
            return String(Int8.max)
        case ("Int16", "min"):
            return String(Int16.min)
        case ("Int16", "max"):
            return String(Int16.max)
        case ("Int32", "min"):
            return String(Int32.min)
        case ("Int32", "max"):
            return String(Int32.max)
        case ("Int64", "min"):
            return String(Int64.min)
        case ("Int64", "max"):
            return String(Int64.max)
        case ("Int", "min"):
            return String(Int.min)
        case ("Int", "max"):
            return String(Int.max)
        case ("UInt8", "min"):
            return String(UInt8.min)
        case ("UInt8", "max"):
            return String(UInt8.max)
        case ("UInt16", "min"):
            return String(UInt16.min)
        case ("UInt16", "max"):
            return String(UInt16.max)
        case ("UInt32", "min"):
            return String(UInt32.min)
        case ("UInt32", "max"):
            return String(UInt32.max)
        case ("UInt64", "min"):
            return String(UInt64.min)
        case ("UInt64", "max"):
            return String(UInt64.max)
        case ("UInt", "min"):
            return String(UInt.min)
        case ("UInt", "max"):
            return String(UInt.max)
        default:
            return nil
        }
    }

    private var swiftFloatingPointConstantValue: Double? {
        switch self {
        case let .floatingPointLiteral(value):
            return Double(value)
        case .memberAccess(["Double", "ulpOfOne"]):
            return Double.ulpOfOne
        case let .call(callee, arguments):
            guard arguments.isEmpty,
                  case let .memberAccess(components) = callee,
                  components.last == "squareRoot" else {
                return nil
            }
            let receiver = SwiftDefaultExpression.memberAccess(Array(components.dropLast()))
            return receiver.swiftFloatingPointConstantValue?.squareRoot()
        default:
            return nil
        }
    }
}
