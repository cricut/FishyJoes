from __future__ import annotations
from .. import _testapi_exported as testapi
from .._c_api import _testapi_lib
from ._collection_holder_type import CollectionHolder
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_Collections_CollectionHolder_static_mutable_property: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_CollectionHolder_static_mutable_property'))

iota_get_TestAPI_Collections_CollectionHolder_static_property: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_CollectionHolder_static_property'))

iota_set_TestAPI_Collections_CollectionHolder_static_mutable_property: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_set_TestAPI_Collections_CollectionHolder_static_mutable_property'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    bool_array: fishyjoes_runtime.ConsumedRef,
    bool_set: fishyjoes_runtime.ConsumedRef,
    bool_dictionary: fishyjoes_runtime.ConsumedRef,
    integer_array: fishyjoes_runtime.ConsumedRef,
    integer_set: fishyjoes_runtime.ConsumedRef,
    integer_dictionary: fishyjoes_runtime.ConsumedRef,
    string_array: fishyjoes_runtime.ConsumedRef,
    string_set: fishyjoes_runtime.ConsumedRef,
    string_dictionary: fishyjoes_runtime.ConsumedRef
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(CollectionHolder(
        bool_array = fishyjoes_runtime.consume_ref(bool_array, list),
        bool_set = fishyjoes_runtime.consume_ref(bool_set, set),
        bool_dictionary = fishyjoes_runtime.consume_ref(bool_dictionary, dict),
        integer_array = fishyjoes_runtime.consume_ref(integer_array, list),
        integer_set = fishyjoes_runtime.consume_ref(integer_set, set),
        integer_dictionary = fishyjoes_runtime.consume_ref(integer_dictionary, dict),
        string_array = fishyjoes_runtime.consume_ref(string_array, list),
        string_set = fishyjoes_runtime.consume_ref(string_set, set),
        string_dictionary = fishyjoes_runtime.consume_ref(string_dictionary, dict),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_bool_array(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).bool_array)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_bool_array(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).bool_array = fishyjoes_runtime.consume_ref(newValue, list)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_bool_set(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).bool_set)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_bool_set(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).bool_set = fishyjoes_runtime.consume_ref(newValue, set)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_bool_dictionary(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).bool_dictionary)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_bool_dictionary(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).bool_dictionary = fishyjoes_runtime.consume_ref(newValue, dict)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_integer_array(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).integer_array)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_integer_array(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).integer_array = fishyjoes_runtime.consume_ref(newValue, list)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_integer_set(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).integer_set)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_integer_set(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).integer_set = fishyjoes_runtime.consume_ref(newValue, set)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_integer_dictionary(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).integer_dictionary)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_integer_dictionary(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).integer_dictionary = fishyjoes_runtime.consume_ref(newValue, dict)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_string_array(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).string_array)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_string_array(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).string_array = fishyjoes_runtime.consume_ref(newValue, list)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_string_set(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).string_set)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_string_set(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).string_set = fishyjoes_runtime.consume_ref(newValue, set)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_string_dictionary(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).string_dictionary)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_string_dictionary(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).string_dictionary = fishyjoes_runtime.consume_ref(newValue, dict)

# MARK: setup

# TODO: setup for testapi.collections.CollectionHolder
