# MARK: C APIs

__iota_TestAPI_SimpleEnum_hexMethod: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_SimpleEnum_pickAColor: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_SimpleEnum_resetFavoriteColor: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_SimpleEnum_favoriteColor: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_SimpleEnum_hex: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_set_TestAPI_SimpleEnum_favoriteColor: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def _enum_discriminator(objRef: UnownedHostRef) -> int:
    match peekRef(obj, SimpleEnum):
        case Simple_Enum.Red: return 0
        case Simple_Enum.Green: return 1
        case Simple_Enum.Blue: return 2
        case unknown: raise ValueError(f'Unknown SimpleEnum case "{unknown})". Enums are not meant to be extended.')

static CreatedRef newRed(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(SimpleEnum_Red(
    ))
)

static void extractRed(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<SimpleEnum_Red>(obj)
    })
}

static CreatedRef newGreen(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(SimpleEnum_Green(
    ))
)

static void extractGreen(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<SimpleEnum_Green>(obj)
    })
}

static CreatedRef newBlue(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(SimpleEnum_Blue(
    ))
)

static void extractBlue(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<SimpleEnum_Blue>(obj)
    })
}

# MARK: setup

# TODO: setup for testapi.SimpleEnum
