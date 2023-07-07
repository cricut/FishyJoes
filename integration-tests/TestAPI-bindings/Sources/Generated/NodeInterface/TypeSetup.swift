// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import NodeAPI
import TestAPI

#if !os(WASI)
@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
@_cdecl("napi_register_module_v1")
public func napi_register_module_v1(env: napi_env, exports: napi_value) -> napi_value? {
    let env = NAPI.Env(ptr: env)
    let exports = NAPI.Value(ptr: exports)
    return FishyJoesNodeRuntime.rethrowToNode(env: env) {
        try registerModuleTestAPI(env: env, exports: exports)
    }
}
#endif

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
public func registerModuleTestAPI(env: NAPI.Env, exports: NAPI.Value) throws -> NAPI.Value {
    #if os(WASI)
    try JavaScriptEventLoop.installGlobalExecutor(env: env)
    #endif
    try setupOnMainThreadEntryPoint(env: env)
    let module = try env.createObject()
    try env.setNamedProperty(exports, "TestAPI", module)
    try env.setNamedProperty(exports, "default", module)

    try AssociatedDataEnum.nodeSetup(env: env, module: module)
    try Bool.nodeSetup(env: env, module: module)
    try Bytes.nodeSetup(env: env, module: module)
    try Collections.CollectionHolder.nodeSetup(env: env, module: module)
    try Collections.nodeSetup(env: env, module: module)
    try Data.nodeSetup(env: env, module: module)
    try DefaultArguments.nodeSetup(env: env, module: module)
    try Deprecations.nodeSetup(env: env, module: module)
    try Double.nodeSetup(env: env, module: module)
    try EmptyEnum.nodeSetup(env: env, module: module)
    try Float.nodeSetup(env: env, module: module)
    try Functions.nodeSetup(env: env, module: module)
    try Int.nodeSetup(env: env, module: module)
    try Int16.nodeSetup(env: env, module: module)
    try Int32.nodeSetup(env: env, module: module)
    try Int64.nodeSetup(env: env, module: module)
    try Int8.nodeSetup(env: env, module: module)
    try Structs.MemberwiseStruct.nodeSetup(env: env, module: module)
    try Structs.MutableStruct.nodeSetup(env: env, module: module)
    try Primitives.PrimitiveHolder.nodeSetup(env: env, module: module)
    try Primitives.nodeSetup(env: env, module: module)
    try Structs.ReferenceStruct.nodeSetup(env: env, module: module)
    try SimpleEnum.nodeSetup(env: env, module: module)
    try String.nodeSetup(env: env, module: module)
    try Strings.nodeSetup(env: env, module: module)
    try Structs.nodeSetup(env: env, module: module)
    try Functions.TheError.nodeSetup(env: env, module: module)
    try Tuples.nodeSetup(env: env, module: module)
    try UInt16.nodeSetup(env: env, module: module)
    try UInt32.nodeSetup(env: env, module: module)
    try UInt64.nodeSetup(env: env, module: module)
    try UInt8.nodeSetup(env: env, module: module)
    return exports
}
