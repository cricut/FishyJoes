@final
class _BaseTestDefaultComputedPropertiesEnum(testapi.TestDefaultComputedProperties):
    """<!-- FishyJoes.export(TestDefaultComputedPropertiesEnum) -->"""

    """<!-- FishyJoes.export(noot) -->"""
    int get noot =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<int>(f__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_noot(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(plutonic) -->"""
    str get plutonic =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota__default_TestAPI_TestDefaultComputedPropertiesEnum_plutonic(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(spam) -->"""
    bool get spam =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<bool>(f__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_spam(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

const factory TestDefaultComputedPropertiesEnum.qux(
) = TestDefaultComputedPropertiesEnum_Qux
