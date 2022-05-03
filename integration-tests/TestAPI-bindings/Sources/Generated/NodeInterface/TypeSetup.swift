// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesNodeRuntime
import Foundation
import NodeAPI
import TestAPI

@_cdecl("napi_register_module_v1")
public func napi_register_module_v1(env: napi_env, exports: napi_value) -> napi_value? {
    let env = NAPI.Env(ptr: env)
    let exports = NAPI.Value(ptr: exports)
    return FishyJoesNodeRuntime.rethrowToNode(env: env) {
        let module = try env.createObject()
        try env.setNamedProperty(exports, "TestAPI", module)
        try env.setNamedProperty(exports, "default", module)

        try Bool.nodeSetup(env: env, module: module)
        try Bytes.nodeSetup(env: env, module: module)
        try Collections.CollectionHolder.nodeSetup(env: env, module: module)
        try Collections.nodeSetup(env: env, module: module)
        try Data.nodeSetup(env: env, module: module)
        try Double.nodeSetup(env: env, module: module)
        try Float.nodeSetup(env: env, module: module)
        try Int.nodeSetup(env: env, module: module)
        try Int16.nodeSetup(env: env, module: module)
        try Int32.nodeSetup(env: env, module: module)
        try Int64.nodeSetup(env: env, module: module)
        try Int8.nodeSetup(env: env, module: module)
        try Structs.MemberwiseStruct.nodeSetup(env: env, module: module)
        try Primitives.PrimitiveHolder.nodeSetup(env: env, module: module)
        try Primitives.nodeSetup(env: env, module: module)
        try Structs.ReferenceStruct.nodeSetup(env: env, module: module)
        try String.nodeSetup(env: env, module: module)
        try Strings.nodeSetup(env: env, module: module)
        try Structs.nodeSetup(env: env, module: module)
        try Tuples.nodeSetup(env: env, module: module)
        try UInt16.nodeSetup(env: env, module: module)
        try UInt32.nodeSetup(env: env, module: module)
        try UInt64.nodeSetup(env: env, module: module)
        try UInt8.nodeSetup(env: env, module: module)
        return exports
    }
}
