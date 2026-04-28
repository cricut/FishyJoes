from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class Functions:
    """
    <!-- FishyJoes.export(Functions) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def add3Things() -> typing.Callable[[builtins.float, builtins.float, builtins.int], builtins.float]:
        """
        <!-- FishyJoes.export(add3Things) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Functions_add3Things", "object")
    

    @staticmethod
    def const42() -> typing.Callable[[], builtins.int]:
        """
        <!-- FishyJoes.export(const42) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Functions_const42", "object")
    

    @staticmethod
    def fifthThing() -> typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], builtins.int]], typing.Callable[[], builtins.int]]:
        """
        <!-- FishyJoes.export(fifthThing) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Functions_fifthThing", "object")
    

    @staticmethod
    def abs() -> typing.Callable[[builtins.int], builtins.int]:
        """
        <!-- FishyJoes.export(abs) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Functions_abs", "object")
    

    @staticmethod
    def intCompose() -> typing.Callable[[typing.Callable[[builtins.int], builtins.int], typing.Callable[[builtins.int], builtins.int]], typing.Callable[[builtins.int], builtins.int]]:
        """
        <!-- FishyJoes.export(intCompose) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Functions_intCompose", "object")
    

    @staticmethod
    def makeList() -> typing.Callable[[builtins.str, builtins.str, builtins.str, builtins.str], builtins.list[builtins.str]]:
        """
        <!-- FishyJoes.export(makeList) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Functions_makeList", "object")
    

    @staticmethod
    def sixthThing() -> typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], builtins.int], builtins.int], builtins.int]:
        """
        <!-- FishyJoes.export(sixthThing) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Functions_sixthThing", "object")
    

    @staticmethod
    def exercise0(fn: typing.Callable[[], builtins.int]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise0) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Functions_exercise0", "object", ("object", fn))
    

    @staticmethod
    def exercise1(fn: typing.Callable[[builtins.int], builtins.int]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise1) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Functions_exercise1", "object", ("object", fn))
    

    @staticmethod
    def exercise2(fn: typing.Callable[[typing.Callable[[builtins.int], builtins.int], typing.Callable[[builtins.int], builtins.int]], typing.Callable[[builtins.int], builtins.int]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise2) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Functions_exercise2", "object", ("object", fn))
    

    @staticmethod
    def exercise3(fn: typing.Callable[[builtins.float, builtins.float, builtins.int], builtins.float]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise3) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Functions_exercise3", "object", ("object", fn))
    

    @staticmethod
    def exercise4(fn: typing.Callable[[builtins.str, builtins.str, builtins.str, builtins.str], builtins.list[builtins.str]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise4) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Functions_exercise4", "object", ("object", fn))
    

    @staticmethod
    def exercise5(fn: typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], builtins.int]], typing.Callable[[], builtins.int]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise5) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Functions_exercise5", "object", ("object", fn))
    

    @staticmethod
    def exercise6(fn: typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], builtins.int], builtins.int], builtins.int]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise6) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Functions_exercise6", "object", ("object", fn))
    

    @staticmethod
    def willThrow() -> builtins.str:
        """
        <!-- FishyJoes.export(willThrow) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Functions_willThrow", "object")
    

    @staticmethod
    def thunkTwiceMaker(thunk: typing.Callable[[], None]) -> typing.Callable[[], None]:
        """
        <!-- FishyJoes.export(thunkTwiceMaker) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Functions_thunkTwiceMaker", "object", ("object", thunk))
    
