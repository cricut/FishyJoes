from .. import _testapi_exported as testapi
from .._simple_enum_type import _BaseSimpleEnum
import dataclasses
import fishyjoes_runtime
import types
import typing

@typing.final
@dataclasses.dataclass(frozen=True)
class Green(_BaseSimpleEnum):
    pass
