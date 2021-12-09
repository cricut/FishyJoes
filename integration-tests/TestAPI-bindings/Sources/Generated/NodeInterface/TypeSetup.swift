// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesNodeRuntime
import Foundation
import TestAPI

@_cdecl("napi_register_module_v1")
public func napi_register_module_v1(env: napi_env, exports: napi_value) -> napi_value? {
    FishyJoesNodeRuntime.rethrowToNode(env: env) {
        var module: napi_value!
        try check(napi_create_object(env, &module))
        napi_set_named_property(env, exports, "TestAPI", module)
        napi_set_named_property(env, exports, "default", module)

        try ExportedByReference.nodeSetup(env: env, module: module)
        try String.nodeSetup(env: env, module: module)
        return exports
    }
}
