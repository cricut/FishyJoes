# MARK: C APIs

__iota_TestAPI_AssociatedDataEnum_plus: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_AssociatedDataEnum_intValue: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_AssociatedDataEnum_staticThing: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def _enum_discriminator(objRef: UnownedHostRef) -> int:
    match peekRef(obj, AssociatedDataEnum):
        case Associated_Data_Enum.Thing: return 0
        case Associated_Data_Enum.Other: return 1
        case Associated_Data_Enum.Bar: return 2
        case Associated_Data_Enum.NoValue: return 3
        case Associated_Data_Enum.None_: return 4
        case Associated_Data_Enum.SimpleEnum: return 5
        case unknown: raise ValueError(f'Unknown AssociatedDataEnum case "{unknown})". Enums are not meant to be extended.')

static CreatedRef newThing(
    TODO[ffiConsumedName] _value,
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(AssociatedDataEnum_Thing(
        consumeRef<int>(_value),
    ))
)

static void extractThing(
    UnownedRef obj,
    TODO[ffiOutCreatedName] _value,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<AssociatedDataEnum_Thing>(obj)
        _value.value = createRef(_self.value)
    })
}

static CreatedRef newOther(
    TODO[ffiConsumedName] _unnamed,
    TODO[ffiConsumedName] __1,
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(AssociatedDataEnum_Other(
        consumeRef<str>(_unnamed),
        consumeRef<int>(__1),
    ))
)

static void extractOther(
    UnownedRef obj,
    TODO[ffiOutCreatedName] _unnamed,
    TODO[ffiOutCreatedName] __1,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<AssociatedDataEnum_Other>(obj)
        _unnamed.value = createRef(_self.unnamed)
        __1.value = createRef(_self.1_)
    })
}

static CreatedRef newBar(
    TODO[ffiConsumedName] _named,
    TODO[ffiConsumedName] __1,
    TODO[ffiConsumedName] _toggled,
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(AssociatedDataEnum_Bar(
        consumeRef<str>(_named),
        consumeRef<testapi.AssociatedDataEnum>(__1),
        consumeRef<bool>(_toggled),
    ))
)

static void extractBar(
    UnownedRef obj,
    TODO[ffiOutCreatedName] _named,
    TODO[ffiOutCreatedName] __1,
    TODO[ffiOutCreatedName] _toggled,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<AssociatedDataEnum_Bar>(obj)
        _named.value = createRef(_self.named)
        __1.value = createRef(_self.1_)
        _toggled.value = createRef(_self.toggled)
    })
}

static CreatedRef newNoValue(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(AssociatedDataEnum_NoValue(
    ))
)

static void extractNoValue(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<AssociatedDataEnum_NoValue>(obj)
    })
}

static CreatedRef newNone(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(AssociatedDataEnum_None(
    ))
)

static void extractNone(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<AssociatedDataEnum_None>(obj)
    })
}

static CreatedRef newSimpleEnum(
    TODO[ffiConsumedName] _value,
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(AssociatedDataEnum_SimpleEnum(
        consumeRef<testapi.SimpleEnum>(_value),
    ))
)

static void extractSimpleEnum(
    UnownedRef obj,
    TODO[ffiOutCreatedName] _value,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<AssociatedDataEnum_SimpleEnum>(obj)
        _value.value = createRef(_self.value)
    })
}

# MARK: setup

# TODO: setup for testapi.AssociatedDataEnum
