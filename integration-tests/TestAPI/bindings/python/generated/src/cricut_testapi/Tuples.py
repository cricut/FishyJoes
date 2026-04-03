from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class Tuples:
    """
    <!-- FishyJoes.export(Tuples) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def tuple2() -> tuple[int, str]:
        """
        <!-- FishyJoes.export(tuple2) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Tuples_tuple2", "object")
    

    @staticmethod
    def tuple3() -> tuple[str, int, str]:
        """
        <!-- FishyJoes.export(tuple3) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Tuples_tuple3", "object")
    

    @staticmethod
    def tuple4() -> tuple[tuple[int, str], tuple[str, int, str], str, int]:
        """
        <!-- FishyJoes.export(tuple4) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Tuples_tuple4", "object")
    

    @staticmethod
    def tuple5() -> tuple[str, int, tuple[tuple[int, str], tuple[str, int, str], str, int], tuple[str, int, str], tuple[int, str]]:
        """
        <!-- FishyJoes.export(tuple5) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Tuples_tuple5", "object")
    

    @staticmethod
    def tuple6() -> tuple[str, int, int, tuple[tuple[int, str], tuple[str, int, str], str, int], tuple[str, int, tuple[tuple[int, str], tuple[str, int, str], str, int], tuple[str, int, str], tuple[int, str]], int]:
        """
        <!-- FishyJoes.export(tuple6) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Tuples_tuple6", "object")
    

    @staticmethod
    def checkTuples(t2: tuple[int, str], t3: tuple[str, int, str], t4: tuple[tuple[int, str], tuple[str, int, str], str, int], t5: tuple[str, int, tuple[tuple[int, str], tuple[str, int, str], str, int], tuple[str, int, str], tuple[int, str]], t6: tuple[str, int, int, tuple[tuple[int, str], tuple[str, int, str], str, int], tuple[str, int, tuple[tuple[int, str], tuple[str, int, str], str, int], tuple[str, int, str], tuple[int, str]], int]) -> int:
        """
        <!-- FishyJoes.export(checkTuples) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Tuples_checkTuples", "object", ("object", t2), ("object", t3), ("object", t4), ("object", t5), ("object", t6))
    
