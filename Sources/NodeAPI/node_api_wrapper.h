#define NAPI_EXPERIMENTAL
#include "node_api.h"

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
