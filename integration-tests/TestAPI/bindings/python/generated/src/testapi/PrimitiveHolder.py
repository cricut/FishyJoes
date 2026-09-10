@dataclasses.dataclass
class PrimitiveHolder:
    """<!-- FishyJoes.export(Primitives.PrimitiveHolder) -->"""
    b: bool
    bq: bool | None
    ui8: int
    ui8q: int | None
    ui16: int
    ui16q: int | None
    ui32: int
    ui32q: int | None
    ui64: int
    ui64q: int | None
    ui: int
    uiq: int | None
    i8: int
    i8q: int | None
    i16: int
    i16q: int | None
    i32: int
    i32q: int | None
    i64: int
    i64q: int | None
    i: int
    iq: int | None
    f: float
    fq: float | None
    d: float
    dq: float | None

    """<!-- FishyJoes.export(staticMutableProperty) -->"""
    static list[int | None] get staticMutableProperty =>
        check((exn) =>
            consumeCreatedRef<list[int | None]>(f__iota_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty(Loader.shared.env, exn))
        )

    static void set staticMutableProperty(list[int | None] value) {
        GCRef.using(value, (_valueHandle) =>
            check((exn) =>
                f__iota_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty(Loader.shared.env, _valueHandle.ptr, exn)
            )
        )
    }
    """<!-- FishyJoes.export(staticProperty) -->"""
    static list[int | None] get staticProperty =>
        check((exn) =>
            consumeCreatedRef<list[int | None]>(f__iota_get_TestAPI_Primitives_PrimitiveHolder_staticProperty(Loader.shared.env, exn))
        )
