from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from ._test_default_computed_properties_struct_type import TestDefaultComputedPropertiesStruct
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota__default_TestAPI_TestDefaultComputedPropertiesStruct_plutonic: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    spam: fishyjoes_runtime.ConsumedRef,
    noot: fishyjoes_runtime.ConsumedRef
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(TestDefaultComputedPropertiesStruct(
        spam = fishyjoes_runtime.consume_ref(spam, bool),
        noot = fishyjoes_runtime.consume_ref(noot, int),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_spam(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestDefaultComputedPropertiesStruct).spam)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_spam(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, TestDefaultComputedPropertiesStruct).spam = fishyjoes_runtime.consume_ref(newValue, bool)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_noot(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestDefaultComputedPropertiesStruct).noot)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_noot(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, TestDefaultComputedPropertiesStruct).noot = fishyjoes_runtime.consume_ref(newValue, int)

# MARK: setup

# TODO: setup for testapi.TestDefaultComputedPropertiesStruct
