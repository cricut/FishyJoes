"""Iota FFI bridge for the FishyJoes Python runtime.

This is a package whose public import surface mirrors what
``fishyjoes_python.iota`` was when it lived in a single file —
existing ``from fishyjoes_python.iota import X`` callers continue to
work unchanged.  The split is purely organisational:

- ``_ffi`` — the shared cffi.FFI() instance, its lock, and the
  thread-safe ``_cdef`` wrapper.
- ``_handles`` — IotaHandle/NativeReference/IotaReference dataclasses
  and the small helpers that operate on raw handles.
- ``_runtime`` — the IotaRuntime class itself.
"""

from __future__ import annotations

from ._ffi import _cdef, _ffi, _ffi_lock
from ._handles import (
    ForeignObject,
    ForeignObjectPtr,
    IotaHandle,
    IotaReference,
    NativeReference,
    _as_handle,
    _assume,
    _borrow_python_value,
    _decode_utf16_z,
    _require_not_none,
    _value_type_name,
)
from ._runtime import IotaRuntime

__all__ = [
    "ForeignObject",
    "ForeignObjectPtr",
    "IotaHandle",
    "IotaReference",
    "IotaRuntime",
    "NativeReference",
    # Underscored entries are intentionally re-exported because tests
    # and generated code import them directly; listing them here also
    # tells ruff the imports above are not dead.
    "_as_handle",
    "_assume",
    "_borrow_python_value",
    "_cdef",
    "_decode_utf16_z",
    "_ffi",
    "_ffi_lock",
    "_require_not_none",
    "_value_type_name",
]
