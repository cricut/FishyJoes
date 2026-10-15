from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create'))

iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('FishyJoes_ReferenceConstructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_new(ref: fishyjoes_runtime.ConsumedSwiftRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(testapi.Structs_PuttingTypesIntoQuestionablePlaces(ref))

# MARK: setup

# TODO: setup for testapi.Structs_PuttingTypesIntoQuestionablePlaces
