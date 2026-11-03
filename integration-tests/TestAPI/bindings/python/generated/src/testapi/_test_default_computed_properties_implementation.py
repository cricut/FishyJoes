from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota__default_TestAPI_TestDefaultComputedProperties_noot: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], int] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota__default_TestAPI_TestDefaultComputedProperties_noot'))

iota__default_TestAPI_TestDefaultComputedProperties_plutonic: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota__default_TestAPI_TestDefaultComputedProperties_plutonic'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TestAPI_TestDefaultComputedProperties_noot_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=0)
def ffi_get_noot(obj: fishyjoes_runtime.UnownedRef) -> int:
    return fishyjoes_runtime.peek_ref(obj, testapi.TestDefaultComputedProperties).noot

@fishyjoes_runtime.callback('TestAPI_TestDefaultComputedProperties_plutonic_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_get_plutonic(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.TestDefaultComputedProperties).plutonic)

# MARK: setup
