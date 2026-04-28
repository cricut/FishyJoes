from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented
if typing.TYPE_CHECKING: from .CollectionHolder import CollectionHolder

class Collections:
    """
    <!-- FishyJoes.export(Collections) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def arrayOfBigTuples() -> builtins.list[builtins.tuple[builtins.int, builtins.int, builtins.int, builtins.int]]:
        """
        <!-- FishyJoes.export(arrayOfBigTuples) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_arrayOfBigTuples", "object")
    

    @staticmethod
    def arrayOfInt() -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(arrayOfInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_arrayOfInt", "object")
    

    @staticmethod
    def defaultCollectionHolder() -> CollectionHolder:
        """
        <!-- FishyJoes.export(defaultCollectionHolder) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_defaultCollectionHolder", "object")
    

    @staticmethod
    def dictionaryOfIntToInt() -> builtins.dict[builtins.int, builtins.int]:
        """
        <!-- FishyJoes.export(dictionaryOfIntToInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_dictionaryOfIntToInt", "object")
    

    @staticmethod
    def maybeArrayOfInt() -> builtins.list[builtins.int] | None:
        """
        <!-- FishyJoes.export(maybeArrayOfInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_maybeArrayOfInt", "object")
    

    @staticmethod
    def maybeArrayOfMaybeInt() -> builtins.list[builtins.int | None] | None:
        """
        <!-- FishyJoes.export(maybeArrayOfMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_maybeArrayOfMaybeInt", "object")
    

    @staticmethod
    def maybeDictionaryOfIntToInt() -> builtins.dict[builtins.int, builtins.int] | None:
        """
        <!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_maybeDictionaryOfIntToInt", "object")
    

    @staticmethod
    def maybeDictionaryOfIntToMaybeInt() -> builtins.dict[builtins.int, builtins.int | None] | None:
        """
        <!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_maybeDictionaryOfIntToMaybeInt", "object")
    

    @staticmethod
    def maybeSetOfInt() -> builtins.set[builtins.int] | None:
        """
        <!-- FishyJoes.export(maybeSetOfInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_maybeSetOfInt", "object")
    

    @staticmethod
    def maybeSetOfMaybeInt() -> builtins.set[builtins.int | None] | None:
        """
        <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_maybeSetOfMaybeInt", "object")
    

    @staticmethod
    def setOfInt() -> builtins.set[builtins.int]:
        """
        <!-- FishyJoes.export(setOfInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Collections_setOfInt", "object")
    

    @staticmethod
    def echoArrayOfInt(arrayOfInt: builtins.list[builtins.int]) -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(echoArrayOfInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Collections_echoArrayOfInt", "object", ("object", arrayOfInt))
    

    @staticmethod
    def echoSetOfInt(setOfInt: builtins.set[builtins.int]) -> builtins.set[builtins.int]:
        """
        <!-- FishyJoes.export(echoSetOfInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Collections_echoSetOfInt", "object", ("object", setOfInt))
    

    @staticmethod
    def echoDictionaryOfIntToInt(dictionaryOfIntToInt: builtins.dict[builtins.int, builtins.int]) -> builtins.dict[builtins.int, builtins.int]:
        """
        <!-- FishyJoes.export(echoDictionaryOfIntToInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Collections_echoDictionaryOfIntToInt", "object", ("object", dictionaryOfIntToInt))
    

    @staticmethod
    def echoMaybeArrayOfMaybeInt(maybeArrayOfMaybeInt: builtins.list[builtins.int | None] | None) -> builtins.list[builtins.int | None] | None:
        """
        <!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Collections_echoMaybeArrayOfMaybeInt", "object", ("object", maybeArrayOfMaybeInt))
    

    @staticmethod
    def echoMaybeSetOfMaybeInt(maybeSetOfMaybeInt: builtins.set[builtins.int | None] | None) -> builtins.set[builtins.int | None] | None:
        """
        <!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Collections_echoMaybeSetOfMaybeInt", "object", ("object", maybeSetOfMaybeInt))
    

    @staticmethod
    def echoMaybeDictionaryOfIntToMaybeInt(maybeDictionaryOfIntToMaybeInt: builtins.dict[builtins.int, builtins.int | None] | None) -> builtins.dict[builtins.int, builtins.int | None] | None:
        """
        <!-- FishyJoes.export(echoMaybeDictionaryOfIntToMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt", "object", ("object", maybeDictionaryOfIntToMaybeInt))
    

    @staticmethod
    def collectionMapper(collection: builtins.list[builtins.int | None] | None, mapper: typing.Callable[[builtins.list[builtins.int | None] | None], builtins.list[builtins.int | None] | None]) -> builtins.list[builtins.int | None] | None:
        """
        <!-- FishyJoes.export(collectionMapper) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Collections_collectionMapper", "object", ("object", collection), ("object", mapper))
    
