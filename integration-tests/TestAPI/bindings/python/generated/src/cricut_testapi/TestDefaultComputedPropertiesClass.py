from __future__ import annotations
from dataclasses import dataclass
import builtins
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
    def noot(self) -> builtins.int:
        """
        <!-- FishyJoes.export(noot) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot", "int", ("object", self))
    

    @noot.setter
    def noot(self, value: builtins.int) -> None:
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot", "void", ("object", self), ("int", value))
    

    @property
    def plutonic(self) -> builtins.str:
        """
        <!-- FishyJoes.export(plutonic) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota__default_TestAPI_TestDefaultComputedProperties_plutonic", "object", ("object", self))
    

    @property
    def spam(self) -> builtins.bool:
        """
        <!-- FishyJoes.export(spam) -->
        """
        _ensure_runtime_loaded()
        return bool(_get_runtime().call_symbol("__iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam", "bool", ("object", self)))
    

    @spam.setter
    def spam(self, value: builtins.bool) -> None:
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam", "void", ("object", self), ("bool", value))
    

    @staticmethod
    def init(spam: builtins.bool, noot: builtins.int) -> TestDefaultComputedPropertiesClass:
        """
        <!-- FishyJoes.export(init) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestDefaultComputedPropertiesClass_init", "object", ("bool", spam), ("int", noot))
    

_cls_TestAPI_TestDefaultComputedPropertiesClass_setup = TestDefaultComputedPropertiesClass
