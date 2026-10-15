from __future__ import annotations
from .. import _testapi_exported as testapi
from .._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty'))

iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty'))

iota_get_TestAPI_Collections_CollectionHolder_staticProperty: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_CollectionHolder_staticProperty'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_constructorFn')
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
    return fishyjoes_runtime.create_ref(testapi.collections.CollectionHolder(
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

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_boolArrayGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_bool_array(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).bool_array)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_boolArraySetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_bool_array(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).bool_array = fishyjoes_runtime.consume_ref(newValue, list)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_boolSetGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_bool_set(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).bool_set)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_boolSetSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_bool_set(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).bool_set = fishyjoes_runtime.consume_ref(newValue, set)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_boolDictionaryGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_bool_dictionary(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).bool_dictionary)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_boolDictionarySetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_bool_dictionary(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).bool_dictionary = fishyjoes_runtime.consume_ref(newValue, dict)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_integerArrayGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_integer_array(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).integer_array)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_integerArraySetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_integer_array(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).integer_array = fishyjoes_runtime.consume_ref(newValue, list)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_integerSetGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_integer_set(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).integer_set)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_integerSetSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_integer_set(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).integer_set = fishyjoes_runtime.consume_ref(newValue, set)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_integerDictionaryGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_integer_dictionary(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).integer_dictionary)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_integerDictionarySetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_integer_dictionary(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).integer_dictionary = fishyjoes_runtime.consume_ref(newValue, dict)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_stringArrayGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_string_array(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).string_array)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_stringArraySetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_string_array(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).string_array = fishyjoes_runtime.consume_ref(newValue, list)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_stringSetGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_string_set(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).string_set)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_stringSetSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_string_set(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).string_set = fishyjoes_runtime.consume_ref(newValue, set)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_stringDictionaryGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_string_dictionary(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).string_dictionary)

@fishyjoes_runtime.callback('TestAPI_Collections_CollectionHolder_stringDictionarySetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_string_dictionary(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.collections.CollectionHolder).string_dictionary = fishyjoes_runtime.consume_ref(newValue, dict)

# MARK: setup

# TODO: setup for testapi.collections.CollectionHolder
