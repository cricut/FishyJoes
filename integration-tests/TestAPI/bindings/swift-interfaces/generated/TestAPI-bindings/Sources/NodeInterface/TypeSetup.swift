// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import NodeAPI
import TestAPI
import TestAPI_CommonInterface

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
public func registerModuleTestAPI(env: NAPI.Env, exports: NAPI.Value) throws -> NAPI.Value {
    #if os(WASI)
    try JavaScriptEventLoop.installGlobalExecutor(env: env)
    #endif
    try setupOnMainThreadEntryPoint(env: env)
    let module = try env.createObject()
    try env.setNamedProperty(exports, "TestAPI", module)
    try env.setNamedProperty(exports, "default", module)

    try Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces.nodeSetup(env: env, module: module)
    try Swift.String.PuttingTypesIntoQuestionablePlaces.nodeSetup(env: env, module: module)
    try Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.nodeSetup(env: env, module: module)
    try TestAPI.Actors.TemperatureLogger.nodeSetup(env: env, module: module)
    try TestAPI.Collections.CollectionHolder.nodeSetup(env: env, module: module)
    try TestAPI.Methods.TheMethodError.nodeSetup(env: env, module: module)
    try TestAPI.Primitives.PrimitiveHolder.nodeSetup(env: env, module: module)
    try TestAPI.Results.Error.nodeSetup(env: env, module: module)
    try TestAPI.Structs.MemberwiseStruct.nodeSetup(env: env, module: module)
    try TestAPI.Structs.MutableStruct.nodeSetup(env: env, module: module)
    try TestAPI.Structs.PuttingTypesIntoQuestionablePlaces.nodeSetup(env: env, module: module)
    try TestAPI.Structs.ReferenceStruct.nodeSetup(env: env, module: module)
    try TestAPI.Structs.TwentyOneItemStruct.nodeSetup(env: env, module: module)
    try TestAPI_CommonInterface._AProtocolConverter.nodeSetup(env: env, module: module)
    try TestAPI.AProtocolImplementation.nodeSetup(env: env, module: module)
    try TestAPI.Actors.nodeSetup(env: env, module: module)
    try TestAPI.AssociatedDataEnum.nodeSetup(env: env, module: module)
    try TestAPI.AsyncFunctions.nodeSetup(env: env, module: module)
    try TestAPI.AttributedStrings.nodeSetup(env: env, module: module)
    try TestAPI.Bytes.nodeSetup(env: env, module: module)
    try TestAPI.ClosedRanges.nodeSetup(env: env, module: module)
    try TestAPI.Collections.nodeSetup(env: env, module: module)
    try TestAPI.DefaultArguments.nodeSetup(env: env, module: module)
    try TestAPI.Deprecations.nodeSetup(env: env, module: module)
    try TestAPI.EmptyClass.nodeSetup(env: env, module: module)
    try TestAPI.EmptyClass2.nodeSetup(env: env, module: module)
    try TestAPI.EmptyEnum.nodeSetup(env: env, module: module)
    try TestAPI.EmptyStruct.nodeSetup(env: env, module: module)
    try TestAPI.EmptyStruct2.nodeSetup(env: env, module: module)
    try TestAPI.Functions.nodeSetup(env: env, module: module)
    try TestAPI.Methods.nodeSetup(env: env, module: module)
    try TestAPI.Primitives.nodeSetup(env: env, module: module)
    try TestAPI.Ranges.nodeSetup(env: env, module: module)
    try TestAPI.ReferenceEmptyEnum.nodeSetup(env: env, module: module)
    try TestAPI.Results.nodeSetup(env: env, module: module)
    try TestAPI.SimpleEnum.nodeSetup(env: env, module: module)
    try TestAPI.Strings.nodeSetup(env: env, module: module)
    try TestAPI.Structs.nodeSetup(env: env, module: module)
    try TestAPI.TestAsyncForeignSideFunctionsStruct.nodeSetup(env: env, module: module)
    try TestAPI_CommonInterface._TestAsyncFunctionsConverter.nodeSetup(env: env, module: module)
    try TestAPI.TestAsyncSwiftSideFunctionsClass.nodeSetup(env: env, module: module)
    try TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter.nodeSetup(env: env, module: module)
    try TestAPI.TestDefaultComputedPropertiesClass.nodeSetup(env: env, module: module)
    try TestAPI.TestDefaultComputedPropertiesEnum.nodeSetup(env: env, module: module)
    try TestAPI.TestDefaultComputedPropertiesStruct.nodeSetup(env: env, module: module)
    try TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter.nodeSetup(env: env, module: module)
    try TestAPI.TestDifferingExportNameStruct.nodeSetup(env: env, module: module)
    try TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter.nodeSetup(env: env, module: module)
    try TestAPI.TestLeadingUnderscoredPropStruct.nodeSetup(env: env, module: module)
    try TestAPI_CommonInterface._TestMethodsProtocolConverter.nodeSetup(env: env, module: module)
    try TestAPI.TestNonExportedProtocolEnum.nodeSetup(env: env, module: module)
    try TestAPI_CommonInterface._TestOptionalsProtocolConverter.nodeSetup(env: env, module: module)
    try TestAPI_CommonInterface._TestPropertiesProtocolConverter.nodeSetup(env: env, module: module)
    try TestAPI.TestProtocolClass.nodeSetup(env: env, module: module)
    try TestAPI.TestProtocolEnum.nodeSetup(env: env, module: module)
    try TestAPI.TestProtocolStruct.nodeSetup(env: env, module: module)
    try TestAPI.Tuples.nodeSetup(env: env, module: module)
    try TestAPI.URLs.nodeSetup(env: env, module: module)
    // Call once in TypeSetup to work around a Windows delayload llvm bug described here: https://github.com/llvm/llvm-project/issues/51941. This affects functions with doubles in the first or second argument, which get put into xmm0 and xmm1, and the delayload somehow clobbers the stack where they are stored so when the napi function is done and the stack is popped back into xmm0 and xmm1 the value is incorrect. This needs to be done for both napi_create_double and napi_create_date.
    _ = try env.createDouble(42.0)
    _ = try env.createDate(42.0)
    return exports
}

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
@_cdecl("registerModuleTestAPI")
public func cRegisterModuleTestAPI(env: napi_env, exports: napi_value) -> napi_value? {
    let env = NAPI.Env(ptr: env)
    let exports = NAPI.Value(ptr: exports)
    return FishyJoesNodeRuntime.rethrowToNode(env: env) {
        try registerModuleTestAPI(env: env, exports: exports)
    }
}
