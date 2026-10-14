from __future__ import annotations
from . import _error_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class Error:
    """<!-- FishyJoes.export(Results.Error) -->"""

    message: typing.Final[str]

    def __init__(
        self,
        message: str,
    ) -> None:
        self.message = message

    def __repr__(self) -> str:
        return f'testapi.results.Error(message={self.message!r})'
