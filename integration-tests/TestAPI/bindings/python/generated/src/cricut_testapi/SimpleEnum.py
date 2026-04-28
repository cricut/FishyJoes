from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class SimpleEnum(enum.Enum):
    """
    This is an enum with no associated values
    <!-- FishyJoes.export(SimpleEnum) -->
    Generated FishyJoes Python enum.
    """
    red = "red"
    green = "green"
    blue = "blue"

    @staticmethod
    def favoriteColor() -> SimpleEnum:
        """
        <!-- FishyJoes.export(favoriteColor) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_SimpleEnum_favoriteColor", "object")
    

    @property
    def hex(self) -> builtins.int:
        """
        <!-- FishyJoes.export(hex) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_SimpleEnum_hex", "int", ("object", self))
    

    @staticmethod
    def pickAColor(rawValue: builtins.int) -> SimpleEnum | None:
        """
        <!-- FishyJoes.export(pickAColor) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_SimpleEnum_pickAColor", "object", ("int", rawValue))
    

    def hexMethod(self) -> builtins.str:
        """
        <!-- FishyJoes.export(hexMethod) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_SimpleEnum_hexMethod", "object", ("object", self))
    

    @staticmethod
    def resetFavoriteColor() -> None:
        """
        <!-- FishyJoes.export(resetFavoriteColor) -->
        """
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_TestAPI_SimpleEnum_resetFavoriteColor", "void")
    
