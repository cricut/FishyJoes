/// <!-- FishyJoes.export(TestProtocol) -->
public protocol TestProtocol {
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

/// <!-- FishyJoes.export(TestProtocolEnum, protocols: [TestProtocol]) -->
public enum TestProtocolEnum: TestProtocol {
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
