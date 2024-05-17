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
    func hasADefaultImplementation2(_ a: String, b: Bool, _: String) throws -> String
}

extension AProtocol {
    /// <!-- FishyJoes.export(hasADefaultImplementation) -->
    public func hasADefaultImplementation(x: Int, y: Double) throws -> String {
        let b = try bar(x: x, y: Int(round(y * 3.14159265359)))
        return try b.baz ? "bazzy \(b.foo)" : "\(b.foo) notBazzed"
    }

    /// <!-- FishyJoes.export(hasADefaultImplementation2) -->
    public func hasADefaultImplementation2(_ a: String, b: Bool, _ c: String) throws -> String {
        guard let d = Double(a),
              let e = Double(c) else {
            return "-3.14159265359"
        }
        return "\(b ? pow(d, 3.23) : pow(e, 4.5))"
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
    /// <!-- FishyJoes.export(frobby) -->
    var frob: [Int] { get throws }
}

/// <!-- FishyJoes.export(TestDefaultComputedProperties) -->
public protocol TestDefaultComputedProperties {
    /// <!-- FishyJoes.export(noot) -->
    var noot: Int { get throws }
    /// <!-- FishyJoes.export(plutonic) -->
    var pluto: String { get throws }
}

extension TestDefaultComputedProperties {
    /// <!-- FishyJoes.export(noot) -->
    public var noot: Int {
        get throws {
            2983
        }
    }
    /// <!-- FishyJoes.export(plutonic) -->
    public var pluto: String {
        get throws {
            "Newton Gimmick"
        }
    }
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

/// <!-- FishyJoes.export(TestDefaultComputedPropertiesStruct, conformances: [TestDefaultComputedProperties]) -->
public struct TestDefaultComputedPropertiesStruct: TestDefaultComputedProperties {
    /// <!-- FishyJoes.export(init) -->
    public init() { }
}

/// <!-- FishyJoes.export(TestProtocolEnum, conformances: [TestMethodsProtocol]) -->
public enum TestProtocolEnum: TestMethodsProtocol {
    static let debugPrints = false

    case qux

