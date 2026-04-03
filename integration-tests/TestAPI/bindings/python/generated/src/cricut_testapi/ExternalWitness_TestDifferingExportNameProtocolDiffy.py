from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class ExternalWitness_TestDifferingExportNameProtocolDiffy(NativeReference):
    """
    <!-- FishyJoes.export(TestDifferingExportNameProtocolDiffy) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
    

    @property
    def tata(self) -> int:
        """
        <!-- FishyJoes.export(tata) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestDifferingExportNameProtocol_tata", "object", ("object", self))
    
