from .. import _testapi_exported as testapi
from ._c_api import _testapi_lib
from ._collection_holder_type import CollectionHolder
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_get_TestAPI_Collections_CollectionHolder_staticProperty: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    boolArray: fishyjoes_runtime.ConsumedRef,
    boolSet: fishyjoes_runtime.ConsumedRef,
    boolDictionary: fishyjoes_runtime.ConsumedRef,
    integerArray: fishyjoes_runtime.ConsumedRef,
    integerSet: fishyjoes_runtime.ConsumedRef,
    integerDictionary: fishyjoes_runtime.ConsumedRef,
    stringArray: fishyjoes_runtime.ConsumedRef,
    stringSet: fishyjoes_runtime.ConsumedRef,
    stringDictionary: fishyjoes_runtime.ConsumedRef
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(CollectionHolder(
        boolArray = fishyjoes_runtime.consume_ref(boolArray, list),
        boolSet = fishyjoes_runtime.consume_ref(boolSet, set),
        boolDictionary = fishyjoes_runtime.consume_ref(boolDictionary, dict),
        integerArray = fishyjoes_runtime.consume_ref(integerArray, list),
        integerSet = fishyjoes_runtime.consume_ref(integerSet, set),
        integerDictionary = fishyjoes_runtime.consume_ref(integerDictionary, dict),
        stringArray = fishyjoes_runtime.consume_ref(stringArray, list),
        stringSet = fishyjoes_runtime.consume_ref(stringSet, set),
        stringDictionary = fishyjoes_runtime.consume_ref(stringDictionary, dict),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_boolArray(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).boolArray)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_boolArray(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).boolArray = fishyjoes_runtime.consume_ref(newValue, list)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_boolSet(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).boolSet)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_boolSet(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).boolSet = fishyjoes_runtime.consume_ref(newValue, set)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_boolDictionary(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).boolDictionary)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_boolDictionary(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).boolDictionary = fishyjoes_runtime.consume_ref(newValue, dict)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_integerArray(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).integerArray)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_integerArray(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).integerArray = fishyjoes_runtime.consume_ref(newValue, list)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_integerSet(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).integerSet)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_integerSet(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).integerSet = fishyjoes_runtime.consume_ref(newValue, set)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_integerDictionary(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).integerDictionary)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_integerDictionary(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).integerDictionary = fishyjoes_runtime.consume_ref(newValue, dict)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_stringArray(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).stringArray)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_stringArray(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).stringArray = fishyjoes_runtime.consume_ref(newValue, list)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_stringSet(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).stringSet)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_stringSet(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).stringSet = fishyjoes_runtime.consume_ref(newValue, set)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_stringDictionary(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, CollectionHolder).stringDictionary)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_stringDictionary(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, CollectionHolder).stringDictionary = fishyjoes_runtime.consume_ref(newValue, dict)

# MARK: setup

# TODO: setup for testapi.collections.CollectionHolder
