from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class URLs:
    """
    <!-- FishyJoes.export(URLs) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def dataImage() -> builtins.str:
        """
        <!-- FishyJoes.export(dataImage) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_URLs_dataImage", "object")
    

    @staticmethod
    def localFile() -> builtins.str:
        """
        <!-- FishyJoes.export(localFile) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_URLs_localFile", "object")
    

    @staticmethod
    def remoteFile() -> builtins.str:
        """
        <!-- FishyJoes.export(remoteFile) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_URLs_remoteFile", "object")
    

    @staticmethod
    def simple() -> builtins.str:
        """
        <!-- FishyJoes.export(simple) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_URLs_simple", "object")
    

    @staticmethod
    def echo(url: builtins.str) -> builtins.str:
        """
        <!-- FishyJoes.export(echo) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_URLs_echo", "object", ("object", url))
    
