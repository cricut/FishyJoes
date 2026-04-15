from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class TestDefaultComputedPropertiesEnum(enum.Enum):
    """
    <!-- FishyJoes.export(TestDefaultComputedPropertiesEnum) -->
    Generated FishyJoes Python enum.
    """
    qux = "qux"

    @property
    def noot(self) -> int:
        """
        <!-- FishyJoes.export(noot) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_noot", "int", ("object", self))
    

    @property
    def plutonic(self) -> str:
        """
        <!-- FishyJoes.export(plutonic) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota__default_TestAPI_TestDefaultComputedPropertiesEnum_plutonic", "object", ("object", self))
    

    @property
    def spam(self) -> bool:
        """
        <!-- FishyJoes.export(spam) -->
        """
        _ensure_runtime_loaded()
        return bool(_get_runtime().call_symbol("__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_spam", "bool", ("object", self)))
    
