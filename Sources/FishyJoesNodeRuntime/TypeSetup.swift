import Foundation
import NodeAPI

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
public func registerModuleRuntime(env: NAPI.Env, exports: NAPI.Value) throws -> NAPI.Value {
    let module = try env.createObject()
    try env.setNamedProperty(exports, "Runtime", module)
    try env.setNamedProperty(exports, "default", module)

    try RuntimeModule.nodeSetup(env: env, module: module)
    try installNodeCleanup(env: env, module: module)

    // Sorted alphabetically by type
    try AttributeContainer.nodeSetup(env: env, module: module)
    try AttributeContainer.FoundationAttributes.nodeSetup(env: env, module: module)
    try AttributedString.nodeSetup(env: env, module: module)
    try AttributedString.CharacterView.nodeSetup(env: env, module: module)
    try AttributedString.Index.nodeSetup(env: env, module: module)
    try AttributedString.Runs.nodeSetup(env: env, module: module)
    try AttributedString.Runs.Index.nodeSetup(env: env, module: module)
    try AttributedString.Runs.Run.nodeSetup(env: env, module: module)
    try AttributedString.UnicodeScalarView.nodeSetup(env: env, module: module)
    try AttributedSubstring.nodeSetup(env: env, module: module)
    try Data.nodeSetup(env: env, module: module)
    try FutureConverter<VoidConverter>.nodeSetup(env: env, module: module)
    return exports
}

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
@_cdecl("registerModuleRuntime")
public func registerModuleRuntimeC(env: napi_env, exports: napi_value) -> napi_value? {
    let swiftNapiEnv = NAPI.Env(ptr: env)
    return rethrowToNode(env: swiftNapiEnv) {
        try registerModuleRuntime(env: swiftNapiEnv, exports: .init(ptr: exports))
    }
}
