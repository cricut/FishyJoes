# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def _enum_discriminator(objRef: UnownedHostRef) -> int:
    match peekRef(obj, Structs):
        case unknown: raise ValueError(f'Unknown Structs case "{unknown})". Enums are not meant to be extended.')

# MARK: setup

# TODO: setup for testapi.Structs
