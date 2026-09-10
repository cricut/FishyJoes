@dataclasses.dataclass
class MutableStruct:
    """<!-- FishyJoes.export(Structs.MutableStruct) -->"""
    i: int

    @staticmethod
    def create(
    ) -> testapi.Structs.MutableStruct:
        """<!-- FishyJoes.export(create) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Structs_MutableStruct_create)(
                Loader.shared.env,
            ),
            testapi.Structs.MutableStruct
        )

    def increment(
    ) -> None:
        """<!-- FishyJoes.export(increment) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Structs_MutableStruct_increment)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                types.NoneType
            )

    def incrementAsync(
    ) -> fishyjoes_runtime.Future[None]:
        """<!-- FishyJoes.export(incrementAsync) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Structs_MutableStruct_incrementAsync)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def asyncGetI(
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(asyncGetI) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Structs_MutableStruct_asyncGetI)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )
