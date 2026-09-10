class EmptyClass1(SwiftReference):
    """A reference type with playful members for binding coverage."""
    """<!-- FishyJoes.exportReference(EmptyClass1) -->"""

    """A cheerful nonsense string."""
    """<!-- FishyJoes.export(blarg) -->"""
    str get blarg =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota_get_TestAPI_EmptyClass_blarg(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(wibbledyWobbledyTimeyWhimey) -->"""
    str get wibbledyWobbledyTimeyWhimey =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota_get_TestAPI_EmptyClass_wibbledyWobbledyTimeyWhimey(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_EmptyClass_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )

    @staticmethod
    def create(
    ) -> testapi.EmptyClass1:
        """<!-- FishyJoes.export(create) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_EmptyClass_create)(
                Loader.shared.env,
            ),
            testapi.EmptyClass1
        )

    def shme(
    ) -> str:
        """Returns a short pirate greeting."""
        """<!-- FishyJoes.export(shme) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_EmptyClass_shme)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                str
            )

    def Gorpers(
    ) -> str:
        """<!-- FishyJoes.export(Gorpers) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_EmptyClass_Gorpers)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                str
            )

    def operator ==(
        other: object,
    ) -> bool:
        identical(other, this) ||
        (other is testapi.EmptyClass1 &&
            GCRef.using(this, (thisHandle) =>
                GCRef.using(other, (otherHandle) =>
                    check((exn) => f__iota_TestAPI_EmptyClass_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn)))))
