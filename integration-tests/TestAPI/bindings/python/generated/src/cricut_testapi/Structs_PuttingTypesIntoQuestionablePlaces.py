from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class Structs_PuttingTypesIntoQuestionablePlaces(NativeReference):
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
    def create() -> Structs_PuttingTypesIntoQuestionablePlaces:
        """
        <!-- FishyJoes.export(create) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create", "object")
    

    def testCall(self) -> builtins.int:
        """
        <!-- FishyJoes.export(testCall) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall", "int", ("object", self))
    

_cls_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup = Structs_PuttingTypesIntoQuestionablePlaces
