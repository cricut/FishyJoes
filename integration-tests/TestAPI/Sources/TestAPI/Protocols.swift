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
    func hasADefaultImplementation2(_ a: String, b: Bool, _: Double) throws -> Double
}

extension AProtocol {
    /// <!-- FishyJoes.export(hasADefaultImplementation) -->
    public func hasADefaultImplementation(x: Int, y: Double) throws -> String {
        let b = try bar(x: x, y: Int(round(y * 3.14159265359)))
        return try b.baz ? "bazzy \(b.foo)" : "\(b.foo) notBazzed"
    }

    /// <!-- FishyJoes.export(hasADefaultImplementation2) -->
    public func hasADefaultImplementation2(_ a: String, b: Bool, _ c: Double) throws -> Double {
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

    /// <!-- FishyJoes.export(flarp) -->
    public var flarp: String?

    /// <!-- FishyJoes.export(init) -->
    public init(corge: String, flarp: String? = nil) {
        self.corge = corge
        self.flarp = flarp
    }

    /// <!-- FishyJoes.export(frob) -->
    public var frob: [Double] {
        get throws {
            [42.0, -1.23456789, 3.14159265359]
        }
    }

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

/// <!-- FishyJoes.export(TestLeadingUnderscoredProp) -->
public protocol TestLeadingUnderscoredProp {
    /// <!-- FishyJoes.export(_leadingUnderscoreProp) -->
    var _leadingUnderscoreProp: String { get throws }
}

// TODO: make this work for Kotlin
///// <!-- FishyJoes.export(TestLeadingUnderscoredMethod) -->
// public protocol TestLeadingUnderscoredMethod {
//    /// <!-- FishyJoes.export(_leadingUnderscoreMethod) -->
//    func _leadingUnderscoreMethod() throws -> String
// }

///// <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct, conformances: [TestLeadingUnderscoredProp, TestLeadingUnderscoredMethod]) -->
// public struct TestLeadingUnderscoredPropStruct: TestLeadingUnderscoredProp, TestLeadingUnderscoredMethod {
/// <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct, conformances: [TestLeadingUnderscoredProp]) -->
public struct TestLeadingUnderscoredPropStruct: TestLeadingUnderscoredProp {
    public var _leadingUnderscoreProp: String

    public init(_leadingUnderscoreProp: String) {
        self._leadingUnderscoreProp = _leadingUnderscoreProp
    }

    // TODO: make this work for Kotlin
//    /// <!-- FishyJoes.export(_leadingUnderscoreMethod) -->
//    public func _leadingUnderscoreMethod() throws -> String {
//        "Captain Planet, he's our hero; Gonna take pollution down to zero."
//    }
}

/// <!-- FishyJoes.export(TestAsyncFunctions) -->
public protocol TestAsyncFunctions {
    /// <!-- FishyJoes.export(const42) -->
    var const42: AsyncFunctions.AFun0 { get throws }
}

/// <!-- FishyJoes.export(TestAsyncFunctionsStruct) -->
public struct TestAsyncFunctionsStruct: TestAsyncFunctions {
    public let const42: AsyncFunctions.AFun0
    public let iabs: AsyncFunctions.AFun1
    
    public init(
        const42: @escaping AsyncFunctions.AFun0,
        iabs: @escaping AsyncFunctions.AFun1
    ) {
        self.const42 = const42
        self.iabs = iabs
    }
}
