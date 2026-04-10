from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class Deprecations:
    """
    <!-- FishyJoes.export(Deprecations) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def deprecatedVariable() -> int:
        """
        <!-- FishyJoes.export(deprecatedVariable) -->
        Deprecated: replace with `deprecatedMethod` (This is the swift name of the replacement function, due to technical limitations)
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Deprecations_deprecatedVariable", "int")
    

    @staticmethod
    def deprecatedMethod() -> str:
        """
        <!-- FishyJoes.export(deprecatedMethod) -->
        Deprecated: don't use this
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Deprecations_deprecatedMethod", "object")
    
