# MARK: C APIs

__iota_TestAPI_ProtocolFixtures_describeAProtocol: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_ProtocolFixtures_returnAProtocol: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def _enum_discriminator(objRef: UnownedHostRef) -> int:
    match peekRef(obj, ProtocolFixtures):
        case unknown: raise ValueError(f'Unknown ProtocolFixtures case "{unknown})". Enums are not meant to be extended.')

# MARK: setup

# TODO: setup for testapi.ProtocolFixtures
