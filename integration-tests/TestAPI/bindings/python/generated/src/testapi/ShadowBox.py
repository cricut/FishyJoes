@final
class _BaseShadowBox:
    """<!-- FishyJoes.export(ShadowBox) -->"""

    """<!-- FishyJoes.export(allShades) -->"""
    list[testapi.Shade] get allShades =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<list[testapi.Shade]>(f__iota_get_TestAPI_ShadowBox_allShades(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    @staticmethod
    def darkest(
        shades: list[testapi.Shade],
    ) -> testapi.Shade | None:
        """<!-- FishyJoes.export(darkest) -->"""
        with fishyjoes_runtime.local_handles(shades) as (_shadesHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_ShadowBox_darkest)(
                    Loader.shared.env,
                    _shadesHandle.ptr,
                ),
                testapi.Shade, types.NoneType
            )

const factory ShadowBox.shade(
    testapi.Shade 0_
) = ShadowBox_Shade

const factory ShadowBox.empty(
) = ShadowBox_Empty
