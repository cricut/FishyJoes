"""Swift reference type wrapper for Python."""

from __future__ import annotations

import ctypes


class SwiftReference:
    """
    Wrapper for Swift reference types managed from Python side.

    This class holds a pointer to a Swift object and manages its lifetime
    through reference counting coordinated with the Swift runtime.
    """

    def __init__(self, ptr: ctypes.c_void_p, *, _take: bool = False) -> None:
        """
        Initialize a SwiftReference.

        Args:
            ptr: Pointer to Swift object
            _take: If True, takes ownership without incrementing refcount.
                   If False (default), borrows and increments refcount.
        """
        from fishyjoes_runtime.loader import Loader

        if not ptr:
            raise ValueError("Cannot create SwiftReference with null pointer")

        self._ptr = ptr
        if not _take:
            # Borrow: increment reference count
            self._ptr = Loader.new_ref(ptr)

    @property
    def ptr(self) -> ctypes.c_void_p:
        """Get the underlying pointer."""
        return self._ptr

    def __del__(self) -> None:
        """Clean up the Swift reference when Python object is garbage collected."""
        if hasattr(self, "_ptr") and self._ptr:
            from fishyjoes_runtime.loader import Loader

            try:
                Loader.delete_ref(self._ptr)
            except Exception:
                # Ignore errors during cleanup
                pass

    def __eq__(self, other: object) -> bool:
        """Compare Swift references by pointer equality."""
        if not isinstance(other, SwiftReference):
            return NotImplemented
        return self._ptr == other._ptr

    def __hash__(self) -> int:
        """Hash based on pointer value."""
        return hash(self._ptr.value if self._ptr else 0)

    def __repr__(self) -> str:
        """String representation showing pointer address."""
        from fishyjoes_runtime.loader import Loader

        try:
            description = Loader.describe_python_object(self._ptr)
            return f"SwiftReference({description})"
        except Exception:
            return f"SwiftReference(0x{self._ptr.value:x})"

    @classmethod
    def take(cls, ptr: ctypes.c_void_p) -> SwiftReference:
        """
        Create a SwiftReference taking ownership of the pointer.

        Use when Swift transfers ownership to Python (e.g., return value).

        Args:
            ptr: Pointer to take ownership of

        Returns:
            SwiftReference wrapping the pointer
        """
        return cls(ptr, _take=True)

    @classmethod
    def borrow(cls, ptr: ctypes.c_void_p) -> SwiftReference:
        """
        Create a SwiftReference borrowing the pointer.

        Increments the reference count. Use when Swift retains ownership.

        Args:
            ptr: Pointer to borrow

        Returns:
            SwiftReference wrapping the pointer
        """
        return cls(ptr, _take=False)
