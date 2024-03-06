#include <node_api.h>
extern napi_value registerModuleTestAPI(napi_env env, napi_value exports);
napi_value napi_register_module_v1(napi_env env, napi_value exports) {
    return registerModuleTestAPI(env, exports);
}
