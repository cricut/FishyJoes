// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestOptionalsProtocol: TestAPI.TestOptionalsProtocol {
    let _nodeWitness: NodeReference

    var flarp: Optional<String>
    var wombatImpl: (() -> Optional<Double>)?
    public func wombat(zxc: Optional<Int>) throws -> Optional<Double> {
        wombatImpl!()
    }
    var spqrImpl: (() -> Int)?
    public func spqr(_ pippo: AssociatedDataEnum) throws -> Int {
        spqrImpl!()
    }
}
extension TestAPI_CommonInterface._TestOptionalsProtocolConverter: NodeMutator {
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
