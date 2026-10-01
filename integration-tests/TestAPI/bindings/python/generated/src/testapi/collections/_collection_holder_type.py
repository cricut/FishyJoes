from . import _collection_holder_implementation as _impl
from .. import _testapi_exported as testapi
import dataclasses
import fishyjoes_runtime
import types
import typing

@dataclasses.dataclass
class CollectionHolder:
    """<!-- FishyJoes.export(Collections.CollectionHolder) -->"""
    boolArray: list[bool]
    boolSet: set[bool]
    boolDictionary: dict[bool,bool]
    integerArray: list[int]
    integerSet: set[int]
    integerDictionary: dict[int,int]
    stringArray: list[str]
    stringSet: set[str]
    stringDictionary: dict[str,str]

    # TODO: static field staticMutableProperty
    # TODO: static field staticProperty
