from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class ReferenceEmptyEnum:
    """
    <!-- FishyJoes.export(ReferenceEmptyEnum) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def aStaticProperty() -> builtins.int:
        """
        <!-- FishyJoes.export(aStaticProperty) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ReferenceEmptyEnum_aStaticProperty", "int")
    

    @staticmethod
    def notGoingToHappen() -> ReferenceEmptyEnum:
        """
        <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ReferenceEmptyEnum_notGoingToHappen", "object")
    

    @staticmethod
    def aStaticMethod() -> builtins.int:
        """
        <!-- FishyJoes.export(aStaticMethod) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ReferenceEmptyEnum_aStaticMethod", "int")
    
