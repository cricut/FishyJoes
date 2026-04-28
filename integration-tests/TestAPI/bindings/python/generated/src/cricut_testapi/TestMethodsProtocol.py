from __future__ import annotations
from dataclasses import dataclass
import builtins
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
    

    def bar(self) -> builtins.bool:
        """
        <!-- FishyJoes.export(bar) -->
        """
        ...
    

    def baz(self, qux: builtins.bool) -> None:
        """
        <!-- FishyJoes.export(baz) -->
        """
        ...
    

    def garply(self, _0: builtins.str) -> builtins.str:
        """
        <!-- FishyJoes.export(garply) -->
        """
        ...
    

    def xyzzy(self, thud: builtins.int, grault: builtins.list[builtins.float]) -> builtins.str:
        """
        <!-- FishyJoes.export(xyzzy) -->
        """
        ...
    

    def plugh(self, fred: builtins.tuple[builtins.bool, builtins.float, builtins.list[builtins.str]]) -> builtins.tuple[builtins.bool, builtins.int, builtins.str]:
        """
        <!-- FishyJoes.export(plugh) -->
        """
        ...
    
