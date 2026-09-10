@dataclasses.dataclass
class CollectionHolder:
    """<!-- FishyJoes.export(Collections.CollectionHolder) -->"""
    boolArray: list[bool]
    boolSet: set[bool]
    boolDictionary: dict[bool,bool]
    integerArray: list[int]
    integerSet: set[int]
    integerDictionary: dict[int,int]
    stringArray: list[str]
    stringSet: set[str]
    stringDictionary: dict[str,str]

    """<!-- FishyJoes.export(staticMutableProperty) -->"""
    static list[int | None] get staticMutableProperty =>
        check((exn) =>
            consumeCreatedRef<list[int | None]>(f__iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty(Loader.shared.env, exn))
        )

    static void set staticMutableProperty(list[int | None] value) {
        GCRef.using(value, (_valueHandle) =>
            check((exn) =>
                f__iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty(Loader.shared.env, _valueHandle.ptr, exn)
            )
        )
    }
    """<!-- FishyJoes.export(staticProperty) -->"""
    static list[int | None] get staticProperty =>
        check((exn) =>
            consumeCreatedRef<list[int | None]>(f__iota_get_TestAPI_Collections_CollectionHolder_staticProperty(Loader.shared.env, exn))
        )
