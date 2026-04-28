from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class Bytes:
    """
    <!-- FishyJoes.export(Bytes) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def bytes() -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(bytes, cSharp: TheBytes) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Bytes_bytes", "object")
    

    @staticmethod
    def data() -> builtins.bytes:
        """
        <!-- FishyJoes.export(data) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Bytes_data", "object")
    

    @staticmethod
    def echoBytes(bytes: builtins.list[builtins.int]) -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(echoBytes) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Bytes_echoBytes", "object", ("object", bytes))
    

    @staticmethod
    def echoData(data: builtins.bytes) -> builtins.bytes:
        """
        <!-- FishyJoes.export(echoData) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Bytes_echoData", "object", ("object", data))
    
