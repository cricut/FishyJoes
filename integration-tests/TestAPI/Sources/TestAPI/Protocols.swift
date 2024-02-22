import Foundation

/// <!-- FishyJoes.export(AProtocol) -->
public protocol AProtocol {
    /// <!-- FishyJoes.export(foo) -->
    var foo: String { get throws }

    /// <!-- FishyJoes.export(bar) -->
    func bar(x: Int, y: Int) throws -> AProtocol

    /// <!-- FishyJoes.export(baz) -->
    var baz: Bool { get throws }

    /// <!-- FishyJoes.export(hasADefaultImplementation) -->
    func hasADefaultImplementation(x: Int, y: Double) throws -> String

    /// <!-- FishyJoes.export(hasADefaultImplementation2) -->
    func hasADefaultImplementation2(a: String, b: Bool, c: Double) throws -> Double
}

extension AProtocol {
    /// <!-- FishyJoes.export(hasADefaultImplementation) -->
    public func hasADefaultImplementation(x: Int, y: Double) throws -> String {
        let b = try bar(x: x, y: Int(round(y * 3.14159265359)))
        return try b.baz ? "bazzy \(b.foo)" : "\(b.foo) notBazzed"
    }

    /// <!-- FishyJoes.export(hasADefaultImplementation2) -->
    public func hasADefaultImplementation2(a: String, b: Bool, c: Double) throws -> Double {
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
    public func bar(x: Int, y: Int) throws -> AProtocol {
        AProtocolImplementation(foo: "\(x + y)", baz: x == 2)
    }
}

/// <!-- FishyJoes.export(TestMethodsProtocol) -->
public protocol TestMethodsProtocol {
    /// <!-- FishyJoes.export(foo) -->
    func foo() throws
    /// <!-- FishyJoes.export(bar) -->
    func bar() throws -> Bool
    /// <!-- FishyJoes.export(baz) -->
    func baz(qux: Bool) throws
    /// <!-- FishyJoes.export(garply) -->
    func garply(_: String) throws -> String
    /// <!-- FishyJoes.export(xyzzy) -->
    func xyzzy(thud: Int, grault: [Double]) throws -> String
    /// <!-- FishyJoes.export(plugh) -->
    func plugh(fred: (Bool, Double, [String])) throws -> (Bool, Int, String)
}

/// <!-- FishyJoes.export(TestPropertiesProtocol) -->
public protocol TestPropertiesProtocol {
    /// <!-- FishyJoes.export(corge) -->
    var corge: String { get throws }
    /// <!-- FishyJoes.export(frob) -->
    var frob: [Double] { get throws }
}

/// <!-- FishyJoes.export(TestOptionalsProtocol) -->
public protocol TestOptionalsProtocol {
    /// <!-- FishyJoes.export(flarp) -->
    var flarp: String? { get throws }
    /// <!-- FishyJoes.export(wombat) -->
    func wombat(zxc: Int?) throws -> Double?
    /// <!-- FishyJoes.export(spqr) -->
    func spqr(_ pippo: AssociatedDataEnum) throws -> Int
}

/// <!-- FishyJoes.export(TestProtocolEnum, conformances: [TestMethodsProtocol]) -->
public enum TestProtocolEnum: TestMethodsProtocol {
    case qux

