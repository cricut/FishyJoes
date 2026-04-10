from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class EmptyStruct:
    """
    <!-- FishyJoes.export(EmptyStruct) -->
    Generated FishyJoes Python value type.
    """
    @property
    def tatiana(self) -> str:
        """
        <!-- FishyJoes.export(tatiana) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_EmptyStruct_tatiana", "object", ("object", self))
    

    @property
    def tutu(self) -> int:
        """
        <!-- FishyJoes.export(tutu) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_EmptyStruct_tutu", "int", ("object", self))
    

    @staticmethod
    def create() -> EmptyStruct:
        """
        <!-- FishyJoes.export(create) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_EmptyStruct_create", "object")
    

    def aap(self) -> str:
        """
        <!-- FishyJoes.export(aap) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_EmptyStruct_aap", "object", ("object", self))
    

    def zxccxz(self) -> str:
        """
        <!-- FishyJoes.export(zxccxz) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_EmptyStruct_zxccxz", "object", ("object", self))
    
