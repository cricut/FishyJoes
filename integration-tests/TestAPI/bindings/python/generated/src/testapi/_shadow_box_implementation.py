from . import _testapi_exported as testapi
from . import shadow_box
from ._c_api import _testapi_lib
from ._shadow_box_type import ShadowBox
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_ShadowBox_darkest: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_get_TestAPI_ShadowBox_allShades: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, ShadowBox):
        case shadow_box.Shade: return 0
        case shadow_box.Empty: return 1
        case unknown: raise ValueError(f'Unknown ShadowBox case "{unknown})". Enums are not meant to be extended.')

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_shade(
    _0: fishyjoes_runtime.ConsumedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(shadow_box.Shade(
        fishyjoes_runtime.consume_ref(_0, testapi.Shade), # type: ignore[arg-type]
    ))

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_Shade(
    obj: fishyjoes_runtime.UnownedRef,
    out__0: fishyjoes_runtime.OutCreatedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, shadow_box.Shade)
    out__0[0] = fishyjoes_runtime.create_ref(self._0)

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_empty(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(shadow_box.Empty(
    ))

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_Empty(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, shadow_box.Empty)

# MARK: setup

# TODO: setup for testapi.ShadowBox
