from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class DefaultArguments:
    """
    <!-- FishyJoes.export(DefaultArguments) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def echoDefaults(*, y: int | None = None, x: int | None, z: float = 3.14) -> str:
        """
        <!-- FishyJoes.export(echoDefaults, compatibilityOrder: [z, y]) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_DefaultArguments_echoDefaults", "object", ("object", y), ("object", x), ("double", z))
    
