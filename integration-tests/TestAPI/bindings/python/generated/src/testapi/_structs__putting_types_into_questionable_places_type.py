from . import _structs__putting_types_into_questionable_places_implementation as _impl
from . import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class Structs_PuttingTypesIntoQuestionablePlaces(fishyjoes_runtime.SwiftReference):
    """<!-- FishyJoes.exportReference(Structs_PuttingTypesIntoQuestionablePlaces) -->"""

    @staticmethod
    def create(
    ) -> testapi.Structs_PuttingTypesIntoQuestionablePlaces:
        """<!-- FishyJoes.export(create) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            testapi.Structs_PuttingTypesIntoQuestionablePlaces
        )

    def testCall(
        self,
    ) -> int:
        """<!-- FishyJoes.export(testCall) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                int
            )
