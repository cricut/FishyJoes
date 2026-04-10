from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class ClosedRanges:
    """
    <!-- FishyJoes.export(ClosedRanges) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def doubleRange() -> typing.Any:
        """
        <!-- FishyJoes.export(doubleRange) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_doubleRange", "object")
    

    @staticmethod
    def floatRange() -> typing.Any:
        """
        <!-- FishyJoes.export(floatRange) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_floatRange", "object")
    

    @staticmethod
    def int16Range() -> typing.Any:
        """
        <!-- FishyJoes.export(int16Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_int16Range", "object")
    

    @staticmethod
    def int32Range() -> typing.Any:
        """
        <!-- FishyJoes.export(int32Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_int32Range", "object")
    

    @staticmethod
    def int64Range() -> typing.Any:
        """
        <!-- FishyJoes.export(int64Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_int64Range", "object")
    

    @staticmethod
    def int8Range() -> typing.Any:
        """
        <!-- FishyJoes.export(int8Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_int8Range", "object")
    

    @staticmethod
    def intRange() -> typing.Any:
        """
        <!-- FishyJoes.export(intRange) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_intRange", "object")
    

    @staticmethod
    def stringRange() -> typing.Any:
        """
        <!-- FishyJoes.export(stringRange) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_stringRange", "object")
    

    @staticmethod
    def uInt16Range() -> typing.Any:
        """
        <!-- FishyJoes.export(uInt16Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_uInt16Range", "object")
    

    @staticmethod
    def uInt32Range() -> typing.Any:
        """
        <!-- FishyJoes.export(uInt32Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_uInt32Range", "object")
    

    @staticmethod
    def uInt64Range() -> typing.Any:
        """
        <!-- FishyJoes.export(uInt64Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_uInt64Range", "object")
    

    @staticmethod
    def uInt8Range() -> typing.Any:
        """
        <!-- FishyJoes.export(uInt8Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_uInt8Range", "object")
    

    @staticmethod
    def uIntRange() -> typing.Any:
        """
        <!-- FishyJoes.export(uIntRange) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_ClosedRanges_uIntRange", "object")
    

    @staticmethod
    def echoUInt8Range(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoUInt8Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoUInt8Range", "object", ("object", range))
    

    @staticmethod
    def echoUInt16Range(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoUInt16Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoUInt16Range", "object", ("object", range))
    

    @staticmethod
    def echoUInt32Range(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoUInt32Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoUInt32Range", "object", ("object", range))
    

    @staticmethod
    def echoUInt64Range(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoUInt64Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoUInt64Range", "object", ("object", range))
    

    @staticmethod
    def echoUIntRange(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoUIntRange) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoUIntRange", "object", ("object", range))
    

    @staticmethod
    def echoInt8Range(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoInt8Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoInt8Range", "object", ("object", range))
    

    @staticmethod
    def echoInt16Range(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoInt16Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoInt16Range", "object", ("object", range))
    

    @staticmethod
    def echoInt32Range(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoInt32Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoInt32Range", "object", ("object", range))
    

    @staticmethod
    def echoInt64Range(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoInt64Range) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoInt64Range", "object", ("object", range))
    

    @staticmethod
    def echoIntRange(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoIntRange) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoIntRange", "object", ("object", range))
    

    @staticmethod
    def echoFloatRange(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoFloatRange) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoFloatRange", "object", ("object", range))
    

    @staticmethod
    def echoDoubleRange(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoDoubleRange) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoDoubleRange", "object", ("object", range))
    

    @staticmethod
    def echoStringRange(range: typing.Any) -> typing.Any:
        """
        <!-- FishyJoes.export(echoStringRange) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_ClosedRanges_echoStringRange", "object", ("object", range))
    
