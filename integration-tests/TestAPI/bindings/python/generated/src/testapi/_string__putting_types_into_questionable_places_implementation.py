from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('Swift_String_PuttingTypesIntoQuestionablePlaces_constructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    x: fishyjoes_runtime.ConsumedRef
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(testapi.String_PuttingTypesIntoQuestionablePlaces(
        x = fishyjoes_runtime.consume_ref(x, str),
    ))

@fishyjoes_runtime.callback('Swift_String_PuttingTypesIntoQuestionablePlaces_xGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_x(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.String_PuttingTypesIntoQuestionablePlaces).x)

# MARK: setup

# TODO: setup for testapi.String_PuttingTypesIntoQuestionablePlaces
