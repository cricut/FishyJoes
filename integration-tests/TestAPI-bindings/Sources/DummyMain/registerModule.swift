import FishyJoesNodeRuntime
import NodeAPI
import NodeInterface

@_cdecl("napi_register_module_v1")
public func napi_register_module_v1(env: napi_env, exports: napi_value) -> napi_value? {
    let env = NAPI.Env(ptr: env)
    var exports = NAPI.Value(ptr: exports)
    return FishyJoesNodeRuntime.rethrowToNode(env: env) {
        exports = try registerModuleTestAPI(env: env, exports: exports)
        return exports
    }
}
