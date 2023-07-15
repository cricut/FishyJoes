import Foundation
import NodeAPI

#if !os(WASI)
@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
@_cdecl("napi_register_module_v1")
public func napi_register_module_v1(env: napi_env, exports: napi_value) -> napi_value? {
    let env = NAPI.Env(ptr: env)
    let exports = NAPI.Value(ptr: exports)
    return FishyJoesNodeRuntime.rethrowToNode(env: env) {
        try registerModuleRuntime(env: env, exports: exports)
    }
}
#endif

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
public func registerModuleRuntime(env: NAPI.Env, exports: NAPI.Value) throws -> NAPI.Value {
    let module = try env.createObject()
    try env.setNamedProperty(exports, "FishyJoesRuntime", module)
    try env.setNamedProperty(exports, "default", module)

    try AttributeContainer.nodeSetup(env: env, module: module)
    try AttributedString.nodeSetup(env: env, module: module)
    try AttributedSubstring.nodeSetup(env: env, module: module)
    try AttributedString.CharacterView.nodeSetup(env: env, module: module)
    try AttributeContainer.FoundationAttributes.nodeSetup(env: env, module: module)
    try AttributedString.Runs.Index.nodeSetup(env: env, module: module)
    try AttributedString.Index.nodeSetup(env: env, module: module)
    try AttributedString.Runs.Run.nodeSetup(env: env, module: module)
    try AttributedString.Runs.nodeSetup(env: env, module: module)
    try AttributedString.UnicodeScalarView.nodeSetup(env: env, module: module)
    return exports
}
