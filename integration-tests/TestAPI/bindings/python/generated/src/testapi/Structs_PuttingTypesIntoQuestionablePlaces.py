class Structs_PuttingTypesIntoQuestionablePlaces(SwiftReference):
    """<!-- FishyJoes.exportReference(Structs_PuttingTypesIntoQuestionablePlaces) -->"""

    @staticmethod
    def create(
    ) -> testapi.Structs_PuttingTypesIntoQuestionablePlaces:
        """<!-- FishyJoes.export(create) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create)(
                Loader.shared.env,
            ),
            testapi.Structs_PuttingTypesIntoQuestionablePlaces
        )

    def testCall(
    ) -> int:
        """<!-- FishyJoes.export(testCall) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                int
            )
