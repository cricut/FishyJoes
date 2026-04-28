from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class EmptyClass2(NativeReference):
    """
    <!-- FishyJoes.exportReference(EmptyClass2) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
        if native_ref is not None:
            import weakref
            weakref.finalize(self, _get_runtime().release_native_ref, native_ref)
        
    

    def __eq__(self, other: object) -> bool:
        _ensure_runtime_loaded()
        return bool(_get_runtime().call_symbol("__iota_TestAPI_EmptyClass2_equals", "bool", ("object", self), ("object", other)))
    

    def __hash__(self) -> int:
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_EmptyClass2_hash", "int32", ("object", self))
    

    @property
    def blorg(self) -> builtins.str:
        """
        <!-- FishyJoes.export(blorg) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_EmptyClass2_blorg", "object", ("object", self))
    

    @property
    def wibble(self) -> builtins.str:
        """
        <!-- FishyJoes.export(wibble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_EmptyClass2_wibble", "object", ("object", self))
    

    @staticmethod
    def make() -> EmptyClass2:
        """
        <!-- FishyJoes.export(make) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_EmptyClass2_make", "object")
    

    def shmee(self) -> builtins.str:
        """
        <!-- FishyJoes.export(shmee) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_EmptyClass2_shmee", "object", ("object", self))
    

    def gorp(self) -> builtins.str:
        """
        <!-- FishyJoes.export(gorp) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_EmptyClass2_gorp", "object", ("object", self))
    

_cls_TestAPI_EmptyClass2_setup = EmptyClass2
