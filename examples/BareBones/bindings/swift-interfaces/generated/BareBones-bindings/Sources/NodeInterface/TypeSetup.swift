// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import BareBones
import BareBones_CommonInterface
import FishyJoesNodeRuntime
import Foundation
import NodeAPI

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
public func registerModuleBareBones(env: NAPI.Env, exports: NAPI.Value) throws -> NAPI.Value {
    #if os(WASI)
    try JavaScriptEventLoop.installGlobalExecutor(env: env)
    #endif
    try setupOnMainThreadEntryPoint(env: env)
    let module = try env.createObject()
    try env.setNamedProperty(exports, "BareBones", module)
    try env.setNamedProperty(exports, "default", module)

    try BareBones.Skeleton.nodeSetup(env: env, module: module)
    // Call once in TypeSetup to work around a Windows delayload llvm bug described here: https://github.com/llvm/llvm-project/issues/51941. This affects functions with doubles in the first or second argument, which get put into xmm0 and xmm1, and the delayload somehow clobbers the stack where they are stored so when the napi function is done and the stack is popped back into xmm0 and xmm1 the value is incorrect. This needs to be done for both napi_create_double and napi_create_date.
    _ = try env.createDouble(42.0)
    _ = try env.createDate(42.0)
    return exports
}

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
@_cdecl("registerModuleBareBones")
public func cRegisterModuleBareBones(env: napi_env, exports: napi_value) -> napi_value? {
    let env = NAPI.Env(ptr: env)
    let exports = NAPI.Value(ptr: exports)
    return FishyJoesNodeRuntime.rethrowToNode(env: env) {
        try registerModuleBareBones(env: env, exports: exports)
    }
}
