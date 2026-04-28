from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class CollectionHolder:
    """
    <!-- FishyJoes.export(Collections.CollectionHolder) -->
    Generated FishyJoes Python value type.
    """
    boolArray: builtins.list[builtins.bool]
    boolSet: builtins.set[builtins.bool]
    boolDictionary: builtins.dict[builtins.bool, builtins.bool]
    integerArray: builtins.list[builtins.int]
    integerSet: builtins.set[builtins.int]
    integerDictionary: builtins.dict[builtins.int, builtins.int]
    stringArray: builtins.list[builtins.str]
    stringSet: builtins.set[builtins.str]
    stringDictionary: builtins.dict[builtins.str, builtins.str]

    @staticmethod
    def staticMutableProperty() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(staticMutableProperty) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty", "object")
    

    @staticmethod
    def set_staticMutableProperty(value: builtins.list[builtins.int | None]) -> None:
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty", "void", ("object", value))
    

    @staticmethod
    def staticProperty() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(staticProperty) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_CollectionHolder_staticProperty", "object")
    
