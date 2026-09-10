# MARK: C APIs

__iota_TestAPI_ShadowBox_darkest: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_ShadowBox_allShades: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def _enum_discriminator(objRef: UnownedHostRef) -> int:
    match peekRef(obj, ShadowBox):
        case Shadow_Box.Shade: return 0
        case Shadow_Box.Empty: return 1
        case unknown: raise ValueError(f'Unknown ShadowBox case "{unknown})". Enums are not meant to be extended.')

static CreatedRef newShade(
    TODO[ffiConsumedName] __0,
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(ShadowBox_Shade(
        consumeRef<testapi.Shade>(__0),
    ))
)

static void extractShade(
    UnownedRef obj,
    TODO[ffiOutCreatedName] __0,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<ShadowBox_Shade>(obj)
        __0.value = createRef(_self.0_)
    })
}

static CreatedRef newEmpty(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(ShadowBox_Empty(
    ))
)

static void extractEmpty(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<ShadowBox_Empty>(obj)
    })
}

# MARK: setup

# TODO: setup for testapi.ShadowBox
