@final
class _BaseSimpleEnum:
    """This is an enum with no associated values"""
    """<!-- FishyJoes.export(SimpleEnum) -->"""

    """<!-- FishyJoes.export(favoriteColor) -->"""
    static testapi.SimpleEnum get favoriteColor =>
        check((exn) =>
            consumeCreatedRef<testapi.SimpleEnum>(f__iota_get_TestAPI_SimpleEnum_favoriteColor(Loader.shared.env, exn))
        )

    static void set favoriteColor(testapi.SimpleEnum value) {
        GCRef.using(value, (_valueHandle) =>
            check((exn) =>
                f__iota_set_TestAPI_SimpleEnum_favoriteColor(Loader.shared.env, _valueHandle.ptr, exn)
            )
        )
    }
    """<!-- FishyJoes.export(hex) -->"""
    int get hex =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<int>(f__iota_get_TestAPI_SimpleEnum_hex(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    @staticmethod
    def pickAColor(
        rawValue: int,
    ) -> testapi.SimpleEnum | None:
        """<!-- FishyJoes.export(pickAColor) -->"""
        with fishyjoes_runtime.local_handles(rawValue) as (_rawValueHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_SimpleEnum_pickAColor)(
                    Loader.shared.env,
                    _rawValueHandle.ptr,
                ),
                testapi.enumName.red, testapi.enumName.green, testapi.enumName.blue, types.NoneType
            )

    def hexMethod(
    ) -> str:
        """<!-- FishyJoes.export(hexMethod) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_SimpleEnum_hexMethod)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                str
            )

    @staticmethod
    def resetFavoriteColor(
    ) -> None:
        """<!-- FishyJoes.export(resetFavoriteColor) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_SimpleEnum_resetFavoriteColor)(
                Loader.shared.env,
            ),
            types.NoneType
        )

"""red is a nice color"""
const factory SimpleEnum.red(
) = SimpleEnum_Red

const factory SimpleEnum.green(
) = SimpleEnum_Green

"""blue is less good"""
"""opinions may vary"""
const factory SimpleEnum.blue(
) = SimpleEnum_Blue
