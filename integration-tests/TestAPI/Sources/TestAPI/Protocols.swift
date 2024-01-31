/// <!-- FishyJoes.export(TestMethodsProtocol) -->
public protocol TestMethodsProtocol {
    /// <!-- FishyJoes.export(foo) -->
    func foo()
    /// <!-- FishyJoes.export(bar) -->
    func bar() -> Bool
    /// <!-- FishyJoes.export(baz) -->
    func baz(qux: Bool)
    /// <!-- FishyJoes.export(garply) -->
    func garply(_: String) -> String
    /// <!-- FishyJoes.export(xyzzy) -->
    func xyzzy(thud: Int, grault: [Double]) -> String
}

/// <!-- FishyJoes.export(TestPropertiesProtocol) -->
public protocol TestPropertiesProtocol {
    /// <!-- FishyJoes.export(corge) -->
    var corge: String { set get }
}

/// <!-- FishyJoes.export(TestProtocolEnum, protocols: [TestMethodsProtocol]) -->
public enum TestProtocolEnum: TestMethodsProtocol {
    case qux
    
    /// <!-- FishyJoes.export(foo) -->
    public func foo() {
        print("foo!")
    }
    /// <!-- FishyJoes.export(bar) -->
    public func bar() -> Bool {
        return true
    }
    /// <!-- FishyJoes.export(baz) -->
    public func baz(qux: Bool) {
        print("baz(qux: \(qux))")
    }
    /// <!-- FishyJoes.export(garply) -->
    public func garply(_ str: String) -> String {
        return "garply \(str) garpity garp"
    }
    /// <!-- FishyJoes.export(xyzzy) -->
    public func xyzzy(thud: Int, grault: [Double]) -> String {
        "thud: \(thud); grault: [\(grault.map { "\($0)" }.joined(separator: ", "))]"
    }
}

/// <!-- FishyJoes.export(TestProtocolStruct, protocols: [TestMethodsProtocol, TestPropertiesProtocol]) -->
public struct TestProtocolStruct: TestMethodsProtocol, TestPropertiesProtocol {
    /// <!-- FishyJoes.export(foo) -->
    public func foo() {
        print("!oof")
    }
    /// <!-- FishyJoes.export(bar) -->
    public func bar() -> Bool {
        return false
    }
    /// <!-- FishyJoes.export(baz) -->
    public func baz(qux: Bool) {
        print("baz(qux: !\(!qux))")
    }
    /// <!-- FishyJoes.export(garply) -->
    public func garply(_ str: String) -> String {
        return "garp garpity \(str) garpee"
    }
    /// <!-- FishyJoes.export(xyzzy) -->
    public func xyzzy(thud: Int, grault: [Double]) -> String {
        "thud: \(thud) | grault: [\(grault.map { "\($0)" }.joined(separator: ", "))]"
    }

    public var corge: String
    
    public init(corge: String) {
        self.corge = corge
    }
}

/// <!-- FishyJoes.exportReference(TestProtocolClass, protocols: [TestMethodsProtocol, TestPropertiesProtocol]) -->
public class TestProtocolClass: TestMethodsProtocol, TestPropertiesProtocol {
    /// <!-- FishyJoes.export(foo) -->
    public func foo() {
        print("!foo-oof!")
    }
    /// <!-- FishyJoes.export(bar) -->
    public func bar() -> Bool {
        return false
    }
    /// <!-- FishyJoes.export(baz) -->
    public func baz(qux: Bool) {
        print("baz(qux: !!\(qux))")
    }
    /// <!-- FishyJoes.export(garply) -->
    public func garply(_ str: String) -> String {
        return "garplify \(str) parguino"
    }
    /// <!-- FishyJoes.export(xyzzy) -->
    public func xyzzy(thud: Int, grault: [Double]) -> String {
        "thud: \(thud) \\|/ grault: [\(grault.map { "\($0)" }.joined(separator: ", "))]"
    }

    /// <!-- FishyJoes.export(corge) -->
    public var corge: String
    
    public init(corge: String) {
        self.corge = corge
    }
}
