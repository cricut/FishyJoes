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
        return f'testapi.collections.CollectionHolder(bool_array={self.bool_array!r}, bool_set={self.bool_set!r}, bool_dictionary={self.bool_dictionary!r}, integer_array={self.integer_array!r}, integer_set={self.integer_set!r}, integer_dictionary={self.integer_dictionary!r}, string_array={self.string_array!r}, string_set={self.string_set!r}, string_dictionary={self.string_dictionary!r})'

    @staticmethod
    def get_static_mutable_property() -> list[int | None]:
        """<!-- FishyJoes.export(staticMutableProperty) -->"""
        return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_CollectionHolder_static_mutable_property(fishyjoes_runtime.Runtime.shared.env_ref), list)

    @staticmethod
    def set_static_mutable_property(new_value: list[int | None]) -> None: ...

    @staticmethod
    def get_static_property() -> list[int | None]:
        """<!-- FishyJoes.export(staticProperty) -->"""
        return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Collections_CollectionHolder_static_property(fishyjoes_runtime.Runtime.shared.env_ref), list)
