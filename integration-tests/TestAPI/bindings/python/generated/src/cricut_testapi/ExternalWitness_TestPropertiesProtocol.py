from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class ExternalWitness_TestPropertiesProtocol(NativeReference):
    """
    <!-- FishyJoes.export(TestPropertiesProtocol) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
    

    @property
    def corge(self) -> str:
        """
        <!-- FishyJoes.export(corge) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestPropertiesProtocol_corge", "object", ("object", self))
    

    @property
    def frobby(self) -> list[int]:
        """
        <!-- FishyJoes.export(frobby) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestPropertiesProtocol_frobby", "object", ("object", self))
    
