from . import _testapi_exported as testapi
from . import _unicode_scalar__putting_types_into_questionable_places_implementation as _impl
from . import unicode_scalar__putting_types_into_questionable_places
import fishyjoes_runtime
import types
import typing

class _BaseUnicodeScalar_PuttingTypesIntoQuestionablePlaces:
    """<!-- FishyJoes.export(UnicodeScalar_PuttingTypesIntoQuestionablePlaces) -->"""

    def testCall(
        self,
    ) -> int:
        """<!-- FishyJoes.export(testCall) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                int
            )

UnicodeScalar_PuttingTypesIntoQuestionablePlaces: typing.TypeAlias = typing.Union[
    unicode_scalar__putting_types_into_questionable_places.Thing,
]
