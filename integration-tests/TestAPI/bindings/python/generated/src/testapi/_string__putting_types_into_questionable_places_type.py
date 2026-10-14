from __future__ import annotations
from . import _string__putting_types_into_questionable_places_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class String_PuttingTypesIntoQuestionablePlaces:
    """<!-- FishyJoes.export(String_PuttingTypesIntoQuestionablePlaces) -->"""

    x: typing.Final[str]

    def __init__(
        self,
        x: str,
    ) -> None:
        self.x = x

    def __repr__(self) -> str:
        return f'testapi.String_PuttingTypesIntoQuestionablePlaces(x={self.x!r})'

    def test_call(
        self,
    ) -> int:
        """<!-- FishyJoes.export(testCall) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                int
            )
