from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented
if typing.TYPE_CHECKING: from .TestAsyncFunctions import TestAsyncFunctions

class ExternalWitness_TestAsyncFunctions(NativeReference):
    """
    <!-- FishyJoes.export(TestAsyncFunctions) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
        if native_ref is not None:
            import weakref
            weakref.finalize(self, _get_runtime().release_native_ref, native_ref)
        
    

    @property
    def add3Things(self) -> typing.Callable[[builtins.float, builtins.float, builtins.int], typing.Awaitable[builtins.float]]:
        """
        <!-- FishyJoes.export(add3Things) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestAsyncFunctions_add3Things", "object", ("object", self))
    

    @property
    def const42(self) -> typing.Callable[[], typing.Awaitable[builtins.int]]:
        """
        <!-- FishyJoes.export(const42) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestAsyncFunctions_const42", "object", ("object", self))
    

    @property
    def fifthThing(self) -> typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[builtins.int]]]]:
        """
        <!-- FishyJoes.export(fifthThing) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestAsyncFunctions_fifthThing", "object", ("object", self))
    

    @property
    def iabs(self) -> typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]:
        """
        <!-- FishyJoes.export(iabs) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestAsyncFunctions_iabs", "object", ("object", self))
    

    @property
    def intCompose(self) -> typing.Callable[[typing.Callable[[builtins.int], typing.Awaitable[builtins.int]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]]:
        """
        <!-- FishyJoes.export(intCompose) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestAsyncFunctions_intCompose", "object", ("object", self))
    

    @property
    def makeList(self) -> typing.Callable[[builtins.str, builtins.str, builtins.str, builtins.str], typing.Awaitable[builtins.list[builtins.str]]]:
        """
        <!-- FishyJoes.export(makeList) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestAsyncFunctions_makeList", "object", ("object", self))
    

    @property
    def six(self) -> typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]], builtins.int], typing.Awaitable[builtins.int]]:
        """
        <!-- FishyJoes.export(six) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestAsyncFunctions_six", "object", ("object", self))
    

    @property
    def willThrow(self) -> typing.Callable[[], typing.Awaitable[builtins.int]]:
        """
        <!-- FishyJoes.export(willThrow) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestAsyncFunctions_willThrow", "object", ("object", self))
    

    async def exercise0(self, fn: typing.Callable[[], typing.Awaitable[builtins.int]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise0) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncFunctions_exercise0", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    async def exercise1(self, fn: typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise1) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncFunctions_exercise1", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    async def exercise2(self, fn: typing.Callable[[typing.Callable[[builtins.int], typing.Awaitable[builtins.int]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise2) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncFunctions_exercise2", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    async def exercise3(self, fn: typing.Callable[[builtins.float, builtins.float, builtins.int], typing.Awaitable[builtins.float]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise3) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncFunctions_exercise3", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    async def exercise4(self, fn: typing.Callable[[builtins.str, builtins.str, builtins.str, builtins.str], typing.Awaitable[builtins.list[builtins.str]]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise4) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncFunctions_exercise4", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    async def exercise5(self, fn: typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[builtins.int]]]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise5) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncFunctions_exercise5", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    async def exercise6(self, fn: typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]], builtins.int], typing.Awaitable[builtins.int]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise6) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncFunctions_exercise6", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    def thunkTwiceMaker(self, thunk: typing.Callable[[], typing.Awaitable[None]]) -> typing.Callable[[], typing.Awaitable[None]]:
        """
        <!-- FishyJoes.export(thunkTwiceMaker) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestAsyncFunctions_thunkTwiceMaker", "object", ("object", self), ("object", thunk))
    

    def witness(self) -> TestAsyncFunctions:
        """
        <!-- FishyJoes.export(witness) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestAsyncFunctions_witness", "object", ("object", self))
    
