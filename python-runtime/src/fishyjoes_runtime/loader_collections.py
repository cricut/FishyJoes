from typing import Callable, Sized, TypeAlias, cast, Any

from fishyjoes_runtime._fishyjoesruntime_c_api import _fishyjoes_runtime_lib, callback, ffi
from fishyjoes_runtime.ffi_types import ConsumedRef, CreatedRef, CreatedRefArray, EnvRef, OutCreatedRef, UTF16CString, \
    UnownedRef, UnownedRefArray
from fishyjoes_runtime.runtime import _create_consumed_ref, _create_ref, _peek_ref, catch_by_out_ref

# MARK: C APIs

CollectionConstructorFn: TypeAlias = Callable[[UnownedRef, UnownedRefArray, int, OutCreatedRef], CreatedRef]
CollectionLengthFn: TypeAlias = Callable[[UnownedRef, UnownedRef, OutCreatedRef], int]
CollectionValuesFn: TypeAlias = Callable[[UnownedRef, UnownedRef, CreatedRefArray, OutCreatedRef], None]

FishyJoesCommonRuntime_collection_setup: \
    Callable[[EnvRef, UTF16CString, CollectionLengthFn, CollectionValuesFn, CollectionConstructorFn, ConsumedRef,
              OutCreatedRef], None] = \
    getattr(_fishyjoes_runtime_lib, "FishyJoesCommonRuntime_collection_setup")


# MARK: C callback implementations

@callback("FishyJoes_CollectionLengthFn")
@catch_by_out_ref(default=0)
def _collection_length(context: UnownedRef, collection: UnownedRef) -> int:
    obj = _peek_ref(collection, list, set, dict)
    return len(cast(Sized, obj))


@callback("FishyJoes_CollectionValuesFn")
@catch_by_out_ref(default=None)
def _array_or_set_values(context: UnownedRef, collection: UnownedRef, out_values: CreatedRefArray) -> None:
    elements = _peek_ref(collection, list, set)
    for index, element in enumerate(elements):
        out_values[index] = _create_ref(element)


@callback("FishyJoes_CollectionValuesFn")
@catch_by_out_ref(default=None)
def _dictionary_values(context: UnownedRef, collection: UnownedRef, out_values: CreatedRefArray) -> None:
    dictionary = _peek_ref(collection, dict)
    for index, key in enumerate(dictionary):
        out_values[index * 2 + 0] = _create_ref(key)
        out_values[index * 2 + 1] = _create_ref(dictionary[key])


@callback("FishyJoes_CollectionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _array_constructor(context: UnownedRef, in_values: UnownedRefArray, length: int) -> CreatedRef:
    dyn_type = _peek_ref(context, type)
    elements: list[Any] = [_peek_ref(in_values[index], dyn_type) for index in range(length)]
    return _create_ref(elements)


@callback("FishyJoes_CollectionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _dictionary_constructor(context: UnownedRef, in_values: UnownedRefArray, length: int) -> CreatedRef:
    (key_dyn_type, value_dyn_type) = _peek_ref(context, tuple)
    dictionary = dict()
    for index in range(length):
        key = _peek_ref(in_values[index * 2 + 0], key_dyn_type)
        value = _peek_ref(in_values[index * 2 + 1], value_dyn_type)
        dictionary[key] = value
    return _create_ref(dictionary)


@callback("FishyJoes_CollectionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _set_constructor(context: UnownedRef, in_values: UnownedRefArray, length: int) -> CreatedRef:
    dyn_type = _peek_ref(context, type)
    elements: set[Any] = {_peek_ref(in_values[index], dyn_type) for index in range(length)}
    return _create_ref(elements)

# MARK: setup

def FishyJoesCommonRuntime_ArrayConverter_setup[T](
    env_ref: EnvRef, utf16_name: UTF16CString, dyn_type: type[T], out_exn: OutCreatedRef,
) -> None:
    return FishyJoesCommonRuntime_collection_setup(
        env_ref,
        utf16_name,
        _collection_length,
        _array_or_set_values,
        _array_constructor,
        _create_consumed_ref(dyn_type),
        out_exn,
    )


def FishyJoesCommonRuntime_DictionaryConverter_setup[K, V](
    env_ref: EnvRef,
    utf16_name: UTF16CString,
    dyn_key_type: type[K],
    dyn_value_type: type[V],
    out_exn: OutCreatedRef,
) -> None:
    return FishyJoesCommonRuntime_collection_setup(
        env_ref,
        utf16_name,
        _collection_length,
        _dictionary_values,
        _dictionary_constructor,
        _create_consumed_ref((dyn_key_type, dyn_value_type)),
        out_exn,
    )


def FishyJoesCommonRuntime_SetConverter_setup[T](
    env_ref: EnvRef, utf16_name: UTF16CString, dyn_type: type[T], out_exn: OutCreatedRef,
) -> None:
    return FishyJoesCommonRuntime_collection_setup(
        env_ref,
        utf16_name,
        _collection_length,
        _array_or_set_values,
        _set_constructor,
        _create_consumed_ref(dyn_type),
        out_exn,
    )


def setup_collections() -> None:
    # Generic types need to be set up as instantiated types, so nothing to do here.
    pass
