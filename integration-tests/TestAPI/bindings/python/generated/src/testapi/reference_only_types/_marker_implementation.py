from __future__ import annotations
from .. import _testapi_exported as testapi
from .._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_ReferenceOnlyTypes_Marker_equals: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], bool] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_ReferenceOnlyTypes_Marker_equals'))

iota_get_TestAPI_ReferenceOnlyTypes_Marker_hash: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], int] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_ReferenceOnlyTypes_Marker_hash'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('FishyJoes_ReferenceConstructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_new(ref: fishyjoes_runtime.ConsumedSwiftRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(testapi.reference_only_types.Marker(ref))

# MARK: setup

# TODO: setup for testapi.reference_only_types.Marker
