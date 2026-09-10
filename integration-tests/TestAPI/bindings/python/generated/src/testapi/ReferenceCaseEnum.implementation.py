# MARK: C APIs

__iota_TestAPI_ReferenceCaseEnum_rotate180: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_ReferenceCaseEnum_defaultDirection: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_ReferenceCaseEnum_opposite: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def _enum_discriminator(objRef: UnownedHostRef) -> int:
    match peekRef(obj, ReferenceCaseEnum):
        case Reference_Case_Enum.North: return 0
        case Reference_Case_Enum.South: return 1
        case Reference_Case_Enum.East: return 2
        case Reference_Case_Enum.West: return 3
        case unknown: raise ValueError(f'Unknown ReferenceCaseEnum case "{unknown})". Enums are not meant to be extended.')

static CreatedRef newNorth(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(ReferenceCaseEnum_North(
    ))
)

static void extractNorth(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<ReferenceCaseEnum_North>(obj)
    })
}

static CreatedRef newSouth(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(ReferenceCaseEnum_South(
    ))
)

static void extractSouth(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<ReferenceCaseEnum_South>(obj)
    })
}

static CreatedRef newEast(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(ReferenceCaseEnum_East(
    ))
)

static void extractEast(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<ReferenceCaseEnum_East>(obj)
    })
}

static CreatedRef newWest(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(ReferenceCaseEnum_West(
    ))
)

static void extractWest(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<ReferenceCaseEnum_West>(obj)
    })
}

# MARK: setup

# TODO: setup for testapi.ReferenceCaseEnum
