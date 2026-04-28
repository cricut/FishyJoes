from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented
if typing.TYPE_CHECKING: from .AssociatedDataEnum import AssociatedDataEnum

class TestOptionalsProtocol(typing.Protocol):
    """
    <!-- FishyJoes.export(TestOptionalsProtocol) -->
    Generated FishyJoes Python protocol surface.
    """
    @property
    def flarp(self) -> builtins.str | None:
        """
        <!-- FishyJoes.export(flarp) -->
        """
        ...
    

    def wombat(self, zxc: builtins.int | None) -> builtins.float | None:
        """
        <!-- FishyJoes.export(wombat) -->
        """
        ...
    

    def spqr(self, pippo: AssociatedDataEnum) -> builtins.int:
        """
        <!-- FishyJoes.export(spqr) -->
        """
        ...
    
