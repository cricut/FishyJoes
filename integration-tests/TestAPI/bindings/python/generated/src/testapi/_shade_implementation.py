from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback('TestAPI_Shade_constructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    darkness: float
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(testapi.Shade(
        darkness = darkness,
    ))

@fishyjoes_runtime.callback('TestAPI_Shade_darknessGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=0.0)
def ffi_get_darkness(obj: fishyjoes_runtime.UnownedRef) -> float:
    return fishyjoes_runtime.peek_ref(obj, testapi.Shade).darkness

@fishyjoes_runtime.callback('TestAPI_Shade_darknessSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def ffi_set_darkness(obj: fishyjoes_runtime.UnownedRef, newValue: float) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.Shade).darkness = newValue

# MARK: setup

# TODO: setup for testapi.Shade
