from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented
if typing.TYPE_CHECKING: from .AProtocol import AProtocol

@dataclass(slots=True)
class AProtocolImplementation:
    """
    <!-- FishyJoes.export(AProtocolImplementation) -->
    Generated FishyJoes Python value type.
    """
    foo: builtins.str
    baz: builtins.bool

    def bar(self, x: builtins.int, y: builtins.int) -> AProtocol:
        """
        <!-- FishyJoes.export(bar) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_AProtocolImplementation_bar", "object", ("object", self), ("int", x), ("int", y))
    

    def hasADefaultImplementation(self, x: builtins.int, y: builtins.float) -> builtins.str:
        """
        <!-- FishyJoes.export(hasADefaultImplementation) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_AProtocolImplementation_hasADefaultImplementation", "object", ("object", self), ("int", x), ("double", y))
    

    def hasADefaultImplementation2(self, a: builtins.str, b: builtins.bool, c: builtins.str) -> builtins.str:
        """
        <!-- FishyJoes.export(hasADefaultImplementation2) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_AProtocolImplementation_hasADefaultImplementation2", "object", ("object", self), ("object", a), ("bool", b), ("object", c))
    
