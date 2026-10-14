from __future__ import annotations
from .. import _testapi_exported as testapi
from .._test_non_exported_protocol_enum_type import _BaseTestNonExportedProtocolEnum
from warnings import deprecated
import dataclasses
import fishyjoes_runtime
import types
import typing

@typing.final
@dataclasses.dataclass(frozen=True)
class Hogehoge(_BaseTestNonExportedProtocolEnum):
    pass
