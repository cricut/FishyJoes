from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class TestDefaultComputedPropertiesStruct:
    """
    <!-- FishyJoes.export(TestDefaultComputedPropertiesStruct) -->
    Generated FishyJoes Python value type.
    """
    spam: bool
    noot: int

    @property
    def plutonic(self) -> str:
        """
        <!-- FishyJoes.export(plutonic) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestDefaultComputedPropertiesStruct_plutonic", "object", ("object", self))
    
