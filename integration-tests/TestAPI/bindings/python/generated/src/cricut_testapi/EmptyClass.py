from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class EmptyClass(NativeReference):
    """
    <!-- FishyJoes.exportReference(EmptyClass1) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
        if native_ref is not None:
            import weakref
            weakref.finalize(self, _get_runtime().release_native_ref, native_ref)
        
    

    def __eq__(self, other: object) -> bool:
        _ensure_runtime_loaded()
        return bool(_get_runtime().call_symbol("__iota_TestAPI_EmptyClass_equals", "bool", ("object", self), ("object", other)))
    

    def __hash__(self) -> int:
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_EmptyClass_hash", "int32", ("object", self))
    

    @property
    def blarg(self) -> str:
        """
        <!-- FishyJoes.export(blarg) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_EmptyClass_blarg", "object", ("object", self))
    

    @property
    def wibbledyWobbledyTimeyWhimey(self) -> str:
        """
        <!-- FishyJoes.export(wibbledyWobbledyTimeyWhimey) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_EmptyClass_wibbledyWobbledyTimeyWhimey", "object", ("object", self))
    

    @staticmethod
    def create() -> EmptyClass:
        """
        <!-- FishyJoes.export(create) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_EmptyClass_create", "object")
    

    def shme(self) -> str:
        """
        <!-- FishyJoes.export(shme) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_EmptyClass_shme", "object", ("object", self))
    

    def Gorpers(self) -> str:
        """
        <!-- FishyJoes.export(Gorpers) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_EmptyClass_Gorpers", "object", ("object", self))
    

_cls_TestAPI_EmptyClass_setup = EmptyClass
