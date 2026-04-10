from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class TestMethodsProtocol(typing.Protocol):
    """
    <!-- FishyJoes.export(TestMethodsProtocol) -->
    Generated FishyJoes Python protocol surface.
    """
    def foo(self) -> None:
        """
        <!-- FishyJoes.export(foo) -->
        """
        ...
    

    def bar(self) -> bool:
        """
        <!-- FishyJoes.export(bar) -->
        """
        ...
    

    def baz(self, qux: bool) -> None:
        """
        <!-- FishyJoes.export(baz) -->
        """
        ...
    

    def garply(self, _0: str) -> str:
        """
        <!-- FishyJoes.export(garply) -->
        """
        ...
    

    def xyzzy(self, thud: int, grault: list[float]) -> str:
        """
        <!-- FishyJoes.export(xyzzy) -->
        """
        ...
    

    def plugh(self, fred: tuple[bool, float, list[str]]) -> tuple[bool, int, str]:
        """
        <!-- FishyJoes.export(plugh) -->
        """
        ...
    
