// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestMethodsProtocol: TestAPI.TestMethodsProtocol {
    let _nodeWitness: NodeReference

    var fooImpl: (() -> Void)?
    public func foo() throws {
        fooImpl!()
    }
    var barImpl: (() -> Bool)?
    public func bar() throws -> Bool {
        barImpl!()
    }
    var bazImpl: (() -> Void)?
    public func baz(qux: Bool) throws {
        bazImpl!()
    }
    var garplyImpl: (() -> String)?
    public func garply(_ _0: String) throws -> String {
        garplyImpl!()
    }
    var xyzzyImpl: (() -> String)?
    public func xyzzy(thud: Int, grault: Array<Double>) throws -> String {
        xyzzyImpl!()
    }
    var plughImpl: (() -> (Bool, Int, String))?
    public func plugh(fred: (Bool, Double, Array<String>)) throws -> (Bool, Int, String) {
        plughImpl!()
    }
}
extension TestAPI_CommonInterface._TestMethodsProtocolConverter: NodeMutator {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        fatalError("TODO: node protocol support")
    }
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        fatalError("TODO: node protocol support")
    }
    public static func mutateNode(_ value: SwiftType, this: NAPI.Value, env: NAPI.Env) throws {
        fatalError("TODO: node protocol support")
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
    }
}
