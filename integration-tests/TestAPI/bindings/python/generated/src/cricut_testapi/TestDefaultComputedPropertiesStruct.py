from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class TestDefaultComputedPropertiesStruct:
    """
    <!-- FishyJoes.export(TestDefaultComputedPropertiesStruct) -->
    Generated FishyJoes Python value type.
    """
    spam: builtins.bool
    noot: builtins.int

    @property
    def plutonic(self) -> builtins.str:
        """
        <!-- FishyJoes.export(plutonic) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota__default_TestAPI_TestDefaultComputedProperties_plutonic", "object", ("object", self))
    
