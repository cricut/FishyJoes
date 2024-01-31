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
    /// <!-- FishyJoes.export(plugh) -->
    func plugh(fred: (Bool, Double, [String])) -> (Bool, Int, String)
}

/// <!-- FishyJoes.export(TestPropertiesProtocol) -->
public protocol TestPropertiesProtocol {
    /// <!-- FishyJoes.export(corge) -->
    var corge: String { set get }
    /// <!-- FishyJoes.export(frob) -->
    var frob: [Double] { get }
}

/// <!-- FishyJoes.export(TestStaticProtocol) -->
public protocol TestStaticProtocol {
    /// <!-- FishyJoes.export(blarg) -->
    static var blarg: String { get }
    /// <!-- FishyJoes.export(wibble) -->
    static func wibble() -> String
}

/// <!-- FishyJoes.export(TestOptionalsProtocol) -->
public protocol TestOptionalsProtocol {
    /// <!-- FishyJoes.export(flarp) -->
    var flarp: String? { set get }
    /// <!-- FishyJoes.export(wombat) -->
    func wombat(zxc: Int?) -> Double?
    /// <!-- FishyJoes.export(spqr) -->
    func spqr(_ pippo: AssociatedDataEnum) -> Int
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
    /// <!-- FishyJoes.export(plugh) -->
    public func plugh(fred: (Bool, Double, [String])) -> (Bool, Int, String) {
        (!fred.0, Int(fred.1), fred.2.joined(separator: " -<*>- "))
    }
}

/// <!-- FishyJoes.export(TestProtocolStruct, protocols: [TestMethodsProtocol, TestPropertiesProtocol, TestStaticProtocol]) -->
public struct TestProtocolStruct: TestMethodsProtocol, TestPropertiesProtocol, TestStaticProtocol {
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
    /// <!-- FishyJoes.export(plugh) -->
    public func plugh(fred: (Bool, Double, [String])) -> (Bool, Int, String) {
        (!fred.0 || fred.1 == 42.9, Int(fred.1 + 9), fred.2.joined(separator: " *>-<* "))
    }

    public var corge: String
    
    public init(corge: String) {
        self.corge = corge
    }
    /// <!-- FishyJoes.export(frob) -->
    public var frob: [Double] {
        [3.14159265359, 42.0, -1.23456789]
    }

    /// <!-- FishyJoes.export(blarg) -->
    public static var blarg: String {
        "Such a fine thing to do."
    }
    /// <!-- FishyJoes.export(wibble) -->
    public static func wibble() -> String {
        "Wibbledy wobbledy, timey whimey"
    }
}

/// <!-- FishyJoes.exportReference(TestProtocolClass, protocols: [TestMethodsProtocol, TestPropertiesProtocol, TestOptionalsProtocol]) -->
public class TestProtocolClass: TestMethodsProtocol, TestPropertiesProtocol, TestOptionalsProtocol {
    /// <!-- FishyJoes.export(foo) -->
    public func foo() {
        print("!foo-oof!")
    }
    /// <!-- FishyJoes.export(bar) -->
    public func bar() -> Bool {
        return true
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
    /// <!-- FishyJoes.export(plugh) -->
    public func plugh(fred: (Bool, Double, [String])) -> (Bool, Int, String) {
        (fred.0 && fred.1 == 92.47, Int(fred.1 - 9), fred.2.joined(separator: " _-^= "))
    }
    /// <!-- FishyJoes.export(corge) -->
    public var corge: String

    /// <!-- FishyJoes.export(frob) -->
    public var frob: [Double] {
        [42.0, -1.23456789, 3.14159265359]
    }
    
    /// <!-- FishyJoes.export(init) -->
    public init(corge: String) {
        self.corge = corge
    }

    /// <!-- FishyJoes.export(flarp) -->
    public var flarp: String?

    /// <!-- FishyJoes.export(wombat) -->
    public func wombat(zxc: Int?) -> Double? {
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
    public func spqr(_ pippo: AssociatedDataEnum) -> Int {
        pippo.intValue
    }
}
