from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class EmptyEnum:
    """
    <!-- FishyJoes.export(EmptyEnum) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def aStaticProperty() -> int:
        """
        <!-- FishyJoes.export(aStaticProperty) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_EmptyEnum_aStaticProperty", "int")
    

    @staticmethod
    def notGoingToHappen() -> EmptyEnum:
        """
        <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_EmptyEnum_notGoingToHappen", "object")
    

    @staticmethod
    def aStaticMethod() -> int:
        """
        <!-- FishyJoes.export(aStaticMethod) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_EmptyEnum_aStaticMethod", "int")
    
