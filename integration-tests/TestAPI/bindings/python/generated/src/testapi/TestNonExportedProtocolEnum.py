@final
class _BaseTestNonExportedProtocolEnum:
    """<!-- FishyJoes.export(TestNonExportedProtocolEnum) -->"""

    """<!-- FishyJoes.export(fuga) -->"""
    float get fuga =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<float>(f__iota_get_TestAPI_TestNonExportedProtocolEnum_fuga(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    def hoge(
    ) -> float:
        """<!-- FishyJoes.export(hoge) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestNonExportedProtocolEnum_hoge)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                float
            )

const factory TestNonExportedProtocolEnum.hogehoge(
) = TestNonExportedProtocolEnum_Hogehoge
