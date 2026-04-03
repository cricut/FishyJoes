from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class TestOptionalsProtocol(typing.Protocol):
    """
    <!-- FishyJoes.export(TestOptionalsProtocol) -->
    Generated FishyJoes Python protocol surface.
    """
    @property
    def flarp(self) -> str | None:
        """
        <!-- FishyJoes.export(flarp) -->
        """
        ...
    

    def wombat(self, zxc: int | None) -> int | None:
        """
        <!-- FishyJoes.export(wombat) -->
        """
        ...
    

    def spqr(self, pippo: AssociatedDataEnum) -> int:
        """
        <!-- FishyJoes.export(spqr) -->
        """
        ...
    
