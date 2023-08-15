import FishyJoesCommonRuntime
import Foundation

public struct NullPointerError: Error {
    public var message: String

    public init(message: String) {
        self.message = message
    }
}

public struct MalformedURLError: Error {
    public let message: String

    public init(message: String) {
        self.message = message
    }
}
