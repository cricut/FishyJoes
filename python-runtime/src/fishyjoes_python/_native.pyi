"""Type stub for the ``_native`` C extension.

The pure-Python ``_native.py`` ships only ``native_runtime_version`` as a
fallback for documentation tools; the real entry points live in the
compiled ``_native.abi3.so``.  This stub describes the full surface so
type checkers see the same shape regardless of which implementation
imports.
"""

from __future__ import annotations

def native_runtime_version() -> str: ...

def malloc_copy_bytes(data: bytes) -> int:
    """Allocate a libc-managed C string and copy *data* into it.

    Returns the address as an int.  The Swift side calls free() on it.
    """

def retain(obj: object) -> int:
    """Increment refcount of *obj* and return its CPython address."""

def release(handle: int) -> None:
    """Decrement refcount of the object at *handle*.  Handle is invalid after."""

def borrow(handle: int) -> object:
    """Return the object at *handle* without changing its refcount."""
