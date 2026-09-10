# MARK: C APIs

__iota_TestAPI_ReferenceEmptyEnum_aStaticMethod: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_ReferenceEmptyEnum_notGoingToHappen: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_ReferenceEmptyEnum_aStaticProperty: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def _enum_discriminator(objRef: UnownedHostRef) -> int:
    match peekRef(obj, ReferenceEmptyEnum):
        case unknown: raise ValueError(f'Unknown ReferenceEmptyEnum case "{unknown})". Enums are not meant to be extended.')

# MARK: setup

# TODO: setup for testapi.ReferenceEmptyEnum
