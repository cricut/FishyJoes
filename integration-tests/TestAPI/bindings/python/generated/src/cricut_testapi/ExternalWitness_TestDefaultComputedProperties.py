from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class ExternalWitness_TestDefaultComputedProperties(NativeReference):
    """
    <!-- FishyJoes.export(TestDefaultComputedProperties) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
        if native_ref is not None:
            import weakref
            weakref.finalize(self, _get_runtime().release_native_ref, native_ref)
        
    

    @property
    def noot(self) -> int:
        """
        <!-- FishyJoes.export(noot) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestDefaultComputedProperties_noot", "int", ("object", self))
    

    @property
    def plutonic(self) -> str:
        """
        <!-- FishyJoes.export(plutonic) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestDefaultComputedProperties_plutonic", "object", ("object", self))
    
