from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class TestAsyncForeignSideFunctionsStruct:
    """
    <!-- FishyJoes.export(TestAsyncForeignSideFunctionsStruct) -->
    Generated FishyJoes Python value type.
    """
    const42: typing.Callable[[], typing.Awaitable[int]]
    iabs: typing.Callable[[int], typing.Awaitable[int]]
    intCompose: typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]
    add3Things: typing.Callable[[int, int, int], typing.Awaitable[int]]
    makeList: typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]
    fifthThing: typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]
    six: typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]
    willThrow: typing.Callable[[], typing.Awaitable[int]]
    exercise0Fun: typing.Callable[[typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[str]]
    exercise1Fun: typing.Callable[[typing.Callable[[int], typing.Awaitable[int]]], typing.Awaitable[str]]
    exercise2Fun: typing.Callable[[typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]], typing.Awaitable[str]]
    exercise3Fun: typing.Callable[[typing.Callable[[int, int, int], typing.Awaitable[int]]], typing.Awaitable[str]]
    exercise4Fun: typing.Callable[[typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]], typing.Awaitable[str]]
    exercise5Fun: typing.Callable[[typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]], typing.Awaitable[str]]
    exercise6Fun: typing.Callable[[typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]], typing.Awaitable[str]]
    thunkTwiceMakerFun: typing.Callable[[typing.Callable[[], typing.Awaitable[None]]], typing.Callable[[], typing.Awaitable[None]]]

    async def exercise0(self, fn: typing.Callable[[], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise0) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0", "object", ("object", self), ("object", fn)))
    

    async def exercise1(self, fn: typing.Callable[[int], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise1) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1", "object", ("object", self), ("object", fn)))
    

    async def exercise2(self, fn: typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise2) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2", "object", ("object", self), ("object", fn)))
    

    async def exercise3(self, fn: typing.Callable[[int, int, int], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise3) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3", "object", ("object", self), ("object", fn)))
    

    async def exercise4(self, fn: typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise4) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4", "object", ("object", self), ("object", fn)))
    

    async def exercise5(self, fn: typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise5) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5", "object", ("object", self), ("object", fn)))
    

    async def exercise6(self, fn: typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise6) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6", "object", ("object", self), ("object", fn)))
    

    def thunkTwiceMaker(self, thunk: typing.Callable[[], typing.Awaitable[None]]) -> typing.Callable[[], typing.Awaitable[None]]:
        """
        <!-- FishyJoes.export(thunkTwiceMaker) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker", "object", ("object", self), ("object", thunk))
    

    def witness(self) -> TestAsyncFunctions:
        """
        <!-- FishyJoes.export(witness) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness", "object", ("object", self))
    

    async def defaultExercise6(self, fn: typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(defaultExercise6) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_defaultExercise6", "object", ("object", self), ("object", fn)))
    
