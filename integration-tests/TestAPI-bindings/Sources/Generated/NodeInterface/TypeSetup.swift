// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
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
    let module = try env.createObject()
    try env.setNamedProperty(exports, "TestAPI", module)
    try env.setNamedProperty(exports, "default", module)

    try Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces.nodeSetup(env: env, module: module)
    try Swift.String.PuttingTypesIntoQuestionablePlaces.nodeSetup(env: env, module: module)
    try Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.nodeSetup(env: env, module: module)
    try TestAPI.Collections.CollectionHolder.nodeSetup(env: env, module: module)
    try TestAPI.Functions.TheError.nodeSetup(env: env, module: module)
    try TestAPI.Primitives.PrimitiveHolder.nodeSetup(env: env, module: module)
    try TestAPI.Structs.MemberwiseStruct.nodeSetup(env: env, module: module)
    try TestAPI.Structs.PuttingTypesIntoQuestionablePlaces.nodeSetup(env: env, module: module)
    try TestAPI.Structs.ReferenceStruct.nodeSetup(env: env, module: module)
    try TestAPI.AssociatedDataEnum.nodeSetup(env: env, module: module)
    try TestAPI.AttributedStrings.nodeSetup(env: env, module: module)
    try TestAPI.Bytes.nodeSetup(env: env, module: module)
    try TestAPI.ClosedRanges.nodeSetup(env: env, module: module)
    try TestAPI.Collections.nodeSetup(env: env, module: module)
    try TestAPI.DefaultArguments.nodeSetup(env: env, module: module)
    try TestAPI.Deprecations.nodeSetup(env: env, module: module)
    try TestAPI.EmptyEnum.nodeSetup(env: env, module: module)
    try TestAPI.Functions.nodeSetup(env: env, module: module)
    try TestAPI.Methods.nodeSetup(env: env, module: module)
    try TestAPI.Primitives.nodeSetup(env: env, module: module)
    try TestAPI.Ranges.nodeSetup(env: env, module: module)
    try TestAPI.SimpleEnum.nodeSetup(env: env, module: module)
    try TestAPI.Strings.nodeSetup(env: env, module: module)
    try TestAPI.Structs.nodeSetup(env: env, module: module)
    try TestAPI.TestProtocol.nodeSetup(env: env, module: module)
    try TestAPI.TestProtocolEnum.nodeSetup(env: env, module: module)
    try TestAPI.Tuples.nodeSetup(env: env, module: module)
    try TestAPI.URLs.nodeSetup(env: env, module: module)
    try Bool.nodeSetup(env: env, module: module)
    try Data.nodeSetup(env: env, module: module)
    try Double.nodeSetup(env: env, module: module)
    try Float.nodeSetup(env: env, module: module)
    try Int.nodeSetup(env: env, module: module)
    try Int16.nodeSetup(env: env, module: module)
    try Int32.nodeSetup(env: env, module: module)
    try Int64.nodeSetup(env: env, module: module)
    try Int8.nodeSetup(env: env, module: module)
    try String.nodeSetup(env: env, module: module)
    try UInt.nodeSetup(env: env, module: module)
    try UInt16.nodeSetup(env: env, module: module)
    try UInt32.nodeSetup(env: env, module: module)
    try UInt64.nodeSetup(env: env, module: module)
    try UInt8.nodeSetup(env: env, module: module)
    try URL.nodeSetup(env: env, module: module)
    return exports
}
