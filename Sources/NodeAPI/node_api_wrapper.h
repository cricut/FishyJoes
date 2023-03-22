#define NAPI_EXPERIMENTAL

#if __has_include("/opt/homebrew/include/node/node_api.h")
#include "/opt/homebrew/include/node/node_api.h"
#elif __has_include("/usr/local/include/node/node_api.h")
#include "/usr/local/include/node/node_api.h"
#else
#include <node/node_api.h>
#endif

// Use structs instead of opaque pointers so that we get additional type safety in swift

struct swift_napi_env {
    napi_env ptr;
};

struct swift_napi_value {
    napi_callback_info ptr;
};

struct swift_napi_ref {
    napi_ref ptr;
};

struct swift_napi_handle_scope {
    napi_handle_scope ptr;
};

struct swift_napi_escapable_handle_scope {
    napi_escapable_handle_scope ptr;
};

struct swift_napi_callback_info {
    napi_callback_info ptr;
};

struct swift_napi_deferred {
    napi_deferred ptr;
};

#ifdef __wasm32__
NAPI_EXTERN napi_status NAPI_CDECL
napi_create_threadsafe_function(napi_env env,
                                napi_value func,
                                napi_value async_resource,
                                napi_value async_resource_name,
                                size_t max_queue_size,
                                size_t initial_thread_count,
                                void* thread_finalize_data,
                                napi_finalize thread_finalize_cb,
                                void* context,
                                napi_threadsafe_function_call_js call_js_cb,
                                napi_threadsafe_function* result);

NAPI_EXTERN napi_status NAPI_CDECL napi_get_threadsafe_function_context(
    napi_threadsafe_function func, void** result);

NAPI_EXTERN napi_status NAPI_CDECL
napi_call_threadsafe_function(napi_threadsafe_function func,
                              void* data,
                              napi_threadsafe_function_call_mode is_blocking);

NAPI_EXTERN napi_status NAPI_CDECL
napi_acquire_threadsafe_function(napi_threadsafe_function func);

NAPI_EXTERN napi_status NAPI_CDECL napi_release_threadsafe_function(
    napi_threadsafe_function func, napi_threadsafe_function_release_mode mode);

NAPI_EXTERN napi_status NAPI_CDECL
napi_unref_threadsafe_function(napi_env env, napi_threadsafe_function func);

NAPI_EXTERN napi_status NAPI_CDECL
napi_ref_threadsafe_function(napi_env env, napi_threadsafe_function func);
#endif
