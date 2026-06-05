// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import EmojiFun
import EmojiFun_CommonInterface
import FishyJoesNodeRuntime
import Foundation
import NodeAPI

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
public func registerModuleEmojiFun(env: NAPI.Env, exports: NAPI.Value) throws -> NAPI.Value {
    #if os(WASI)
    try JavaScriptEventLoop.installGlobalExecutor(env: env)
    #endif
    try setupOnMainThreadEntryPoint(env: env)
    let module = try env.createObject()
    try env.setNamedProperty(exports, "EmojiFun", module)
    try env.setNamedProperty(exports, "default", module)
    try installNodeCleanup(env: env, module: module)

    try EmojiFun.EmojiExplorer.nodeSetup(env: env, module: module)
    // Call once in TypeSetup to work around a Windows delayload llvm bug described here: https://github.com/llvm/llvm-project/issues/51941. This affects functions with doubles in the first or second argument, which get put into xmm0 and xmm1, and the delayload somehow clobbers the stack where they are stored so when the napi function is done and the stack is popped back into xmm0 and xmm1 the value is incorrect. This needs to be done for both napi_create_double and napi_create_date.
    _ = try env.createDouble(42.0)
    _ = try env.createDate(42.0)
    return exports
}

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
@_cdecl("registerModuleEmojiFun")
public func cRegisterModuleEmojiFun(env: napi_env, exports: napi_value) -> napi_value? {
    let env = NAPI.Env(ptr: env)
    let exports = NAPI.Value(ptr: exports)
    return FishyJoesNodeRuntime.rethrowToNode(env: env) {
        try registerModuleEmojiFun(env: env, exports: exports)
    }
}
