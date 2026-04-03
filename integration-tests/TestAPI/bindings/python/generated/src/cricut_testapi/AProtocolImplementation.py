from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class AProtocolImplementation:
    """
    <!-- FishyJoes.export(AProtocolImplementation) -->
    Generated FishyJoes Python value type.
    """
    foo: str
    baz: int

    def bar(self, x: int, y: int) -> AProtocol:
        """
        <!-- FishyJoes.export(bar) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_AProtocolImplementation_bar", "object", ("object", self), ("object", x), ("object", y))
    

    def hasADefaultImplementation(self, x: int, y: int) -> str:
        """
        <!-- FishyJoes.export(hasADefaultImplementation) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_AProtocolImplementation_hasADefaultImplementation", "object", ("object", self), ("object", x), ("object", y))
    

    def hasADefaultImplementation2(self, a: str, b: int, c: str) -> str:
        """
        <!-- FishyJoes.export(hasADefaultImplementation2) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_AProtocolImplementation_hasADefaultImplementation2", "object", ("object", self), ("object", a), ("object", b), ("object", c))
    
