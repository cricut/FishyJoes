@dataclasses.dataclass
class TestDefaultComputedPropertiesStruct(testapi.TestDefaultComputedProperties):
    """<!-- FishyJoes.export(TestDefaultComputedPropertiesStruct) -->"""
    spam: bool
    noot: int

    """<!-- FishyJoes.export(plutonic) -->"""
    str get plutonic =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota__default_TestAPI_TestDefaultComputedPropertiesStruct_plutonic(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
