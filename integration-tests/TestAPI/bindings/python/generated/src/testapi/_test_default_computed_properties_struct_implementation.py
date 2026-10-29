from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from warnings import deprecated
import collections.abc
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota__default_TestAPI_TestDefaultComputedPropertiesStruct_plutonic: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota__default_TestAPI_TestDefaultComputedPropertiesStruct_plutonic'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TestAPI_TestDefaultComputedPropertiesStruct_constructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    spam: bool,
    noot: int
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(testapi.TestDefaultComputedPropertiesStruct(
        spam = spam,
        noot = noot,
    ))

@fishyjoes_runtime.callback('TestAPI_TestDefaultComputedPropertiesStruct_spamGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=False)
def ffi_get_spam(obj: fishyjoes_runtime.UnownedRef) -> bool:
    return fishyjoes_runtime.peek_ref(obj, testapi.TestDefaultComputedPropertiesStruct).spam

@fishyjoes_runtime.callback('TestAPI_TestDefaultComputedPropertiesStruct_spamSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def ffi_set_spam(obj: fishyjoes_runtime.UnownedRef, newValue: bool) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.TestDefaultComputedPropertiesStruct).spam = newValue

@fishyjoes_runtime.callback('TestAPI_TestDefaultComputedPropertiesStruct_nootGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=0)
def ffi_get_noot(obj: fishyjoes_runtime.UnownedRef) -> int:
    return fishyjoes_runtime.peek_ref(obj, testapi.TestDefaultComputedPropertiesStruct).noot

@fishyjoes_runtime.callback('TestAPI_TestDefaultComputedPropertiesStruct_nootSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def ffi_set_noot(obj: fishyjoes_runtime.UnownedRef, newValue: int) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.TestDefaultComputedPropertiesStruct).noot = newValue

# MARK: setup

# TODO: setup for testapi.TestDefaultComputedPropertiesStruct
