from .. import _testapi_exported as testapi
from .._associated_data_enum_type import _BaseAssociatedDataEnum
import dataclasses
import fishyjoes_runtime
import types
import typing

@typing.final
@dataclasses.dataclass(frozen=True)
class Other(_BaseAssociatedDataEnum):
    unnamed: str
    _1: int
