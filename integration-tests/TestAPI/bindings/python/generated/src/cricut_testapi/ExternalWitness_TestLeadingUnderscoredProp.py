from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class ExternalWitness_TestLeadingUnderscoredProp(NativeReference):
    """
    <!-- FishyJoes.export(TestLeadingUnderscoredProp) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
        if native_ref is not None:
            import weakref
            weakref.finalize(self, _get_runtime().release_native_ref, native_ref)
        
    

    @property
    def _leadingUnderscoreProp(self) -> str:
        """
        <!-- FishyJoes.export(_leadingUnderscoreProp) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestLeadingUnderscoredProp__leadingUnderscoreProp", "object", ("object", self))
    
