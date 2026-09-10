@dataclasses.dataclass
class EmptyStruct2:
    """<!-- FishyJoes.export(EmptyStruct2) -->"""

    """<!-- FishyJoes.export(tatiana) -->"""
    str get tatiana =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota_get_TestAPI_EmptyStruct2_tatiana(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(tutu) -->"""
    int get tutu =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<int>(f__iota_get_TestAPI_EmptyStruct2_tutu(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    @staticmethod
    def create(
    ) -> testapi.EmptyStruct2:
        """<!-- FishyJoes.export(create) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_EmptyStruct2_create)(
                Loader.shared.env,
            ),
            testapi.EmptyStruct2
        )

    def aap(
    ) -> str:
        """<!-- FishyJoes.export(aap) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_EmptyStruct2_aap)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_EmptyStruct2_zxccxz)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                str
            )
