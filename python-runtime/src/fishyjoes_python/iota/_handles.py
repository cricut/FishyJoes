"""Handle/reference dataclasses + the small helpers that operate on them.

Internal to the ``fishyjoes_python.iota`` package.  Re-exported from
``fishyjoes_python.iota`` so existing imports continue to work
unchanged after the file split.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import TYPE_CHECKING, Any, Protocol, TypeAlias, TypeVar

from .. import _native as _native_ext
from ..exceptions import FishyJoesError, TypeMismatchError
from ._ffi import _ffi

if TYPE_CHECKING:
    from ._runtime import IotaRuntime


_T = TypeVar("_T")


def _assume(value: object, kind: type[_T]) -> _T:
    """Narrow ``value`` to ``kind``, raising ``TypeMismatchError`` if it
    does not match.

    This is the runtime-template's preferred way to cross the FFI
    boundary into typed Python: the ``isinstance`` check makes the type
    assertion a real runtime guard, and ``TypeVar`` narrowing means
    every callsite reads as a typed cast at zero residual mypy noise.
    """
    if not isinstance(value, kind):
        raise TypeMismatchError(kind.__name__, value)
    return value


# Public type aliases kept for compatibility with generated code.
ForeignObject: TypeAlias = Any  # cffi cdata void*
ForeignObjectPtr: TypeAlias = Any  # cffi cdata void**


def _require_not_none(value: object | None, name: str) -> None:
    """Invariant guard that survives ``python -O``.

    Plain ``assert`` is elided under ``-O`` / ``PYTHONOPTIMIZE``, so any
    invariant whose violation would corrupt the C boundary must raise an
    explicit exception instead.
    """
    if value is None:
        raise FishyJoesError(
            f"IotaRuntime invariant failed: {name} is None; "
            f"the runtime must be fully loaded before this call"
        )


def _decode_utf16_z(ptr: Any) -> str:
    if not ptr:
        return ""
    units: list[int] = []
    index = 0
    while True:
        unit = int(_ffi.cast("uint16_t*", ptr)[index])
        if unit == 0:
            break
        units.append(unit)
        index += 1
    raw = bytearray()
    for unit in units:
        raw.extend(unit.to_bytes(2, "little"))
    return raw.decode("utf-16-le")


def _borrow_python_value(handle: Any) -> object | None:
    """Return the Python object for *handle* without releasing it.

    *handle* may be an ``int``, a ``ctypes.c_void_p`` (from the ctypes
    compatibility shim), or a cffi cdata pointer.  ``None`` or zero means
    "no object".
    """
    if handle is None:
        return None
    # Unwrap ctypes.c_void_p from the ctypes compatibility shim (handle may
    # arrive as a ctypes integer type with a .value attribute).
    if hasattr(handle, "value"):
        handle = handle.value
        if handle is None:
            return None
    if not handle:
        return None
    if not isinstance(handle, int):
        try:
            handle = int(_ffi.cast("uintptr_t", handle))
        except TypeError:
            return None
    if not handle:
        return None
    return _native_ext.borrow(handle)


def _value_type_name(value: object | None) -> str:
    if value is None:
        return "None"
    return type(value).__name__


def _as_handle(value: object | int | None) -> int | None:
    if value is None:
        return None
    if isinstance(value, int):
        return value
    if isinstance(value, IotaReference):
        return value.handle.value
    if isinstance(value, NativeReference):
        return value.native_ref
    native_ref = getattr(value, "native_ref", None)
    if isinstance(native_ref, int) or native_ref is None:
        return native_ref
    handle = getattr(value, "handle", None)
    if isinstance(handle, IotaHandle):
        return handle.value
    if handle is not None and hasattr(handle, "value"):
        candidate = handle.value
        if isinstance(candidate, int) or candidate is None:
            return candidate
    return None


@dataclass(frozen=True, slots=True)
class IotaHandle:
    """Opaque handle for a native FishyJoes object."""

    value: int


class _ReleasableReference(Protocol):
    native_ref: int | None
    native_type: str

    def release(self) -> None: ...


@dataclass(slots=True)
class NativeReference:
    """Python-side wrapper around an opaque native reference."""

    native_ref: int | None = None
    native_type: str = "AnyBox"
    _runtime: IotaRuntime | None = field(default=None, repr=False, compare=False)

    def release(self) -> None:
        if self.native_ref is None or self._runtime is None:
            return
        self._runtime.release_native_reference(self.native_ref)
        self.native_ref = None

    def __repr__(self) -> str:
        return f"{type(self).__name__}(native_ref={self.native_ref!r}, native_type={self.native_type!r})"


@dataclass(slots=True)
class IotaReference:
    """Typed wrapper around an opaque native reference used by generated bindings."""

    handle: IotaHandle
    native_type: str
    _runtime: IotaRuntime | None = field(default=None, repr=False, compare=False)

    def release(self) -> None:
        if self._runtime is None:
            return
        self._runtime.release_native_reference(self.handle.value)

    def __repr__(self) -> str:
        return f"{type(self).__name__}(handle={self.handle!r}, native_type={self.native_type!r})"
