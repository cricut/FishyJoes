from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class Results:
    """
    <!-- FishyJoes.export(Results) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def aFailure() -> typing.Any:
        """
        <!-- FishyJoes.export(aFailure) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Results_aFailure", "object")
    

    @staticmethod
    def aSuccess() -> typing.Any:
        """
        <!-- FishyJoes.export(aSuccess) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Results_aSuccess", "object")
    

    @staticmethod
    def processResult(result: typing.Any) -> str:
        """
        <!-- FishyJoes.export(processResult) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Results_processResult", "object", ("object", result))
    
