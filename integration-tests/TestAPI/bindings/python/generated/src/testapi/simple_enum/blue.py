from __future__ import annotations
from .. import _testapi_exported as testapi
from .._simple_enum_type import _BaseSimpleEnum
from warnings import deprecated
import dataclasses
import fishyjoes_runtime
import types
import typing

@typing.final
@dataclasses.dataclass(frozen=True)
class Blue(_BaseSimpleEnum):
    pass
