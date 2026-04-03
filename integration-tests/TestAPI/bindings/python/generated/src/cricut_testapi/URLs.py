from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class URLs:
    """
    <!-- FishyJoes.export(URLs) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def dataImage() -> str:
        """
        <!-- FishyJoes.export(dataImage) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_URLs_dataImage", "object")
    

    @staticmethod
    def localFile() -> str:
        """
        <!-- FishyJoes.export(localFile) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_URLs_localFile", "object")
    

    @staticmethod
    def remoteFile() -> str:
        """
        <!-- FishyJoes.export(remoteFile) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_URLs_remoteFile", "object")
    

    @staticmethod
    def simple() -> str:
        """
        <!-- FishyJoes.export(simple) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_URLs_simple", "object")
    

    @staticmethod
    def echo(url: str) -> str:
        """
        <!-- FishyJoes.export(echo) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_URLs_echo", "object", ("object", url))
    
