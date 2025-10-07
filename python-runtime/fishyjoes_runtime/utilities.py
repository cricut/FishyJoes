"""Utility functions and types for FishyJoes Python runtime."""

from __future__ import annotations

import ctypes
from typing import Any, TypeVar

T = TypeVar("T")


class NullPointerError(Exception):
    """Raised when a null pointer is encountered unexpectedly."""

    pass


class SwiftError(Exception):
    """Base class for errors originating from Swift code."""

    def __init__(self, message: str) -> None:
        super().__init__(message)
        self.swift_description = message


def check_error(exn_ptr: ctypes.c_void_p | None) -> None:
    """
    Check if an exception pointer is set and raise if so.

    Args:
        exn_ptr: Pointer to exception object from Swift, or None

    Raises:
        SwiftError: If exn_ptr is not None
    """
    if exn_ptr is not None and exn_ptr:
        # Import here to avoid circular dependency
        from fishyjoes_runtime.loader import Loader

        # Get description from Swift
        description = Loader.describe_python_object(exn_ptr)
        Loader.delete_ref(exn_ptr)
        raise SwiftError(description)


def unwrap[T](
    value: T | None, message: str = "Unexpected null value"
) -> T:  # noqa: UP047
    """
    Unwrap an optional value, raising an error if None.

    Args:
        value: The value to unwrap
        message: Error message if value is None

    Returns:
        The unwrapped value

    Raises:
        NullPointerError: If value is None
    """
    if value is None:
        raise NullPointerError(message)
    return value


class CatchingContext:
    """
    Context manager for catching Swift exceptions and converting to Python.

    Example:
        with CatchingContext() as ctx:
            result = some_swift_function(ctx.exn_ptr)
            ctx.check()  # Raises if exception occurred
    """

    def __init__(self) -> None:
        self._exn: ctypes.c_void_p = ctypes.c_void_p()

    @property
    def exn_ptr(self) -> Any:  # ctypes.POINTER[c_void_p] not properly typed
        """Get pointer to exception storage for passing to Swift."""
        return ctypes.byref(self._exn)

    def check(self) -> None:
        """Check if an exception occurred and raise it."""
        check_error(ctypes.c_void_p(self._exn.value) if self._exn else None)

    def __enter__(self) -> CatchingContext:
        return self

    def __exit__(self, exc_type: Any, exc_val: Any, exc_tb: Any) -> None:
        # Don't suppress Python exceptions
        pass


def make_c_function_type(
    return_type: type[ctypes._CData] | None, *arg_types: type[ctypes._CData] | None
) -> Any:  # type[ctypes._CFuncPtr] not fully typed in ctypes
    """
    Create a ctypes function pointer type.

    Args:
        return_type: C type of return value (None for void)
        *arg_types: C types of arguments

    Returns:
        ctypes function pointer type
    """
    return ctypes.CFUNCTYPE(return_type, *arg_types)  # type: ignore[arg-type]


# Common C function signatures used in Swift FFI
NewRefFn = make_c_function_type(ctypes.c_void_p, ctypes.c_void_p)
DeleteRefFn = make_c_function_type(None, ctypes.c_void_p)
NewErrorFn = make_c_function_type(ctypes.c_void_p, ctypes.c_char_p)
DescribeFn = make_c_function_type(ctypes.c_void_p, ctypes.c_void_p)
ScheduleThreadWorkFn = make_c_function_type(None, ctypes.c_void_p, ctypes.c_void_p)


def ensure_bytes(s: str | bytes) -> bytes:
    """
    Ensure a string is bytes, encoding if necessary.

    Args:
        s: String or bytes

    Returns:
        UTF-8 encoded bytes
    """
    if isinstance(s, bytes):
        return s
    return s.encode("utf-8")


def ensure_str(b: bytes | str) -> str:
    """
    Ensure bytes are a string, decoding if necessary.

    Args:
        b: Bytes or string

    Returns:
        Decoded string
    """
    if isinstance(b, str):
        return b
    return b.decode("utf-8")
