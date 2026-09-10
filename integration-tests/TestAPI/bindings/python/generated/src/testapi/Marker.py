class Marker(SwiftReference):
    """<!-- FishyJoes.exportReference(ReferenceOnlyTypes.Marker) -->"""

    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_ReferenceOnlyTypes_Marker_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )

    def operator ==(
        other: object,
    ) -> bool:
        identical(other, this) ||
        (other is testapi.ReferenceOnlyTypes.Marker &&
            GCRef.using(this, (thisHandle) =>
                GCRef.using(other, (otherHandle) =>
                    check((exn) => f__iota_TestAPI_ReferenceOnlyTypes_Marker_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn)))))
