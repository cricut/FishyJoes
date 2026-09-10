class EmptyClass2(SwiftReference):
    """<!-- FishyJoes.exportReference(EmptyClass2) -->"""

    """<!-- FishyJoes.export(blorg) -->"""
    str get blorg =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota_get_TestAPI_EmptyClass2_blorg(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(wibble) -->"""
    str get wibble =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota_get_TestAPI_EmptyClass2_wibble(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_EmptyClass2_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )

    @staticmethod
    def make(
    ) -> testapi.EmptyClass2:
        """<!-- FishyJoes.export(make) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_EmptyClass2_make)(
                Loader.shared.env,
            ),
            testapi.EmptyClass2
        )

    def shmee(
    ) -> str:
        """<!-- FishyJoes.export(shmee) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_EmptyClass2_shmee)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                str
            )

    def gorp(
    ) -> str:
        """<!-- FishyJoes.export(gorp) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_EmptyClass2_gorp)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                str
            )

    def operator ==(
        other: object,
    ) -> bool:
        identical(other, this) ||
        (other is testapi.EmptyClass2 &&
            GCRef.using(this, (thisHandle) =>
                GCRef.using(other, (otherHandle) =>
                    check((exn) => f__iota_TestAPI_EmptyClass2_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn)))))
