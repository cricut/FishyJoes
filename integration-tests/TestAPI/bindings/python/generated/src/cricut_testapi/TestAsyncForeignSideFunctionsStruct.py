from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented
if typing.TYPE_CHECKING: from .TestAsyncFunctions import TestAsyncFunctions

@dataclass(slots=True)
class TestAsyncForeignSideFunctionsStruct:
    """
    <!-- FishyJoes.export(TestAsyncForeignSideFunctionsStruct) -->
    Generated FishyJoes Python value type.
    """
    const42: typing.Callable[[], typing.Awaitable[builtins.int]]
    iabs: typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]
    intCompose: typing.Callable[[typing.Callable[[builtins.int], typing.Awaitable[builtins.int]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]]
    add3Things: typing.Callable[[builtins.float, builtins.float, builtins.int], typing.Awaitable[builtins.float]]
    makeList: typing.Callable[[builtins.str, builtins.str, builtins.str, builtins.str], typing.Awaitable[builtins.list[builtins.str]]]
    fifthThing: typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[builtins.int]]]]
    six: typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]], builtins.int], typing.Awaitable[builtins.int]]
    willThrow: typing.Callable[[], typing.Awaitable[builtins.int]]
    exercise0Fun: typing.Callable[[typing.Callable[[], typing.Awaitable[builtins.int]]], typing.Awaitable[builtins.str]]
    exercise1Fun: typing.Callable[[typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]], typing.Awaitable[builtins.str]]
    exercise2Fun: typing.Callable[[typing.Callable[[typing.Callable[[builtins.int], typing.Awaitable[builtins.int]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]]], typing.Awaitable[builtins.str]]
    exercise3Fun: typing.Callable[[typing.Callable[[builtins.float, builtins.float, builtins.int], typing.Awaitable[builtins.float]]], typing.Awaitable[builtins.str]]
    exercise4Fun: typing.Callable[[typing.Callable[[builtins.str, builtins.str, builtins.str, builtins.str], typing.Awaitable[builtins.list[builtins.str]]]], typing.Awaitable[builtins.str]]
    exercise5Fun: typing.Callable[[typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[builtins.int]]]]], typing.Awaitable[builtins.str]]
    exercise6Fun: typing.Callable[[typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]], builtins.int], typing.Awaitable[builtins.int]]], typing.Awaitable[builtins.str]]
    thunkTwiceMakerFun: typing.Callable[[typing.Callable[[], typing.Awaitable[None]]], typing.Callable[[], typing.Awaitable[None]]]

    async def exercise0(self, fn: typing.Callable[[], typing.Awaitable[builtins.int]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise0) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    async def exercise1(self, fn: typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise1) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    async def exercise2(self, fn: typing.Callable[[typing.Callable[[builtins.int], typing.Awaitable[builtins.int]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise2) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    async def exercise3(self, fn: typing.Callable[[builtins.float, builtins.float, builtins.int], typing.Awaitable[builtins.float]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise3) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    async def exercise4(self, fn: typing.Callable[[builtins.str, builtins.str, builtins.str, builtins.str], typing.Awaitable[builtins.list[builtins.str]]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise4) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    async def exercise5(self, fn: typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[builtins.int]]]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise5) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    async def exercise6(self, fn: typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]], builtins.int], typing.Awaitable[builtins.int]]) -> builtins.str:
        """
        <!-- FishyJoes.export(exercise6) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    

    def thunkTwiceMaker(self, thunk: typing.Callable[[], typing.Awaitable[None]]) -> typing.Callable[[], typing.Awaitable[None]]:
        """
        <!-- FishyJoes.export(thunkTwiceMaker) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker", "object", ("object", self), ("object", thunk))
    

    def witness(self) -> TestAsyncFunctions:
        """
        <!-- FishyJoes.export(witness) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness", "object", ("object", self))
    

    async def defaultExercise6(self, fn: typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]], builtins.int], typing.Awaitable[builtins.int]]) -> builtins.str:
        """
        <!-- FishyJoes.export(defaultExercise6) -->
        """
        _ensure_runtime_loaded()
        result = _get_runtime().call_symbol("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_defaultExercise6", "object", ("object", self), ("object", fn))
        return await typing.cast(typing.Awaitable[typing.Any], result)
    
