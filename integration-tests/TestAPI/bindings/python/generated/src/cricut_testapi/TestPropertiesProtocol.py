from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class TestPropertiesProtocol(typing.Protocol):
    """
    <!-- FishyJoes.export(TestPropertiesProtocol) -->
    Generated FishyJoes Python protocol surface.
    """
    @property
    def corge(self) -> str:
        """
        <!-- FishyJoes.export(corge) -->
        """
        ...
    

    @property
    def frobby(self) -> list[int]:
        """
        <!-- FishyJoes.export(frobby) -->
        """
        ...
    
