@dataclasses.dataclass
class String_PuttingTypesIntoQuestionablePlaces:
    """<!-- FishyJoes.export(String_PuttingTypesIntoQuestionablePlaces) -->"""
    x: Final[str]

    def testCall(
    ) -> int:
        """<!-- FishyJoes.export(testCall) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                int
            )
