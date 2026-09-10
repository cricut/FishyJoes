# MARK: C APIs

__iota_TestAPI_ReferenceOnlyTypes_marker: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def _enum_discriminator(objRef: UnownedHostRef) -> int:
    match peekRef(obj, ReferenceOnlyTypes):
        case unknown: raise ValueError(f'Unknown ReferenceOnlyTypes case "{unknown})". Enums are not meant to be extended.')

# MARK: setup

# TODO: setup for testapi.ReferenceOnlyTypes
