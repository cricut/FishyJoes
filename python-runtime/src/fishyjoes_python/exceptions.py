from __future__ import annotations


class FishyJoesError(Exception):
    """Base error for generated FishyJoes Python bindings."""


class NativeCallError(FishyJoesError):
    """Raised when the native Iota layer reports a failure."""

