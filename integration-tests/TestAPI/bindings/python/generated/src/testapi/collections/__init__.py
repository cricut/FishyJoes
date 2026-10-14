from __future__ import annotations
from .. import _collections_implementation as _impl
from .. import _testapi_exported as testapi
from ._collection_holder_type import CollectionHolder
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "CollectionHolder",
    "get_array_of_big_tuples",
    "get_array_of_int",
    "get_default_collection_holder",
    "get_dictionary_of_int_to_int",
    "get_maybe_array_of_int",
    "get_maybe_array_of_maybe_int",
    "get_maybe_dictionary_of_int_to_int",
    "get_maybe_dictionary_of_int_to_maybe_int",
    "get_maybe_set_of_int",
    "get_maybe_set_of_maybe_int",
    "get_set_of_int",
    "echo_array_of_int",
    "echo_set_of_int",
    "echo_dictionary_of_int_to_int",
    "echo_maybe_array_of_maybe_int",
    "echo_maybe_set_of_maybe_int",
    "echo_maybe_dictionary_of_int_to_maybe_int",
    "collection_mapper",
]

def get_array_of_big_tuples() -> list[tuple[int,int,int,int]]:
    """<!-- FishyJoes.export(arrayOfBigTuples) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_array_of_big_tuples(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_array_of_int() -> list[int]:
    """<!-- FishyJoes.export(arrayOfInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_array_of_int(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_default_collection_holder() -> testapi.collections.CollectionHolder:
    """<!-- FishyJoes.export(defaultCollectionHolder) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_default_collection_holder(fishyjoes_runtime.Runtime.shared.env_ref), testapi.collections.CollectionHolder)

def get_dictionary_of_int_to_int() -> dict[int,int]:
    """<!-- FishyJoes.export(dictionaryOfIntToInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_dictionary_of_int_to_int(fishyjoes_runtime.Runtime.shared.env_ref), dict)

def get_maybe_array_of_int() -> list[int] | None:
    """<!-- FishyJoes.export(maybeArrayOfInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_maybe_array_of_int(fishyjoes_runtime.Runtime.shared.env_ref), list, types.NoneType)

def get_maybe_array_of_maybe_int() -> list[int | None] | None:
    """<!-- FishyJoes.export(maybeArrayOfMaybeInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_maybe_array_of_maybe_int(fishyjoes_runtime.Runtime.shared.env_ref), list, types.NoneType)

def get_maybe_dictionary_of_int_to_int() -> dict[int,int] | None:
    """<!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_maybe_dictionary_of_int_to_int(fishyjoes_runtime.Runtime.shared.env_ref), dict, types.NoneType)

def get_maybe_dictionary_of_int_to_maybe_int() -> dict[int,int | None] | None:
    """<!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_maybe_dictionary_of_int_to_maybe_int(fishyjoes_runtime.Runtime.shared.env_ref), dict, types.NoneType)

def get_maybe_set_of_int() -> set[int] | None:
    """<!-- FishyJoes.export(maybeSetOfInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_maybe_set_of_int(fishyjoes_runtime.Runtime.shared.env_ref), set, types.NoneType)

def get_maybe_set_of_maybe_int() -> set[int | None] | None:
    """<!-- FishyJoes.export(maybeSetOfMaybeInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_maybe_set_of_maybe_int(fishyjoes_runtime.Runtime.shared.env_ref), set, types.NoneType)

def get_set_of_int() -> set[int]:
    """<!-- FishyJoes.export(setOfInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_set_of_int(fishyjoes_runtime.Runtime.shared.env_ref), set)

def echo_array_of_int(
    array_of_int: list[int],
) -> list[int]:
    """<!-- FishyJoes.export(echoArrayOfInt) -->"""
    with fishyjoes_runtime.local_handles(array_of_int) as (_array_of_intHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Collections_echoArrayOfInt(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _array_of_intHandle,
            ),
            list
        )

def echo_set_of_int(
    set_of_int: set[int],
) -> set[int]:
    """<!-- FishyJoes.export(echoSetOfInt) -->"""
    with fishyjoes_runtime.local_handles(set_of_int) as (_set_of_intHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Collections_echoSetOfInt(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _set_of_intHandle,
            ),
            set
        )

def echo_dictionary_of_int_to_int(
    dictionary_of_int_to_int: dict[int,int],
) -> dict[int,int]:
    """<!-- FishyJoes.export(echoDictionaryOfIntToInt) -->"""
    with fishyjoes_runtime.local_handles(dictionary_of_int_to_int) as (_dictionary_of_int_to_intHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Collections_echoDictionaryOfIntToInt(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _dictionary_of_int_to_intHandle,
            ),
            dict
        )

def echo_maybe_array_of_maybe_int(
    maybe_array_of_maybe_int: list[int | None] | None,
) -> list[int | None] | None:
    """<!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) -->"""
    with fishyjoes_runtime.local_handles(maybe_array_of_maybe_int) as (_maybe_array_of_maybe_intHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Collections_echoMaybeArrayOfMaybeInt(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _maybe_array_of_maybe_intHandle,
            ),
            list, types.NoneType
        )

def echo_maybe_set_of_maybe_int(
    maybe_set_of_maybe_int: set[int | None] | None,
) -> set[int | None] | None:
    """<!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->"""
    with fishyjoes_runtime.local_handles(maybe_set_of_maybe_int) as (_maybe_set_of_maybe_intHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Collections_echoMaybeSetOfMaybeInt(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _maybe_set_of_maybe_intHandle,
            ),
            set, types.NoneType
        )

def echo_maybe_dictionary_of_int_to_maybe_int(
    maybe_dictionary_of_int_to_maybe_int: dict[int,int | None] | None,
) -> dict[int,int | None] | None:
    """<!-- FishyJoes.export(echoMaybeDictionaryOfIntToMaybeInt) -->"""
    with fishyjoes_runtime.local_handles(maybe_dictionary_of_int_to_maybe_int) as (_maybe_dictionary_of_int_to_maybe_intHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _maybe_dictionary_of_int_to_maybe_intHandle,
            ),
            dict, types.NoneType
        )

def collection_mapper(
    collection: list[int | None] | None,
    mapper: typing.Callable[[list[int | None] | None], list[int | None] | None],
) -> list[int | None] | None:
    """<!-- FishyJoes.export(collectionMapper) -->"""
    with fishyjoes_runtime.local_handles(collection, mapper) as (_collectionHandle, _mapperHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Collections_collectionMapper(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _collectionHandle,
                _mapperHandle,
            ),
            list, types.NoneType
        )
