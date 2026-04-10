from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class PuttingTypesIntoQuestionablePlaces:
    """
    <!-- FishyJoes.export(AttributedString_PuttingTypesIntoQuestionablePlaces) -->
    Generated FishyJoes Python value type.
    """
    x: str

    def testCall(self) -> int:
        """
        <!-- FishyJoes.export(testCall) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_testCall", "int", ("object", self))
    

@dataclass(slots=True)
class PuttingTypesIntoQuestionablePlaces:
    """
    <!-- FishyJoes.export(String_PuttingTypesIntoQuestionablePlaces) -->
    Generated FishyJoes Python value type.
    """
    x: str

    def testCall(self) -> int:
        """
        <!-- FishyJoes.export(testCall) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall", "int", ("object", self))
    

class PuttingTypesIntoQuestionablePlaces(NativeReference):
    """
    <!-- FishyJoes.exportReference(Structs_PuttingTypesIntoQuestionablePlaces) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
        if native_ref is not None:
            import weakref
            weakref.finalize(self, _get_runtime().release_native_ref, native_ref)
        
    

    @staticmethod
    def create() -> PuttingTypesIntoQuestionablePlaces:
        """
        <!-- FishyJoes.export(create) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create", "object")
    

    def testCall(self) -> int:
        """
        <!-- FishyJoes.export(testCall) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall", "int", ("object", self))
    

class PuttingTypesIntoQuestionablePlaces(enum.Enum):
    """
    <!-- FishyJoes.export(UnicodeScalar_PuttingTypesIntoQuestionablePlaces) -->
    Generated FishyJoes Python enum.
    """
    thing = "thing"

    def testCall(self) -> int:
        """
        <!-- FishyJoes.export(testCall) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall", "int", ("object", self))
    
