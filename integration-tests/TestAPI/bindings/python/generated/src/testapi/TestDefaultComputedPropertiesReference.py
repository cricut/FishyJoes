class TestDefaultComputedPropertiesReference(SwiftReference, testapi.TestDefaultComputedProperties):
    """<!-- FishyJoes.exportReference(TestDefaultComputedPropertiesReference) -->"""

    """<!-- FishyJoes.export(noot) -->"""
    int get noot =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<int>(f__iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    void set noot(int value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
    }
    """<!-- FishyJoes.export(plutonic) -->"""
    str get plutonic =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota__default_TestAPI_TestDefaultComputedPropertiesClass_plutonic(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(spam) -->"""
    bool get spam =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<bool>(f__iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    void set spam(bool value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
    }
    @staticmethod
    def init(
        spam: bool,
        noot: int,
    ) -> testapi.TestDefaultComputedPropertiesReference:
        """<!-- FishyJoes.export(init) -->"""
        with fishyjoes_runtime.local_handles(spam, noot) as (_spamHandle, _nootHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestDefaultComputedPropertiesClass_init)(
                    Loader.shared.env,
                    _spamHandle.ptr,
                    _nootHandle.ptr,
                ),
                testapi.TestDefaultComputedPropertiesReference
            )
