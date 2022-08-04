import Foundation

public struct UninhabitedTypeCreationError: CustomStringConvertible, Error {
    public let description: String

    public init<T>(_ type: T.Type) {
        description = "Attempted to create a value in the uninhabited type \(type)"
    }

    public var localizedDescription: String { description }
}
