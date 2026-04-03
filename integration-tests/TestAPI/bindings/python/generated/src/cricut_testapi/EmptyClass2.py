from __future__ import annotations
from dataclasses import dataclass
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
        
    

    @property
    def blorg(self) -> str:
        """
        <!-- FishyJoes.export(blorg) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_EmptyClass2_blorg", "object", ("object", self))
    

    @property
    def wibble(self) -> str:
        """
        <!-- FishyJoes.export(wibble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_EmptyClass2_wibble", "object", ("object", self))
    

    @staticmethod
    def make() -> EmptyClass2:
        """
        <!-- FishyJoes.export(make) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_EmptyClass2_make", "object")
    

    def shmee(self) -> str:
        """
        <!-- FishyJoes.export(shmee) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_EmptyClass2_shmee", "object", ("object", self))
    

    def gorp(self) -> str:
        """
        <!-- FishyJoes.export(gorp) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_EmptyClass2_gorp", "object", ("object", self))
    
