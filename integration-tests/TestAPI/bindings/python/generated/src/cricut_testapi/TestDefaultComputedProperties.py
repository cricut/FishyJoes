from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class TestDefaultComputedProperties(typing.Protocol):
    """
    <!-- FishyJoes.export(TestDefaultComputedProperties) -->
    Generated FishyJoes Python protocol surface.
    """
    @property
    def noot(self) -> int:
        """
        <!-- FishyJoes.export(noot) -->
        """
        ...
    

    @property
    def plutonic(self) -> str:
        """
        <!-- FishyJoes.export(plutonic) -->
        """
        ...
    
