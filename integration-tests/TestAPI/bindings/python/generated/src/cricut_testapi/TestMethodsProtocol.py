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
    

    def bar(self) -> int:
        """
        <!-- FishyJoes.export(bar) -->
        """
        ...
    

    def baz(self, qux: int) -> None:
        """
        <!-- FishyJoes.export(baz) -->
        """
        ...
    

    def garply(self, _0: str) -> str:
        """
        <!-- FishyJoes.export(garply) -->
        """
        ...
    

    def xyzzy(self, thud: int, grault: list[int]) -> str:
        """
        <!-- FishyJoes.export(xyzzy) -->
        """
        ...
    

    def plugh(self, fred: tuple[int, int, list[str]]) -> tuple[int, int, str]:
        """
        <!-- FishyJoes.export(plugh) -->
        """
        ...
    
