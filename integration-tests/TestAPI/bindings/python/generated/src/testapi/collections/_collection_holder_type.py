from . import _collection_holder_implementation as _impl
from .. import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

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

    def __init__(
        self,
        boolArray: list[bool],
        boolSet: set[bool],
        boolDictionary: dict[bool,bool],
        integerArray: list[int],
        integerSet: set[int],
        integerDictionary: dict[int,int],
        stringArray: list[str],
        stringSet: set[str],
        stringDictionary: dict[str,str],
    ) -> None:
        self.boolArray = boolArray
        self.boolSet = boolSet
        self.boolDictionary = boolDictionary
        self.integerArray = integerArray
        self.integerSet = integerSet
        self.integerDictionary = integerDictionary
        self.stringArray = stringArray
        self.stringSet = stringSet
        self.stringDictionary = stringDictionary

    def __repr__(self) -> str:
        return f'testapi.collections.CollectionHolder(boolArray={self.boolArray!r}, boolSet={self.boolSet!r}, boolDictionary={self.boolDictionary!r}, integerArray={self.integerArray!r}, integerSet={self.integerSet!r}, integerDictionary={self.integerDictionary!r}, stringArray={self.stringArray!r}, stringSet={self.stringSet!r}, stringDictionary={self.stringDictionary!r})'

    # TODO: static field staticMutableProperty
    # TODO: static field staticProperty
