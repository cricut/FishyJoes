from typing import Literal
from typing import Callable, Sized, TypeAlias, cast, Any

from .runtime import raise_by_out_ref
from ._fishyjoesruntime_c_api import _fishyjoes_runtime_lib, callback, ffi
from .ffi_types import ConsumedRef, CreatedRef, CreatedRefArray, EnvRef, OutCreatedRef, UTF16CString, \
    UnownedRef, UnownedRefArray
from .runtime import create_consumed_ref, create_ref, peek_ref, catch_by_out_ref
from .swift_function_impl import DynTypes

# MARK: C APIs

CollectionConstructorFn: TypeAlias = Callable[[UnownedRef, UnownedRefArray, int, OutCreatedRef], CreatedRef]
CollectionLengthFn: TypeAlias = Callable[[UnownedRef, UnownedRef, OutCreatedRef], int]
CollectionValuesFn: TypeAlias = Callable[[UnownedRef, UnownedRef, CreatedRefArray, OutCreatedRef], None]

FishyJoesCommonRuntime_collection_setup: \
    Callable[
        [EnvRef, UTF16CString, CollectionLengthFn, CollectionValuesFn, CollectionConstructorFn, ConsumedRef], None] = \
    raise_by_out_ref(getattr(_fishyjoes_runtime_lib, "FishyJoesCommonRuntime_collection_setup"))


# MARK: C callback implementations

@callback("FishyJoes_CollectionLengthFn")
@catch_by_out_ref(default=0)
def _collection_length(context: UnownedRef, collection: UnownedRef) -> int:
    obj = peek_ref(collection, list, set, dict)
    return len(cast(Sized, obj))


@callback("FishyJoes_CollectionValuesFn")
@catch_by_out_ref(default=None)
def _array_or_set_values(context: UnownedRef, collection: UnownedRef, out_values: CreatedRefArray) -> None:
    elements = peek_ref(collection, list, set)
    for index, element in enumerate(elements):
        out_values[index] = create_ref(element)


@callback("FishyJoes_CollectionValuesFn")
@catch_by_out_ref(default=None)
def _dictionary_values(context: UnownedRef, collection: UnownedRef, out_values: CreatedRefArray) -> None:
    dictionary = peek_ref(collection, dict)
    for index, key in enumerate(dictionary):
        out_values[index * 2 + 0] = create_ref(key)
        out_values[index * 2 + 1] = create_ref(dictionary[key])


@callback("FishyJoes_CollectionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _array_constructor(context: UnownedRef, in_values: UnownedRefArray, length: int) -> CreatedRef:
    dyn_types = peek_ref(context, tuple)
    elements: list[Any] = [peek_ref(in_values[index], *dyn_types) for index in range(length)]
    return create_ref(elements)


@callback("FishyJoes_CollectionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _dictionary_constructor(context: UnownedRef, in_values: UnownedRefArray, length: int) -> CreatedRef:
    (key_dyn_types, value_dyn_types) = peek_ref(context, tuple)
    dictionary = dict()
    for index in range(length):
        key = peek_ref(in_values[index * 2 + 0], *key_dyn_types)
        value = peek_ref(in_values[index * 2 + 1], *value_dyn_types)
        dictionary[key] = value
    return create_ref(dictionary)


@callback("FishyJoes_CollectionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _set_constructor(context: UnownedRef, in_values: UnownedRefArray, length: int) -> CreatedRef:
    dyn_types = peek_ref(context, tuple)
    elements: set[Any] = {peek_ref(in_values[index], *dyn_types) for index in range(length)}
    return create_ref(elements)


# MARK: setup

def FishyJoesCommonRuntime_ArrayConverter_setup(
    env_ref: EnvRef, utf16_name: UTF16CString, dyn_types: DynTypes
) -> None:
    return FishyJoesCommonRuntime_collection_setup(
        env_ref,
        utf16_name,
        _collection_length,
        _array_or_set_values,
        _array_constructor,
        create_consumed_ref(dyn_types),
    )


def FishyJoesCommonRuntime_DictionaryConverter_setup(
    env_ref: EnvRef,
    utf16_name: UTF16CString,
    dyn_key_type: DynTypes,
    dyn_value_type: DynTypes,
) -> None:
    return FishyJoesCommonRuntime_collection_setup(
        env_ref,
        utf16_name,
        _collection_length,
        _dictionary_values,
        _dictionary_constructor,
        create_consumed_ref((dyn_key_type, dyn_value_type)),
    )


def FishyJoesCommonRuntime_SetConverter_setup(
    env_ref: EnvRef, utf16_name: UTF16CString, dyn_types: DynTypes,
) -> None:
    return FishyJoesCommonRuntime_collection_setup(
        env_ref,
        utf16_name,
        _collection_length,
        _array_or_set_values,
        _set_constructor,
        create_consumed_ref(dyn_types),
    )


def FishyJoesCommonRuntime_OptionalConverter_setup[T](env_ref: EnvRef) -> None:
    # Optionals need no extra setup
    pass


def setup_collections() -> None:
    # Generic types need to be set up as instantiated types, so nothing to do here.
    pass
