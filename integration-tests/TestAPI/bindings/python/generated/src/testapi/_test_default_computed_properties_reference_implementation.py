from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from ._test_default_computed_properties_reference_type import TestDefaultComputedPropertiesReference
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot'))

iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot'))

iota__default_TestAPI_TestDefaultComputedPropertiesClass_plutonic: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota__default_TestAPI_TestDefaultComputedPropertiesClass_plutonic'))

iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam'))

iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam'))

iota_TestAPI_TestDefaultComputedPropertiesClass_init: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestDefaultComputedPropertiesClass_init'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_new]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_new(ref: fishyjoes_runtime.ConsumedSwiftRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(TestDefaultComputedPropertiesReference(ref))

# MARK: setup

# TODO: setup for testapi.TestDefaultComputedPropertiesReference
