from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class TestDifferingExportNameProtocol(typing.Protocol):
    """
    <!-- FishyJoes.export(TestDifferingExportNameProtocolDiffy) -->
    Generated FishyJoes Python protocol surface.
    """
    @property
    def tata(self) -> builtins.int:
        """
        <!-- FishyJoes.export(tata) -->
        """
        ...
    
