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
