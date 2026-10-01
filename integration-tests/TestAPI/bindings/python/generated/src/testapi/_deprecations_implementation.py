from . import _testapi_exported as testapi
from . import deprecations
from ._c_api import _testapi_lib
from ._deprecations_type import Deprecations
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_Deprecations_deprecatedMethod: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_get_TestAPI_Deprecations_deprecatedVariable: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, Deprecations):
        case unknown: raise ValueError(f'Unknown Deprecations case "{unknown})". Enums are not meant to be extended.')

# MARK: setup

# TODO: setup for testapi.Deprecations
