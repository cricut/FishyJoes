// Copied from https://github.com/nodejs/node/blob/v19.7.0/src/

// Copyright Node.js contributors. All rights reserved.

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.


#ifndef SRC_NODE_API_TYPES_H_
#define SRC_NODE_API_TYPES_H_

#include "js_native_api_types.h"

typedef struct napi_callback_scope__* napi_callback_scope;
typedef struct napi_async_context__* napi_async_context;
typedef struct napi_async_work__* napi_async_work;

#if NAPI_VERSION >= 3
typedef void(NAPI_CDECL* napi_cleanup_hook)(void* arg);
#endif  // NAPI_VERSION >= 3

#if NAPI_VERSION >= 4
typedef struct napi_threadsafe_function__* napi_threadsafe_function;
#endif  // NAPI_VERSION >= 4

#if NAPI_VERSION >= 4
typedef enum {
  napi_tsfn_release,
  napi_tsfn_abort
} napi_threadsafe_function_release_mode;

typedef enum {
  napi_tsfn_nonblocking,
  napi_tsfn_blocking
} napi_threadsafe_function_call_mode;
#endif  // NAPI_VERSION >= 4

typedef void(NAPI_CDECL* napi_async_execute_callback)(napi_env env, void* data);
typedef void(NAPI_CDECL* napi_async_complete_callback)(napi_env env,
                                                       napi_status status,
                                                       void* data);
#if NAPI_VERSION >= 4
typedef void(NAPI_CDECL* napi_threadsafe_function_call_js)(
    napi_env env, napi_value js_callback, void* context, void* data);
#endif  // NAPI_VERSION >= 4

typedef struct {
  uint32_t major;
  uint32_t minor;
  uint32_t patch;
  const char* release;
} napi_node_version;

#if NAPI_VERSION >= 8
typedef struct napi_async_cleanup_hook_handle__* napi_async_cleanup_hook_handle;
typedef void(NAPI_CDECL* napi_async_cleanup_hook)(
    napi_async_cleanup_hook_handle handle, void* data);
#endif  // NAPI_VERSION >= 8

#endif  // SRC_NODE_API_TYPES_H_
