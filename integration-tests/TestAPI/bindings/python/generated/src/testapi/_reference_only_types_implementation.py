from . import _testapi_exported as testapi
from . import reference_only_types
from ._c_api import _testapi_lib
from ._reference_only_types_type import ReferenceOnlyTypes
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_ReferenceOnlyTypes_marker: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, ReferenceOnlyTypes):
        case unknown: raise ValueError(f'Unknown ReferenceOnlyTypes case "{unknown})". Enums are not meant to be extended.')

# MARK: setup

# TODO: setup for testapi.ReferenceOnlyTypes
