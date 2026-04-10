from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class CollectionHolder:
    """
    <!-- FishyJoes.export(Collections.CollectionHolder) -->
    Generated FishyJoes Python value type.
    """
    boolArray: list[bool]
    boolSet: set[bool]
    boolDictionary: dict[bool, bool]
    integerArray: list[int]
    integerSet: set[int]
    integerDictionary: dict[int, int]
    stringArray: list[str]
    stringSet: set[str]
    stringDictionary: dict[str, str]

    @staticmethod
    def staticMutableProperty() -> list[int | None]:
        """
        <!-- FishyJoes.export(staticMutableProperty) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty", "object")
    

    @staticmethod
    def set_staticMutableProperty(value: list[int | None]) -> None:
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty", "void", ("object", value))
    

    @staticmethod
    def staticProperty() -> list[int | None]:
        """
        <!-- FishyJoes.export(staticProperty) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_CollectionHolder_staticProperty", "object")
    
