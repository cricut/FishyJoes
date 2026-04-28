from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class Tuples:
    """
    <!-- FishyJoes.export(Tuples) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def tuple2() -> builtins.tuple[builtins.int, builtins.str]:
        """
        <!-- FishyJoes.export(tuple2) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Tuples_tuple2", "object")
    

    @staticmethod
    def tuple3() -> builtins.tuple[builtins.str, builtins.float, builtins.str]:
        """
        <!-- FishyJoes.export(tuple3) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Tuples_tuple3", "object")
    

    @staticmethod
    def tuple4() -> builtins.tuple[builtins.tuple[builtins.int, builtins.str], builtins.tuple[builtins.str, builtins.float, builtins.str], builtins.str, builtins.bool]:
        """
        <!-- FishyJoes.export(tuple4) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Tuples_tuple4", "object")
    

    @staticmethod
    def tuple5() -> builtins.tuple[builtins.str, builtins.int, builtins.tuple[builtins.tuple[builtins.int, builtins.str], builtins.tuple[builtins.str, builtins.float, builtins.str], builtins.str, builtins.bool], builtins.tuple[builtins.str, builtins.float, builtins.str], builtins.tuple[builtins.int, builtins.str]]:
        """
        <!-- FishyJoes.export(tuple5) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Tuples_tuple5", "object")
    

    @staticmethod
    def tuple6() -> builtins.tuple[builtins.str, builtins.int, builtins.float, builtins.tuple[builtins.tuple[builtins.int, builtins.str], builtins.tuple[builtins.str, builtins.float, builtins.str], builtins.str, builtins.bool], builtins.tuple[builtins.str, builtins.int, builtins.tuple[builtins.tuple[builtins.int, builtins.str], builtins.tuple[builtins.str, builtins.float, builtins.str], builtins.str, builtins.bool], builtins.tuple[builtins.str, builtins.float, builtins.str], builtins.tuple[builtins.int, builtins.str]], builtins.bool]:
        """
        <!-- FishyJoes.export(tuple6) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Tuples_tuple6", "object")
    

    @staticmethod
    def checkTuples(t2: builtins.tuple[builtins.int, builtins.str], t3: builtins.tuple[builtins.str, builtins.float, builtins.str], t4: builtins.tuple[builtins.tuple[builtins.int, builtins.str], builtins.tuple[builtins.str, builtins.float, builtins.str], builtins.str, builtins.bool], t5: builtins.tuple[builtins.str, builtins.int, builtins.tuple[builtins.tuple[builtins.int, builtins.str], builtins.tuple[builtins.str, builtins.float, builtins.str], builtins.str, builtins.bool], builtins.tuple[builtins.str, builtins.float, builtins.str], builtins.tuple[builtins.int, builtins.str]], t6: builtins.tuple[builtins.str, builtins.int, builtins.float, builtins.tuple[builtins.tuple[builtins.int, builtins.str], builtins.tuple[builtins.str, builtins.float, builtins.str], builtins.str, builtins.bool], builtins.tuple[builtins.str, builtins.int, builtins.tuple[builtins.tuple[builtins.int, builtins.str], builtins.tuple[builtins.str, builtins.float, builtins.str], builtins.str, builtins.bool], builtins.tuple[builtins.str, builtins.float, builtins.str], builtins.tuple[builtins.int, builtins.str]], builtins.bool]) -> builtins.bool:
        """
        <!-- FishyJoes.export(checkTuples) -->
        """
        _ensure_runtime_loaded()
        return bool(_get_runtime().call_symbol("__iota_TestAPI_Tuples_checkTuples", "bool", ("object", t2), ("object", t3), ("object", t4), ("object", t5), ("object", t6)))
    
