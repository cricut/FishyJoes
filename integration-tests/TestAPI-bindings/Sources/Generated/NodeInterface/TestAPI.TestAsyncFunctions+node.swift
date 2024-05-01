// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestAsyncFunctions: TestAPI.TestAsyncFunctions {
    let _nodeWitness: NodeReference

    var add3Things: (Float, Double, Int) async throws -> Double
    var const42: () async throws -> Int
    var fifthThing: (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int
    var iabs: (Int) async throws -> Int
    var intCompose: (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int
    var makeList: (String, String, String, String) async throws -> Array<String>
    var six: (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int
    var willThrow: () async throws -> Int
    var exercise0Impl: (() -> String)?
    public func exercise0(_ fn: @escaping () async throws -> Int) throws -> String {
        exercise0Impl!()
    }
    var exercise1Impl: (() -> String)?
    public func exercise1(_ fn: @escaping (Int) async throws -> Int) throws -> String {
        exercise1Impl!()
    }
    var exercise2Impl: (() -> String)?
    public func exercise2(_ fn: @escaping (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int) throws -> String {
        exercise2Impl!()
    }
    var exercise3Impl: (() -> String)?
    public func exercise3(_ fn: @escaping (Float, Double, Int) async throws -> Double) throws -> String {
        exercise3Impl!()
    }
    var exercise4Impl: (() -> String)?
    public func exercise4(_ fn: @escaping (String, String, String, String) async throws -> Array<String>) throws -> String {
        exercise4Impl!()
    }
    var exercise5Impl: (() -> String)?
    public func exercise5(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int) throws -> String {
        exercise5Impl!()
    }
    var exercise6Impl: (() -> String)?
    public func exercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) throws -> String {
        exercise6Impl!()
    }
    var thunkTwiceMakerImpl: (() -> () async throws -> Void)?
    public func thunkTwiceMaker(thunk: @escaping () async throws -> Void) throws -> () async throws -> Void {
        thunkTwiceMakerImpl!()
    }
    var defaultExercise6Impl: (() -> String)?
    public func defaultExercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) throws -> String {
        defaultExercise6Impl!()
    }
    var witnessImpl: (() -> TestAsyncFunctions)?
    public func witness() throws -> TestAsyncFunctions {
        witnessImpl!()
    }
}
extension TestAPI_CommonInterface._TestAsyncFunctionsConverter: NodeMutator {
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
