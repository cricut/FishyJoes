from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class TestDifferingExportNameStruct:
    """
    <!-- FishyJoes.export(TestDifferingExportNameStruct) -->
    Generated FishyJoes Python value type.
    """
    tata: int
