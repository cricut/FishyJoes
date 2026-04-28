from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class UnicodeScalar_PuttingTypesIntoQuestionablePlaces(enum.Enum):
    """
    <!-- FishyJoes.export(UnicodeScalar_PuttingTypesIntoQuestionablePlaces) -->
    Generated FishyJoes Python enum.
    """
    thing = "thing"

    def testCall(self) -> builtins.int:
        """
        <!-- FishyJoes.export(testCall) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall", "int", ("object", self))
    
