from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class TestDefaultComputedPropertiesClass(NativeReference):
    """
    <!-- FishyJoes.exportReference(TestDefaultComputedPropertiesReference) -->
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
        return _get_runtime().invoke("__iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot", "object", ("object", self))
    

    @noot.setter
    def noot(self, value: int) -> None:
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot", "void", ("object", self), ("object", value))
    

    @property
    def plutonic(self) -> str:
        """
        <!-- FishyJoes.export(plutonic) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestDefaultComputedPropertiesClass_plutonic", "object", ("object", self))
    

    @property
    def spam(self) -> int:
        """
        <!-- FishyJoes.export(spam) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam", "object", ("object", self))
    

    @spam.setter
    def spam(self, value: int) -> None:
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam", "void", ("object", self), ("object", value))
    

    @staticmethod
    def init(spam: int, noot: int) -> TestDefaultComputedPropertiesClass:
        """
        <!-- FishyJoes.export(init) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestDefaultComputedPropertiesClass_init", "object", ("object", spam), ("object", noot))
    
