from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class TestNonExportedProtocolEnum(enum.Enum):
    """
    <!-- FishyJoes.export(TestNonExportedProtocolEnum) -->
    Generated FishyJoes Python enum.
    """
    hogehoge = "hogehoge"

    @property
    def fuga(self) -> float:
        """
        <!-- FishyJoes.export(fuga) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestNonExportedProtocolEnum_fuga", "double", ("object", self))
    

    def hoge(self) -> float:
        """
        <!-- FishyJoes.export(hoge) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestNonExportedProtocolEnum_hoge", "double", ("object", self))
    
