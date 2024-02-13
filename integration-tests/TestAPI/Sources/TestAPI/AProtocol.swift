/// <!-- FishyJoes.export(AProtocol) -->
public protocol AProtocol {
    /// <!-- FishyJoes.export(foo) -->
    var foo: String { get set }

    /// <!-- FishyJoes.export(bar) -->
    func bar(x: Int, y: Int) -> AProtocol
    
    /// <!-- FishyJoes.export(baz) -->
    var baz: Bool { get set }

    func hasADefaultImplementation() -> Int
}

extension AProtocol {
    /// <!-- FishyJoes.export(hasADefaultImplementation) -->
    public func hasADefaultImplementation() -> Int { 42 }
}

/// <!-- FishyJoes.export(AProtocolImplementation, conformances: [AProtocol]) -->
public struct AProtocolImplementation: AProtocol {
    public var foo: String
    public var baz: Bool

    public init(foo: String, baz: Bool) {
        self.foo = foo
        self.baz = baz
    }

    // TODO: should we infer the export from protocol requirements?
    /// <!-- FishyJoes.export(bar) -->
    public func bar(x: Int, y: Int) -> AProtocol {
        AProtocolImplementation(foo: "\(x + y)", baz: x == 2)
    }
}
