@dataclasses.dataclass
class EmptyStruct:
    """<!-- FishyJoes.export(EmptyStruct) -->"""

    """<!-- FishyJoes.export(tatiana) -->"""
    str get tatiana =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota_get_TestAPI_EmptyStruct_tatiana(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(tutu) -->"""
    int get tutu =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<int>(f__iota_get_TestAPI_EmptyStruct_tutu(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    @staticmethod
    def create(
    ) -> testapi.EmptyStruct:
        """<!-- FishyJoes.export(create) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_EmptyStruct_create)(
                Loader.shared.env,
            ),
            testapi.EmptyStruct
        )

    def aap(
    ) -> str:
        """<!-- FishyJoes.export(aap) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_EmptyStruct_aap)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                str
            )

    def zxccxz(
    ) -> str:
        """<!-- FishyJoes.export(zxccxz) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_EmptyStruct_zxccxz)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                str
            )
