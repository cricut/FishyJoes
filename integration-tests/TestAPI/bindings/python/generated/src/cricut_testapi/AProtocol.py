from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class AProtocol(typing.Protocol):
    """
    <!-- FishyJoes.export(AProtocol) -->
    Generated FishyJoes Python protocol surface.
    """
    @property
    def baz(self) -> builtins.bool:
        """
        <!-- FishyJoes.export(baz) -->
        """
        ...
    

    @property
    def foo(self) -> builtins.str:
        """
        <!-- FishyJoes.export(foo) -->
        """
        ...
    

    def bar(self, x: builtins.int, y: builtins.int) -> AProtocol:
        """
        <!-- FishyJoes.export(bar) -->
        """
        ...
    

    def hasADefaultImplementation(self, x: builtins.int, y: builtins.float) -> builtins.str:
        """
        <!-- FishyJoes.export(hasADefaultImplementation) -->
        """
        ...
    

    def hasADefaultImplementation2(self, a: builtins.str, b: builtins.bool, c: builtins.str) -> builtins.str:
        """
        <!-- FishyJoes.export(hasADefaultImplementation2) -->
        """
        ...
    
