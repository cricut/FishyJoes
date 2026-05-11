// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import EmojiFun
import EmojiFun_NodeInterface
import FishyJoesNodeRuntime
import NodeAPI

@available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
@_cdecl("napi_register_module_v1")
public func napi_register_module_v1(env: napi_env, exports: napi_value) -> napi_value? {
    let env = NAPI.Env(ptr: env)
    var exports = NAPI.Value(ptr: exports)
    return FishyJoesNodeRuntime.rethrowToNode(env: env) {
        exports = try registerModuleRuntime(env: env, exports: exports)
        exports = try registerModuleEmojiFun(env: env, exports: exports)
        return exports
    }
}
