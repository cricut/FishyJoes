/// A property wrapper for a nullable value that always decodes as nil
@propertyWrapper
public struct NilDecode<T>: Decodable {
    public init(wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
    public init(from decoder: any Decoder) throws {
        self.wrappedValue = nil
    }
    public var wrappedValue: T?
}
