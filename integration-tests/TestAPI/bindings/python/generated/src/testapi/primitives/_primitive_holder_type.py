from . import _primitive_holder_implementation as _impl
from .. import _testapi_exported as testapi
import dataclasses
import fishyjoes_runtime
import types
import typing

@dataclasses.dataclass
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

    # TODO: static field staticMutableProperty
    # TODO: static field staticProperty
