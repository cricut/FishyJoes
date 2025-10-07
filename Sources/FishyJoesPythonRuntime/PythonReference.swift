@_exported import FishyJoesCommonRuntime
import Foundation

/// Wrapper for Python objects managed from Swift side
public final class PythonReference {
    public let object: PyObjectPtr
    private let env: Env

    public init(take object: PyObjectPtr, env: Env) {
        self.object = object
        self.env = env
    }

    public init(borrow object: PyObjectPtr, env: Env) {
        self.object = env.newRef(object)
        self.env = env
    }

    deinit {
        env.deleteRef(object)
    }
}

extension PythonReference: Equatable {
    public static func == (lhs: PythonReference, rhs: PythonReference) -> Bool {
        // Compare Python object identity
        lhs.object == rhs.object
    }
}

extension PythonReference: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(Int(bitPattern: object))
    }
}

extension PythonReference: CustomStringConvertible {
    public var description: String {
        env.describe(python: object)
    }
}
