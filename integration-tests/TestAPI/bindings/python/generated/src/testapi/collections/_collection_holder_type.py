from __future__ import annotations
from . import _collection_holder_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class CollectionHolder:
    """<!-- FishyJoes.export(Collections.CollectionHolder) -->"""

    bool_array: list[bool]
    bool_set: set[bool]
    bool_dictionary: dict[bool,bool]
    integer_array: list[int]
    integer_set: set[int]
    integer_dictionary: dict[int,int]
    string_array: list[str]
    string_set: set[str]
    string_dictionary: dict[str,str]
    __slots__: list[str] = [
        'bool_array',
        'bool_set',
        'bool_dictionary',
        'integer_array',
        'integer_set',
        'integer_dictionary',
        'string_array',
        'string_set',
        'string_dictionary',
    ]

    def __init__(
        self,
        bool_array: list[bool],
        bool_set: set[bool],
        bool_dictionary: dict[bool,bool],
        integer_array: list[int],
        integer_set: set[int],
        integer_dictionary: dict[int,int],
        string_array: list[str],
        string_set: set[str],
        string_dictionary: dict[str,str],
    ) -> None:
        self.bool_array = bool_array
        self.bool_set = bool_set
        self.bool_dictionary = bool_dictionary
        self.integer_array = integer_array
        self.integer_set = integer_set
        self.integer_dictionary = integer_dictionary
        self.string_array = string_array
        self.string_set = string_set
        self.string_dictionary = string_dictionary

    def __repr__(self) -> str:
        return f'testapi.collections.CollectionHolder(...)'

    @staticmethod
    def get_static_mutable_property() -> list[int | None]:
        """<!-- FishyJoes.export(staticMutableProperty) -->"""
        return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty(fishyjoes_runtime.Runtime.shared.env_ref), list)

    @staticmethod
    def set_static_mutable_property(new_value: list[int | None]) -> None:
        with fishyjoes_runtime.local_handles(new_value) as (new_value_handle,):
            _impl.iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty(fishyjoes_runtime.Runtime.shared.env_ref, new_value_handle)

    @staticmethod
    def get_static_property() -> list[int | None]:
        """<!-- FishyJoes.export(staticProperty) -->"""
        return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_CollectionHolder_staticProperty(fishyjoes_runtime.Runtime.shared.env_ref), list)

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        return isinstance(other, CollectionHolder) and \
            self.bool_array == other.bool_array and \
            self.bool_set == other.bool_set and \
            self.bool_dictionary == other.bool_dictionary and \
            self.integer_array == other.integer_array and \
            self.integer_set == other.integer_set and \
            self.integer_dictionary == other.integer_dictionary and \
            self.string_array == other.string_array and \
            self.string_set == other.string_set and \
            self.string_dictionary == other.string_dictionary and \
            True
