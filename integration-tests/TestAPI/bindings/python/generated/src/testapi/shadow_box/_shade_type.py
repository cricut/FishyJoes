from __future__ import annotations
from .. import _testapi_exported as testapi
from .._shadow_box_type import _BaseShadowBox
from warnings import deprecated
import dataclasses
import fishyjoes_runtime
import types
import typing

@typing.final
@dataclasses.dataclass(frozen=True)
class Shade(_BaseShadowBox):
    _0: testapi.Shade
