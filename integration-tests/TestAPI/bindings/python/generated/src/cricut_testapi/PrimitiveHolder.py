from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class PrimitiveHolder:
    """
    <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
    Generated FishyJoes Python value type.
    """
    b: int
    bq: int | None
    ui8: int
    ui8q: int | None
    ui16: int
    ui16q: int | None
    ui32: int
    ui32q: int | None
    ui64: int
    ui64q: int | None
    ui: int
    uiq: int | None
    i8: int
    i8q: int | None
    i16: int
    i16q: int | None
    i32: int
    i32q: int | None
    i64: int
    i64q: int | None
    i: int
    iq: int | None
    f: int
    fq: int | None
    d: int
    dq: int | None

    @staticmethod
    def staticMutableProperty() -> list[int | None]:
        """
        <!-- FishyJoes.export(staticMutableProperty) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty", "object")
    

    @staticmethod
    def set_staticMutableProperty(value: list[int | None]) -> None:
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty", "void", ("object", value))
    

    @staticmethod
    def staticProperty() -> list[int | None]:
        """
        <!-- FishyJoes.export(staticProperty) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_PrimitiveHolder_staticProperty", "object")
    
