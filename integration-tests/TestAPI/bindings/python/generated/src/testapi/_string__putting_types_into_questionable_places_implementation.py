from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from ._string__putting_types_into_questionable_places_type import String_PuttingTypesIntoQuestionablePlaces
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    x: fishyjoes_runtime.ConsumedRef
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(String_PuttingTypesIntoQuestionablePlaces(
        x = fishyjoes_runtime.consume_ref(x, str),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_x(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, String_PuttingTypesIntoQuestionablePlaces).x)

# MARK: setup

# TODO: setup for testapi.String_PuttingTypesIntoQuestionablePlaces
