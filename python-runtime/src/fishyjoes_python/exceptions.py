from __future__ import annotations


class FishyJoesError(Exception):
    """Base error for generated FishyJoes Python bindings."""


class NativeCallError(FishyJoesError):
    """Raised when the native Iota layer reports a failure."""


class NativeReferenceError(FishyJoesError):
    """Raised when an operation is attempted on an invalid or released native reference."""


class TypeMismatchError(FishyJoesError):
    """Raised when a Python value cannot be coerced to the expected native type."""

    def __init__(self, expected: str, got: object) -> None:
        type_name = type(got).__name__
        super().__init__(f"expected {expected}, got {type_name}")
        self.expected = expected
        self.got = got


class SetupError(FishyJoesError):
    """Raised when native type setup (register callbacks, etc.) fails."""


class NotImplementedInNativeError(FishyJoesError):
    """Raised when a binding surface exists but native invocation is not yet wired."""

    def __init__(self, symbol: str) -> None:
        super().__init__(
            f"Python binding surface for {symbol!r} is generated, "
            f"but native-backed invocation is not wired yet."
        )
        self.symbol = symbol


class ModuleError(FishyJoesError):
    """Base class for module-specific typed exceptions raised by Swift code.

    Generated modules should subclass this for their domain errors so that
    callers can catch either the specific error or any ``ModuleError``.

    Example::

        class MyModuleError(ModuleError):
            pass
    """

    def __init__(self, message: str) -> None:
        super().__init__(message)
        self.message = message