    /// <!-- FishyJoes.export(foo) -->
    public func foo() throws {
        if Self.debugPrints { print("foo!") }
    }
    /// <!-- FishyJoes.export(bar) -->
    public func bar() throws -> Bool {
        return true
    }
    /// <!-- FishyJoes.export(baz) -->
    public func baz(qux: Bool) throws {
        if Self.debugPrints { print("baz(qux: \(qux))") }
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
    static let debugPrints = false

    /// <!-- FishyJoes.export(foo) -->
    public func foo() throws {
        if Self.debugPrints { print("!oof") }
    }
    /// <!-- FishyJoes.export(bar) -->
    public func bar() throws -> Bool {
        return false
    }
    /// <!-- FishyJoes.export(baz) -->
    public func baz(qux: Bool) throws {
        if Self.debugPrints { print("baz(qux: !\(!qux))") }
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
    /// <!-- FishyJoes.export(frobby) -->
    public var frob: [Int] {
        get throws {
            [3, 42, -1]
        }
    }
}

/// <!-- FishyJoes.exportReference(TestProtocolClass, conformances: [TestMethodsProtocol, TestPropertiesProtocol, TestOptionalsProtocol]) -->
public class TestProtocolClass: TestMethodsProtocol, TestPropertiesProtocol, TestOptionalsProtocol {
    static let debugPrints = false

    /// <!-- FishyJoes.export(foo) -->
    public func foo() throws {
        if Self.debugPrints { print("!foo-oof!") }
    }
    /// <!-- FishyJoes.export(bar) -->
    public func bar() throws -> Bool {
        return true
    }
    /// <!-- FishyJoes.export(baz) -->
    public func baz(qux: Bool) throws {
        if Self.debugPrints { print("baz(qux: !!\(qux))") }
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

    /// <!-- FishyJoes.export(frobby) -->
    public var frob: [Int] {
        get throws {
            [42, -1, 3]
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
    /// <!-- FishyJoes.export(iabs) -->
    var iabs: AsyncFunctions.AFun1 { get throws }
    /// <!-- FishyJoes.export(intCompose) -->
    var intCompose: AsyncFunctions.AFun2 { get throws }
    /// <!-- FishyJoes.export(add3Things) -->
    var add3Things: AsyncFunctions.AFun3 { get throws }
    /// <!-- FishyJoes.export(makeList) -->
    var makeList: AsyncFunctions.AFun4 { get throws }
    /// <!-- FishyJoes.export(fifthThing) -->
    var fifthThing: AsyncFunctions.AFun5 { get throws }
    /// <!-- FishyJoes.export(six) -->
    var six: AsyncFunctions.AFun6 { get throws }
    /// <!-- FishyJoes.export(willThrow) -->
    var willThrow: AsyncFunctions.AFun0 { get throws }
    /// <!-- FishyJoes.export(exercise0) -->
    func exercise0(_ fn: @escaping AsyncFunctions.AFun0) async throws -> String
    /// <!-- FishyJoes.export(exercise1) -->
    func exercise1(_ fn: @escaping AsyncFunctions.AFun1) async throws -> String
    /// <!-- FishyJoes.export(exercise2) -->
    func exercise2(_ fn: @escaping AsyncFunctions.AFun2) async throws -> String
    /// <!-- FishyJoes.export(exercise3) -->
    func exercise3(_ fn: @escaping AsyncFunctions.AFun3) async throws -> String
    /// <!-- FishyJoes.export(exercise4) -->
    func exercise4(_ fn: @escaping AsyncFunctions.AFun4) async throws -> String
    /// <!-- FishyJoes.export(exercise5) -->
    func exercise5(_ fn: @escaping AsyncFunctions.AFun5) async throws -> String
    /// <!-- FishyJoes.export(exercise6) -->
    func exercise6(_ fn: @escaping AsyncFunctions.AFun6) async throws -> String
    /// <!-- FishyJoes.export(thunkTwiceMaker) -->
    func thunkTwiceMaker(thunk: @escaping () async throws -> Void) throws -> () async throws -> Void
    /// <!-- FishyJoes.export(defaultExercise6) -->
    func defaultExercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) async throws -> String
    /// <!-- FishyJoes.export(witness) -->
    func witness() throws -> TestAsyncFunctions
}

extension TestAsyncFunctions {
    /// <!-- FishyJoes.export(defaultExercise6) -->
    public func defaultExercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) async throws -> String {
        try await "\(fn("213", 89, 2.4, "23", { 546 }, 89))"
    }
}

/// <!-- FishyJoes.export(TestAsyncForeignSideFunctionsStruct, conformances: [TestAsyncFunctions]) -->
public struct TestAsyncForeignSideFunctionsStruct: TestAsyncFunctions {
    public let const42: AsyncFunctions.AFun0
    public let iabs: AsyncFunctions.AFun1
    public let intCompose: AsyncFunctions.AFun2
    public let add3Things: AsyncFunctions.AFun3
    public let makeList: AsyncFunctions.AFun4
    public let fifthThing: AsyncFunctions.AFun5
    public let six: AsyncFunctions.AFun6
    public let willThrow: AsyncFunctions.AFun0
    public let exercise0Fun: (@escaping AsyncFunctions.AFun0) async throws -> String
    public let exercise1Fun: (@escaping AsyncFunctions.AFun1) async throws -> String
    public let exercise2Fun: (@escaping AsyncFunctions.AFun2) async throws -> String
    public let exercise3Fun: (@escaping AsyncFunctions.AFun3) async throws -> String
    public let exercise4Fun: (@escaping AsyncFunctions.AFun4) async throws -> String
    public let exercise5Fun: (@escaping AsyncFunctions.AFun5) async throws -> String
    public let exercise6Fun: (@escaping AsyncFunctions.AFun6) async throws -> String
    public let thunkTwiceMakerFun: (@escaping () async throws -> Void) throws -> () async throws -> Void

    public init(
        const42: @escaping AsyncFunctions.AFun0,
        iabs: @escaping AsyncFunctions.AFun1,
        intCompose: @escaping AsyncFunctions.AFun2,
        add3Things: @escaping AsyncFunctions.AFun3,
        makeList: @escaping AsyncFunctions.AFun4,
        fifthThing: @escaping AsyncFunctions.AFun5,
        six: @escaping AsyncFunctions.AFun6,
        willThrow: @escaping AsyncFunctions.AFun0,
        exercise0Fun: @escaping (@escaping AsyncFunctions.AFun0) async throws -> String,
        exercise1Fun: @escaping (@escaping AsyncFunctions.AFun1) async throws -> String,
        exercise2Fun: @escaping (@escaping AsyncFunctions.AFun2) async throws -> String,
        exercise3Fun: @escaping (@escaping AsyncFunctions.AFun3) async throws -> String,
        exercise4Fun: @escaping (@escaping AsyncFunctions.AFun4) async throws -> String,
        exercise5Fun: @escaping (@escaping AsyncFunctions.AFun5) async throws -> String,
        exercise6Fun: @escaping (@escaping AsyncFunctions.AFun6) async throws -> String,
        thunkTwiceMakerFun: @escaping (@escaping () async throws -> Void) throws -> () async throws -> Void
    ) {
        self.const42 = const42
        self.iabs = iabs
        self.intCompose = intCompose
        self.add3Things = add3Things
        self.makeList = makeList
        self.fifthThing = fifthThing
        self.six = six
        self.willThrow = willThrow
        self.exercise0Fun = exercise0Fun
        self.exercise1Fun = exercise1Fun
        self.exercise2Fun = exercise2Fun
        self.exercise3Fun = exercise3Fun
        self.exercise4Fun = exercise4Fun
        self.exercise5Fun = exercise5Fun
        self.exercise6Fun = exercise6Fun
        self.thunkTwiceMakerFun = thunkTwiceMakerFun
    }
    /// <!-- FishyJoes.export(exercise0) -->
    public func exercise0(_ fn: @escaping AsyncFunctions.AFun0) async throws -> String {
        try await exercise0Fun(fn)
    }
    /// <!-- FishyJoes.export(exercise1) -->
    public func exercise1(_ fn: @escaping AsyncFunctions.AFun1) async throws -> String {
        try await exercise1Fun(fn)
    }
    /// <!-- FishyJoes.export(exercise2) -->
    public func exercise2(_ fn: @escaping AsyncFunctions.AFun2) async throws -> String {
        try await exercise2Fun(fn)
    }
    /// <!-- FishyJoes.export(exercise3) -->
    public func exercise3(_ fn: @escaping AsyncFunctions.AFun3) async throws -> String {
        try await exercise3Fun(fn)
    }
    /// <!-- FishyJoes.export(exercise4) -->
    public func exercise4(_ fn: @escaping AsyncFunctions.AFun4) async throws -> String {
        try await exercise4Fun(fn)
    }
    /// <!-- FishyJoes.export(exercise5) -->
    public func exercise5(_ fn: @escaping AsyncFunctions.AFun5) async throws -> String {
        try await exercise5Fun(fn)
    }
    /// <!-- FishyJoes.export(exercise6) -->
    public func exercise6(_ fn: @escaping AsyncFunctions.AFun6) async throws -> String {
        try await exercise6Fun(fn)
    }
    // void -> void functions are an edge case in C#
    /// <!-- FishyJoes.export(thunkTwiceMaker) -->
    public func thunkTwiceMaker(thunk: @escaping () async throws -> Void) throws -> () async throws -> Void {
        try thunkTwiceMakerFun(thunk)
    }
    /// <!-- FishyJoes.export(witness) -->
    public func witness() throws -> TestAsyncFunctions {
        TestAsyncForeignSideFunctionsStruct(
            const42: const42,
            iabs: iabs,
            intCompose: intCompose,
            add3Things: add3Things,
            makeList: makeList,
            fifthThing: fifthThing,
            six: six,
            willThrow: willThrow,
            exercise0Fun: exercise0Fun,
            exercise1Fun: exercise1Fun,
            exercise2Fun: exercise2Fun,
            exercise3Fun: exercise3Fun,
            exercise4Fun: exercise4Fun,
            exercise5Fun: exercise5Fun,
            exercise6Fun: exercise6Fun,
            thunkTwiceMakerFun: thunkTwiceMakerFun
        )
    }
}

/// <!-- FishyJoes.export(TestAsyncSwiftSideFunctionsClass, conformances: [TestAsyncFunctions]) -->
public class TestAsyncSwiftSideFunctionsClass: TestAsyncFunctions {
    /// <!-- FishyJoes.export(const42) -->
    public var const42: AsyncFunctions.AFun0 { AsyncFunctions.const42 }
    /// <!-- FishyJoes.export(iabs) -->
    public var iabs: AsyncFunctions.AFun1 { AsyncFunctions.iabs }
    /// <!-- FishyJoes.export(intCompose) -->
    public var intCompose: AsyncFunctions.AFun2 { AsyncFunctions.intCompose }
    /// <!-- FishyJoes.export(add3Things) -->
    public var add3Things: AsyncFunctions.AFun3 { AsyncFunctions.add3Things }
    /// <!-- FishyJoes.export(makeList) -->
    public var makeList: AsyncFunctions.AFun4 { AsyncFunctions.makeList }
    /// <!-- FishyJoes.export(fifthThing) -->
    public var fifthThing: AsyncFunctions.AFun5 { AsyncFunctions.fifthThing }
    /// <!-- FishyJoes.export(six) -->
    public var six: AsyncFunctions.AFun6 { AsyncFunctions.six }
    /// <!-- FishyJoes.export(willThrow) -->
    public var willThrow: AsyncFunctions.AFun0 {
        AsyncFunctions.willThrow
    }
    /// <!-- FishyJoes.export(exercise0) -->
    public func exercise0(_ fn: @escaping AsyncFunctions.AFun0) async throws -> String {
        try await AsyncFunctions.exercise0(fn)
    }
    /// <!-- FishyJoes.export(exercise1) -->
    public func exercise1(_ fn: @escaping AsyncFunctions.AFun1) async throws -> String {
        try await AsyncFunctions.exercise1(fn)
    }
    /// <!-- FishyJoes.export(exercise2) -->
    public func exercise2(_ fn: @escaping AsyncFunctions.AFun2) async throws -> String {
        try await AsyncFunctions.exercise2(fn)
    }
    /// <!-- FishyJoes.export(exercise3) -->
    public func exercise3(_ fn: @escaping AsyncFunctions.AFun3) async throws -> String {
        try await AsyncFunctions.exercise3(fn)
    }
    /// <!-- FishyJoes.export(exercise4) -->
    public func exercise4(_ fn: @escaping AsyncFunctions.AFun4) async throws -> String {
        try await AsyncFunctions.exercise4(fn)
    }
    /// <!-- FishyJoes.export(exercise5) -->
    public func exercise5(_ fn: @escaping AsyncFunctions.AFun5) async throws -> String {
        try await AsyncFunctions.exercise5(fn)
    }
    /// <!-- FishyJoes.export(exercise6) -->
    public func exercise6(_ fn: @escaping AsyncFunctions.AFun6) async throws -> String {
        try await AsyncFunctions.exercise6(fn)
    }
    // void -> void functions are an edge case in C#
    /// <!-- FishyJoes.export(thunkTwiceMaker) -->
    public func thunkTwiceMaker(thunk: @escaping () async throws -> Void) throws -> () async throws -> Void {
        {
            try await thunk()
            try await thunk()
        }
    }
    /// <!-- FishyJoes.export(witness) -->
    public func witness() throws -> TestAsyncFunctions {
        TestAsyncSwiftSideFunctionsClass()
    }

    /// <!-- FishyJoes.export(init) -->
    public init() {}
}
