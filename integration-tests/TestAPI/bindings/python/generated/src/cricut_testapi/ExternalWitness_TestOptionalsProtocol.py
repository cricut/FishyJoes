from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented
if typing.TYPE_CHECKING: from .AssociatedDataEnum import AssociatedDataEnum

class ExternalWitness_TestOptionalsProtocol(NativeReference):
    """
    <!-- FishyJoes.export(TestOptionalsProtocol) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
        if native_ref is not None:
            import weakref
            weakref.finalize(self, _get_runtime().release_native_ref, native_ref)
        
    

    @property
    def flarp(self) -> builtins.str | None:
        """
        <!-- FishyJoes.export(flarp) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestOptionalsProtocol_flarp", "object", ("object", self))
    

    def wombat(self, zxc: builtins.int | None) -> builtins.float | None:
        """
        <!-- FishyJoes.export(wombat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestOptionalsProtocol_wombat", "object", ("object", self), ("object", zxc))
    

    def spqr(self, pippo: AssociatedDataEnum) -> builtins.int:
        """
        <!-- FishyJoes.export(spqr) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestOptionalsProtocol_spqr", "int", ("object", self), ("object", pippo))
    
