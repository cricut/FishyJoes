from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class Collections:
    """
    <!-- FishyJoes.export(Collections) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def arrayOfBigTuples() -> list[tuple[int, int, int, int]]:
        """
        <!-- FishyJoes.export(arrayOfBigTuples) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_arrayOfBigTuples", "object")
    

    @staticmethod
    def arrayOfInt() -> list[int]:
        """
        <!-- FishyJoes.export(arrayOfInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_arrayOfInt", "object")
    

    @staticmethod
    def defaultCollectionHolder() -> CollectionHolder:
        """
        <!-- FishyJoes.export(defaultCollectionHolder) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_defaultCollectionHolder", "object")
    

    @staticmethod
    def dictionaryOfIntToInt() -> dict[int, int]:
        """
        <!-- FishyJoes.export(dictionaryOfIntToInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_dictionaryOfIntToInt", "object")
    

    @staticmethod
    def maybeArrayOfInt() -> list[int] | None:
        """
        <!-- FishyJoes.export(maybeArrayOfInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_maybeArrayOfInt", "object")
    

    @staticmethod
    def maybeArrayOfMaybeInt() -> list[int | None] | None:
        """
        <!-- FishyJoes.export(maybeArrayOfMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_maybeArrayOfMaybeInt", "object")
    

    @staticmethod
    def maybeDictionaryOfIntToInt() -> dict[int, int] | None:
        """
        <!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_maybeDictionaryOfIntToInt", "object")
    

    @staticmethod
    def maybeDictionaryOfIntToMaybeInt() -> dict[int, int | None] | None:
        """
        <!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_maybeDictionaryOfIntToMaybeInt", "object")
    

    @staticmethod
    def maybeSetOfInt() -> set[int] | None:
        """
        <!-- FishyJoes.export(maybeSetOfInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_maybeSetOfInt", "object")
    

    @staticmethod
    def maybeSetOfMaybeInt() -> set[int | None] | None:
        """
        <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_maybeSetOfMaybeInt", "object")
    

    @staticmethod
    def setOfInt() -> set[int]:
        """
        <!-- FishyJoes.export(setOfInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Collections_setOfInt", "object")
    

    @staticmethod
    def echoArrayOfInt(arrayOfInt: list[int]) -> list[int]:
        """
        <!-- FishyJoes.export(echoArrayOfInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Collections_echoArrayOfInt", "object", ("object", arrayOfInt))
    

    @staticmethod
    def echoSetOfInt(setOfInt: set[int]) -> set[int]:
        """
        <!-- FishyJoes.export(echoSetOfInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Collections_echoSetOfInt", "object", ("object", setOfInt))
    

    @staticmethod
    def echoDictionaryOfIntToInt(dictionaryOfIntToInt: dict[int, int]) -> dict[int, int]:
        """
        <!-- FishyJoes.export(echoDictionaryOfIntToInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Collections_echoDictionaryOfIntToInt", "object", ("object", dictionaryOfIntToInt))
    

    @staticmethod
    def echoMaybeArrayOfMaybeInt(maybeArrayOfMaybeInt: list[int | None] | None) -> list[int | None] | None:
        """
        <!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Collections_echoMaybeArrayOfMaybeInt", "object", ("object", maybeArrayOfMaybeInt))
    

    @staticmethod
    def echoMaybeSetOfMaybeInt(maybeSetOfMaybeInt: set[int | None] | None) -> set[int | None] | None:
        """
        <!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Collections_echoMaybeSetOfMaybeInt", "object", ("object", maybeSetOfMaybeInt))
    

    @staticmethod
    def echoMaybeDictionaryOfIntToMaybeInt(maybeDictionaryOfIntToMaybeInt: dict[int, int | None] | None) -> dict[int, int | None] | None:
        """
        <!-- FishyJoes.export(echoMaybeDictionaryOfIntToMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt", "object", ("object", maybeDictionaryOfIntToMaybeInt))
    

    @staticmethod
    def collectionMapper(collection: list[int | None] | None, mapper: typing.Callable[[list[int | None] | None], list[int | None] | None]) -> list[int | None] | None:
        """
        <!-- FishyJoes.export(collectionMapper) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Collections_collectionMapper", "object", ("object", collection), ("object", mapper))
    
