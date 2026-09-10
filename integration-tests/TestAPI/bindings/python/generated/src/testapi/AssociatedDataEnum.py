@final
class _BaseAssociatedDataEnum:
    """<!-- FishyJoes.export(AssociatedDataEnum) -->"""

    """<!-- FishyJoes.export(intValue) -->"""
    int get intValue =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<int>(f__iota_get_TestAPI_AssociatedDataEnum_intValue(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(staticThing) -->"""
    static testapi.AssociatedDataEnum get staticThing =>
        check((exn) =>
            consumeCreatedRef<testapi.AssociatedDataEnum>(f__iota_get_TestAPI_AssociatedDataEnum_staticThing(Loader.shared.env, exn))
        )

    def plus(
        other: testapi.AssociatedDataEnum,
    ) -> testapi.AssociatedDataEnum:
        """<!-- FishyJoes.export(plus) -->"""
        with fishyjoes_runtime.local_handles(self, other) as (_selfHandle, _otherHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_AssociatedDataEnum_plus)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _otherHandle.ptr,
                ),
                testapi.enumName.thing, testapi.enumName.other, testapi.enumName.bar, testapi.enumName.noValue, testapi.enumName.none, testapi.enumName.simpleEnum
            )

"""Documentation about thing"""
const factory AssociatedDataEnum.thing(
    int value
) = AssociatedDataEnum_Thing

const factory AssociatedDataEnum.other(
    str unnamed,
    int 1_
) = AssociatedDataEnum_Other

"""Documentation about bar"""
const factory AssociatedDataEnum.bar(
    str named,
    testapi.AssociatedDataEnum 1_,
    bool toggled
) = AssociatedDataEnum_Bar

"""Documentation about noValue"""
const factory AssociatedDataEnum.noValue(
) = AssociatedDataEnum_NoValue

const factory AssociatedDataEnum.none(
) = AssociatedDataEnum_None

const factory AssociatedDataEnum.simpleEnum(
    testapi.SimpleEnum value
) = AssociatedDataEnum_SimpleEnum