    /// <!-- FishyJoes.export(foo) -->
    public func foo() throws {
        print("foo!")
    }
    /// <!-- FishyJoes.export(bar) -->
    public func bar() throws -> Bool {
        return true
    }
    /// <!-- FishyJoes.export(baz) -->
    public func baz(qux: Bool) throws {
        print("baz(qux: \(qux))")
    }
    /// <!-- FishyJoes.export(garply) -->
    public func garply(_ str: String) throws -> String {
        return "garply \(str) garpity garp"
    }
    /// <!-- FishyJoes.export(xyzzy) -->
    public func xyzzy(thud: Int, grault: [Double]) throws -> String {
        "thud: \(thud); grault: [\(grault.map { "\($0)" }.joined(separator: ", "))]"
    }
    /// <!-- FishyJoes.export(plugh) -->
    public func plugh(fred: (Bool, Double, [String])) throws -> (Bool, Int, String) {
        (!fred.0, Int(fred.1), fred.2.joined(separator: " -<*>- "))
    }
}

/// <!-- FishyJoes.export(TestProtocolStruct, conformances: [TestMethodsProtocol, TestPropertiesProtocol]) -->
public struct TestProtocolStruct: TestMethodsProtocol, TestPropertiesProtocol {
    /// <!-- FishyJoes.export(foo) -->
    public func foo() throws {
        print("!oof")
    }
    /// <!-- FishyJoes.export(bar) -->
    public func bar() throws -> Bool {
        return false
    }
    /// <!-- FishyJoes.export(baz) -->
    public func baz(qux: Bool) throws {
        print("baz(qux: !\(!qux))")
    }
    /// <!-- FishyJoes.export(garply) -->
    public func garply(_ str: String) throws -> String {
        return "garp garpity \(str) garpee"
    }
    /// <!-- FishyJoes.export(xyzzy) -->
    public func xyzzy(thud: Int, grault: [Double]) throws -> String {
        "thud: \(thud) | grault: [\(grault.map { "\($0)" }.joined(separator: ", "))]"
    }
    /// <!-- FishyJoes.export(plugh) -->
    public func plugh(fred: (Bool, Double, [String])) throws -> (Bool, Int, String) {
        (!fred.0 || fred.1 == 42.9, Int(fred.1 + 9), fred.2.joined(separator: " *>-<* "))
    }

    public var corge: String

    public init(corge: String) {
        self.corge = corge
    }
    /// <!-- FishyJoes.export(frob) -->
    public var frob: [Double] {
        get throws {
            [3.14159265359, 42.0, -1.23456789]
        }
    }
}

/// <!-- FishyJoes.exportReference(TestProtocolClass, conformances: [TestMethodsProtocol, TestPropertiesProtocol, TestOptionalsProtocol]) -->
public class TestProtocolClass: TestMethodsProtocol, TestPropertiesProtocol, TestOptionalsProtocol {
    /// <!-- FishyJoes.export(foo) -->
    public func foo() throws {
        print("!foo-oof!")
    }
    /// <!-- FishyJoes.export(bar) -->
    public func bar() throws -> Bool {
        return true
    }
    /// <!-- FishyJoes.export(baz) -->
    public func baz(qux: Bool) throws {
        print("baz(qux: !!\(qux))")
    }
    /// <!-- FishyJoes.export(garply) -->
    public func garply(_ str: String) throws -> String {
        return "garplify \(str) parguino"
    }
    /// <!-- FishyJoes.export(xyzzy) -->
    public func xyzzy(thud: Int, grault: [Double]) throws -> String {
        "thud: \(thud) \\|/ grault: [\(grault.map { "\($0)" }.joined(separator: ", "))]"
    }
    /// <!-- FishyJoes.export(plugh) -->
    public func plugh(fred: (Bool, Double, [String])) throws -> (Bool, Int, String) {
        (fred.0 && fred.1 == 92.47, Int(fred.1 - 9), fred.2.joined(separator: " _-^= "))
    }
    /// <!-- FishyJoes.export(corge) -->
    public var corge: String

    /// <!-- FishyJoes.export(frob) -->
    public var frob: [Double] {
        get throws {
            [42.0, -1.23456789, 3.14159265359]
        }
    }

    /// <!-- FishyJoes.export(init) -->
    public init(corge: String, flarp: String? = nil) {
        self.corge = corge
        self.flarp = flarp
    }

    /// <!-- FishyJoes.export(flarp) -->
    public var flarp: String?

    /// <!-- FishyJoes.export(wombat) -->
    public func wombat(zxc: Int?) throws -> Double? {
        if let a = zxc {
            if a == 56 {
                return 7890.2
            } else {
                return nil
            }
        } else {
            return 42.909
        }
    }

    /// <!-- FishyJoes.export(spqr) -->
    public func spqr(_ pippo: AssociatedDataEnum) throws -> Int {
        pippo.intValue
    }
}
