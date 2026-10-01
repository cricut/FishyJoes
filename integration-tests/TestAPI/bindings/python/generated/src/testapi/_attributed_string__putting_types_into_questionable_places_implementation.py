from . import _testapi_exported as testapi
from ._attributed_string__putting_types_into_questionable_places_type import AttributedString_PuttingTypesIntoQuestionablePlaces
from ._c_api import _testapi_lib
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_testCall: typing.Callable[[
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
    return fishyjoes_runtime.create_ref(AttributedString_PuttingTypesIntoQuestionablePlaces(
        x = fishyjoes_runtime.consume_ref(x, str),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_x(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, AttributedString_PuttingTypesIntoQuestionablePlaces).x)

# MARK: setup

# TODO: setup for testapi.AttributedString_PuttingTypesIntoQuestionablePlaces
