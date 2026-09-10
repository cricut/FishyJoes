# MARK: C APIs

__iota__default_TestAPI_TestDefaultComputedPropertiesEnum_plutonic: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_noot: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_spam: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def _enum_discriminator(objRef: UnownedHostRef) -> int:
    match peekRef(obj, TestDefaultComputedPropertiesEnum):
        case Test_Default_Computed_Properties_Enum.Qux: return 0
        case unknown: raise ValueError(f'Unknown TestDefaultComputedPropertiesEnum case "{unknown})". Enums are not meant to be extended.')

static CreatedRef newQux(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(TestDefaultComputedPropertiesEnum_Qux(
    ))
)

static void extractQux(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<TestDefaultComputedPropertiesEnum_Qux>(obj)
    })
}

# MARK: setup

# TODO: setup for testapi.TestDefaultComputedPropertiesEnum
