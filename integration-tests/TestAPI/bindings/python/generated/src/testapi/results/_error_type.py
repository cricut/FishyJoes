from . import _error_implementation as _impl
from .. import _testapi_exported as testapi
import dataclasses
import fishyjoes_runtime
import types
import typing

@dataclasses.dataclass
class Error:
    """<!-- FishyJoes.export(Results.Error) -->"""
    message: typing.Final[str]
