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
    def fuga(self) -> int:
        """
        <!-- FishyJoes.export(fuga) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestNonExportedProtocolEnum_fuga", "object", ("object", self))
    

    def hoge(self) -> int:
        """
        <!-- FishyJoes.export(hoge) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestNonExportedProtocolEnum_hoge", "object", ("object", self))
    
