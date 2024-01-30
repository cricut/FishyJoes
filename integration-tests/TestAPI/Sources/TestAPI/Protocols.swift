/// <!-- FishyJoes.export(TestProtocol) -->
public protocol TestProtocol {
//    func foo()
//    func bar() -> Bool
//    func baz(qux: Bool)
//    func garply(_ : String) -> String
    /// <!-- FishyJoes.export(xyzzy) -->
    func xyzzy(thud: Int, grault: [Double])
    
    /// <!-- FishyJoes.export(waldo) -->
    static var waldo: String { set get }
}

/// <!-- FishyJoes.export(TestProtocolEnum, protocols: [TestProtocol]) -->
public enum TestProtocolEnum: TestProtocol {
    case qux

    /// <!-- FishyJoes.export(xyzzy) -->
    public func xyzzy(thud: Int, grault: [Double]) {
        print("thud: \(thud); grault: \(grault.map { "\($0)" })")
    }
    
    /// <!-- FishyJoes.export(waldo) -->
    public static var waldo = "You found me!"
}
