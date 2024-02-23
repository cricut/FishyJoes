import NodeAPI
import FishyJoesNodeRuntime
import TestAPI_NodeInterface
@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
@_cdecl("TestAPI_register_module")
public func TestAPI_register_module(env: napi_env, exports: napi_value) -> napi_value? {
    let env = NAPI.Env(ptr: env)
    let exports = NAPI.Value(ptr: exports)
    return FishyJoesNodeRuntime.rethrowToNode(env: env) {
        try registerModuleTestAPI(env: env, exports: exports)
    }
}
