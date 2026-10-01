from . import _testapi_exported as testapi
from . import structs
from ._c_api import _testapi_lib
from ._structs_type import Structs
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, Structs):
        case unknown: raise ValueError(f'Unknown Structs case "{unknown})". Enums are not meant to be extended.')

# MARK: setup

# TODO: setup for testapi.Structs
