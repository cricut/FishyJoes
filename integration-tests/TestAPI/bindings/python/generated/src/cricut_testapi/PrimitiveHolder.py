from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class PrimitiveHolder:
    """
    <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
    Generated FishyJoes Python value type.
    """
    b: builtins.bool
    bq: builtins.bool | None
    ui8: builtins.int
    ui8q: builtins.int | None
    ui16: builtins.int
    ui16q: builtins.int | None
    ui32: builtins.int
    ui32q: builtins.int | None
    ui64: builtins.int
    ui64q: builtins.int | None
    ui: builtins.int
    uiq: builtins.int | None
    i8: builtins.int
    i8q: builtins.int | None
    i16: builtins.int
    i16q: builtins.int | None
    i32: builtins.int
    i32q: builtins.int | None
    i64: builtins.int
    i64q: builtins.int | None
    i: builtins.int
    iq: builtins.int | None
    f: builtins.float
    fq: builtins.float | None
    d: builtins.float
    dq: builtins.float | None

    @staticmethod
    def staticMutableProperty() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(staticMutableProperty) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty", "object")
    

    @staticmethod
    def set_staticMutableProperty(value: builtins.list[builtins.int | None]) -> None:
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty", "void", ("object", value))
    

    @staticmethod
    def staticProperty() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(staticProperty) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_PrimitiveHolder_staticProperty", "object")
    
