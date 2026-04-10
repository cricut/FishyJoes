from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class ExternalWitness_AProtocol(NativeReference):
    """
    <!-- FishyJoes.export(AProtocol) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
        if native_ref is not None:
            import weakref
            weakref.finalize(self, _get_runtime().release_native_ref, native_ref)
        
    

    @property
    def baz(self) -> bool:
        """
        <!-- FishyJoes.export(baz) -->
        """
        _ensure_runtime_loaded()
        return bool(_get_runtime().call_symbol("__iota_get_TestAPI_AProtocol_baz", "bool", ("object", self)))
    

    @property
    def foo(self) -> str:
        """
        <!-- FishyJoes.export(foo) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_AProtocol_foo", "object", ("object", self))
    

    def bar(self, x: int, y: int) -> AProtocol:
        """
        <!-- FishyJoes.export(bar) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_AProtocol_bar", "object", ("object", self), ("int", x), ("int", y))
    
