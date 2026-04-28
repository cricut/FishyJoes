"""Shared cffi.FFI() instance + serialising lock + thread-safe ``cdef`` helper.

Internal to the ``fishyjoes_python.iota`` package.  Re-exported from
``fishyjoes_python.iota`` so existing imports continue to work
unchanged after the file split.
"""

from __future__ import annotations

import threading

import cffi

# A single shared FFI instance for all Iota ABI operations.
_ffi = cffi.FFI()

# cffi does not document concurrent ``cdef`` as safe; serialise every
# mutation of the shared FFI instance behind this lock.  Plain ``Lock``
# (not ``RLock``) on purpose — recursive ``cdef`` from inside the runtime
# would itself be a bug.
_ffi_lock = threading.Lock()


def _cdef(declaration: str, *, override: bool = False) -> None:
    """Thread-safe wrapper around ``_ffi.cdef``."""
    with _ffi_lock:
        _ffi.cdef(declaration, override=override)


# Base declarations needed before any library is loaded.  Runs at
# import time, before any thread can race.
_ffi.cdef("""
    typedef unsigned char uint8_t;
    typedef unsigned short uint16_t;
    typedef unsigned int uint32_t;
    typedef unsigned long long uint64_t;
    typedef signed char int8_t;
    typedef short int16_t;
    typedef int int32_t;
    typedef long long int64_t;
    typedef size_t uintptr_t;
    typedef ssize_t intptr_t;
""")
