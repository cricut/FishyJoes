from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class AProtocol(typing.Protocol):
    """
    <!-- FishyJoes.export(AProtocol) -->
    Generated FishyJoes Python protocol surface.
    """
    @property
    def baz(self) -> bool:
        """
        <!-- FishyJoes.export(baz) -->
        """
        ...
    

    @property
    def foo(self) -> str:
        """
        <!-- FishyJoes.export(foo) -->
        """
        ...
    

    def bar(self, x: int, y: int) -> AProtocol:
        """
        <!-- FishyJoes.export(bar) -->
        """
        ...
    

    def hasADefaultImplementation(self, x: int, y: float) -> str:
        """
        <!-- FishyJoes.export(hasADefaultImplementation) -->
        """
        ...
    

    def hasADefaultImplementation2(self, a: str, b: bool, c: str) -> str:
        """
        <!-- FishyJoes.export(hasADefaultImplementation2) -->
        """
        ...
    
