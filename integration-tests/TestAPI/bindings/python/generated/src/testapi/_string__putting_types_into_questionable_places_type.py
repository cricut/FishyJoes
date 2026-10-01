from . import _string__putting_types_into_questionable_places_implementation as _impl
from . import _testapi_exported as testapi
import dataclasses
import fishyjoes_runtime
import types
import typing

@dataclasses.dataclass
class String_PuttingTypesIntoQuestionablePlaces:
    """<!-- FishyJoes.export(String_PuttingTypesIntoQuestionablePlaces) -->"""
    x: typing.Final[str]

    def testCall(
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
