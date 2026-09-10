class ReferenceStruct(SwiftReference):
    """<!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->"""

    """<!-- FishyJoes.export(immutable) -->"""
    str get immutable =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota_get_TestAPI_Structs_ReferenceStruct_immutable(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(mutable) -->"""
    str get mutable =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota_get_TestAPI_Structs_ReferenceStruct_mutable(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    void set mutable(str value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__iota_set_TestAPI_Structs_ReferenceStruct_mutable(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
    }
    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_Structs_ReferenceStruct_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )

    @staticmethod
    def create(
    ) -> testapi.Structs.ReferenceStruct:
        """<!-- FishyJoes.export(create) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Structs_ReferenceStruct_create)(
                Loader.shared.env,
            ),
            testapi.Structs.ReferenceStruct
        )

    def asyncGetMutable(
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(asyncGetMutable) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Structs_ReferenceStruct_asyncGetMutable)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def operator ==(
        other: object,
    ) -> bool:
        identical(other, this) ||
        (other is testapi.Structs.ReferenceStruct &&
            GCRef.using(this, (thisHandle) =>
                GCRef.using(other, (otherHandle) =>
                    check((exn) => f__iota_TestAPI_Structs_ReferenceStruct_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn)))))
