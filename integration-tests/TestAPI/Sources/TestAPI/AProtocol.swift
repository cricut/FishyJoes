import Foundation

/// <!-- FishyJoes.export(AProtocol) -->
public protocol AProtocol {
    /// <!-- FishyJoes.export(foo) -->
    var foo: String { get set }

    /// <!-- FishyJoes.export(bar) -->
    func bar(x: Int, y: Int) -> AProtocol
    
    /// <!-- FishyJoes.export(baz) -->
    var baz: Bool { get set }

    func hasADefaultImplementation(x: Int, y: Double) -> String
    
    func hasADefaultImplementation2(a: String, b: Bool, c: Double) -> Double
}

extension AProtocol {
    /// <!-- FishyJoes.export(hasADefaultImplementation) -->
    public func hasADefaultImplementation(x: Int, y: Double) -> String {
        let b = bar(x: x, y: Int(round(y * 3.14159265359)))
        return b.baz ? "bazzy \(b.foo)" : "\(b.foo) notBazzed"
    }

    /// <!-- FishyJoes.export(hasADefaultImplementation2) -->
    public func hasADefaultImplementation2(a: String, b: Bool, c: Double) -> Double {
        guard let d = Double(a) else {
            return -3.14159265359
        }
        return b ? pow(d, 3.23) : pow(c, 4.5)
    }
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
