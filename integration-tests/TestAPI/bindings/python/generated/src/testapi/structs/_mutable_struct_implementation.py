from .. import _testapi_exported as testapi
from ._c_api import _testapi_lib
from ._mutable_struct_type import MutableStruct
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_Structs_MutableStruct_asyncGetI: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_Structs_MutableStruct_create: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_Structs_MutableStruct_increment: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_Structs_MutableStruct_incrementAsync: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    i: fishyjoes_runtime.ConsumedRef
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(MutableStruct(
        i = fishyjoes_runtime.consume_ref(i, int),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_i(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, MutableStruct).i)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_i(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, MutableStruct).i = fishyjoes_runtime.consume_ref(newValue, int)

# MARK: setup

# TODO: setup for testapi.structs.MutableStruct
