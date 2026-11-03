from __future__ import annotations
from . import _primitive_holder_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class PrimitiveHolder:
    """<!-- FishyJoes.export(Primitives.PrimitiveHolder) -->"""

    b: bool
    bq: bool | None
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
    f: float
    fq: float | None
    d: float
    dq: float | None
    __slots__: list[str] = [
        'b',
        'bq',
        'ui8',
        'ui8q',
        'ui16',
        'ui16q',
        'ui32',
        'ui32q',
        'ui64',
        'ui64q',
        'ui',
        'uiq',
        'i8',
        'i8q',
        'i16',
        'i16q',
        'i32',
        'i32q',
        'i64',
        'i64q',
        'i',
        'iq',
        'f',
        'fq',
        'd',
        'dq',
    ]

    def __init__(
        self,
        b: bool,
        bq: bool | None,
        ui8: int,
        ui8q: int | None,
        ui16: int,
        ui16q: int | None,
        ui32: int,
        ui32q: int | None,
        ui64: int,
        ui64q: int | None,
        ui: int,
        uiq: int | None,
        i8: int,
        i8q: int | None,
        i16: int,
        i16q: int | None,
        i32: int,
        i32q: int | None,
        i64: int,
        i64q: int | None,
        i: int,
        iq: int | None,
        f: float,
        fq: float | None,
        d: float,
        dq: float | None,
    ) -> None:
        self.b = b
        self.bq = bq
        self.ui8 = ui8
        self.ui8q = ui8q
        self.ui16 = ui16
        self.ui16q = ui16q
        self.ui32 = ui32
        self.ui32q = ui32q
        self.ui64 = ui64
        self.ui64q = ui64q
        self.ui = ui
        self.uiq = uiq
        self.i8 = i8
        self.i8q = i8q
        self.i16 = i16
        self.i16q = i16q
        self.i32 = i32
        self.i32q = i32q
        self.i64 = i64
        self.i64q = i64q
        self.i = i
        self.iq = iq
        self.f = f
        self.fq = fq
        self.d = d
        self.dq = dq

    def __repr__(self) -> str:
        return f'testapi.primitives.PrimitiveHolder(...)'

    @staticmethod
    def get_static_mutable_property() -> list[int | None]:
        """<!-- FishyJoes.export(staticMutableProperty) -->"""
        return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty(fishyjoes_runtime.Runtime.shared.env_ref), list)

    @staticmethod
    def set_static_mutable_property(new_value: list[int | None]) -> None:
        with fishyjoes_runtime.local_handles(new_value) as (new_value_handle,):
            _impl.iota_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty(fishyjoes_runtime.Runtime.shared.env_ref, new_value_handle)

    @staticmethod
    def get_static_property() -> list[int | None]:
        """<!-- FishyJoes.export(staticProperty) -->"""
        return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_PrimitiveHolder_staticProperty(fishyjoes_runtime.Runtime.shared.env_ref), list)

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        return isinstance(other, PrimitiveHolder) and \
            self.b == other.b and \
            self.bq == other.bq and \
            self.ui8 == other.ui8 and \
            self.ui8q == other.ui8q and \
            self.ui16 == other.ui16 and \
            self.ui16q == other.ui16q and \
            self.ui32 == other.ui32 and \
            self.ui32q == other.ui32q and \
            self.ui64 == other.ui64 and \
            self.ui64q == other.ui64q and \
            self.ui == other.ui and \
            self.uiq == other.uiq and \
            self.i8 == other.i8 and \
            self.i8q == other.i8q and \
            self.i16 == other.i16 and \
            self.i16q == other.i16q and \
            self.i32 == other.i32 and \
            self.i32q == other.i32q and \
            self.i64 == other.i64 and \
            self.i64q == other.i64q and \
            self.i == other.i and \
            self.iq == other.iq and \
            self.f == other.f and \
            self.fq == other.fq and \
            self.d == other.d and \
            self.dq == other.dq and \
            True
