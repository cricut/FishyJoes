/// <!-- FishyJoes.export(AProtocol) -->
public protocol AProtocol {
    /// <!-- FishyJoes.export(foo) -->
    var foo: String { get set }

    /// <!-- FishyJoes.export(bar) -->
    func bar(x: Int, y: Int) -> AProtocol

    /// <!-- FishyJoes.export(hasADefaultImplementation) -->
    func hasADefaultImplementation() -> Int
}

extension AProtocol {
    public func hasADefaultImplementation() -> Int { 42 }
}

/// <!-- FishyJoes.export(AProtocolImplementation) -->
public struct AProtocolImplementation: AProtocol {
    public var foo: String

    public init(foo: String) {
        self.foo = foo
    }

    // TODO: should we infer the export from protocol requirements?
    /// <!-- FishyJoes.export(bar) -->
    public func bar(x: Int, y: Int) -> AProtocol {
        AProtocolImplementation(foo: "\(x + y)")
    }
}
