@dataclasses.dataclass
class MemberwiseStruct:
    """A plain value type with one immutable and one mutable field."""
    """<!-- FishyJoes.export(Structs.MemberwiseStruct) -->"""
    immutable: str
    mutable: str

    @staticmethod
    def create(
    ) -> testapi.Structs.MemberwiseStruct:
        """<!-- FishyJoes.export(create) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Structs_MemberwiseStruct_create)(
                Loader.shared.env,
            ),
            testapi.Structs.MemberwiseStruct
        )

    def asyncGetMutable(
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(asyncGetMutable) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Structs_MemberwiseStruct_asyncGetMutable)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )
