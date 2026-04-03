from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class EmptyStruct2:
    """
    <!-- FishyJoes.export(EmptyStruct2) -->
    Generated FishyJoes Python value type.
    """
    @property
    def tatiana(self) -> str:
        """
        <!-- FishyJoes.export(tatiana) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_EmptyStruct2_tatiana", "object", ("object", self))
    

    @property
    def tutu(self) -> int:
        """
        <!-- FishyJoes.export(tutu) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_EmptyStruct2_tutu", "object", ("object", self))
    

    @staticmethod
    def create() -> EmptyStruct2:
        """
        <!-- FishyJoes.export(create) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_EmptyStruct2_create", "object")
    

    def aap(self) -> str:
        """
        <!-- FishyJoes.export(aap) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_EmptyStruct2_aap", "object", ("object", self))
    

    def zxccxz(self) -> str:
        """
        <!-- FishyJoes.export(zxccxz) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_EmptyStruct2_zxccxz", "object", ("object", self))
    
