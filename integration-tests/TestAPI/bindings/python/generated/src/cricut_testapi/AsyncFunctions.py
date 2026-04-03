from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class AsyncFunctions:
    """
    <!-- FishyJoes.export(AsyncFunctions) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def add3Things() -> typing.Callable[[int, int, int], typing.Awaitable[int]]:
        """
        <!-- FishyJoes.export(add3Things) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_AsyncFunctions_add3Things", "object")
    

    @staticmethod
    def const42() -> typing.Callable[[], typing.Awaitable[int]]:
        """
        <!-- FishyJoes.export(const42) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_AsyncFunctions_const42", "object")
    

    @staticmethod
    def fifthThing() -> typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]:
        """
        <!-- FishyJoes.export(fifthThing) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_AsyncFunctions_fifthThing", "object")
    

    @staticmethod
    def abs() -> typing.Callable[[int], typing.Awaitable[int]]:
        """
        <!-- FishyJoes.export(abs) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_AsyncFunctions_abs", "object")
    

    @staticmethod
    def intCompose() -> typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]:
        """
        <!-- FishyJoes.export(intCompose) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_AsyncFunctions_intCompose", "object")
    

    @staticmethod
    def makeList() -> typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]:
        """
        <!-- FishyJoes.export(makeList) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_AsyncFunctions_makeList", "object")
    

    @staticmethod
    def sixthThing() -> typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]:
        """
        <!-- FishyJoes.export(sixthThing) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_AsyncFunctions_sixthThing", "object")
    

    @staticmethod
    def willThrow() -> typing.Callable[[], typing.Awaitable[int]]:
        """
        <!-- FishyJoes.export(willThrow) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_AsyncFunctions_willThrow", "object")
    

    @staticmethod
    async def exercise0(fn: typing.Callable[[], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise0) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_AsyncFunctions_exercise0", "object", ("object", fn)))
    

    @staticmethod
    async def exercise1(fn: typing.Callable[[int], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise1) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_AsyncFunctions_exercise1", "object", ("object", fn)))
    

    @staticmethod
    async def exercise2(fn: typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise2) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_AsyncFunctions_exercise2", "object", ("object", fn)))
    

    @staticmethod
    async def exercise3(fn: typing.Callable[[int, int, int], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise3) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_AsyncFunctions_exercise3", "object", ("object", fn)))
    

    @staticmethod
    async def exercise4(fn: typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise4) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_AsyncFunctions_exercise4", "object", ("object", fn)))
    

    @staticmethod
    async def exercise5(fn: typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise5) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_AsyncFunctions_exercise5", "object", ("object", fn)))
    

    @staticmethod
    async def exercise6(fn: typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise6) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_AsyncFunctions_exercise6", "object", ("object", fn)))
    

    @staticmethod
    def thunkTwiceMaker(thunk: typing.Callable[[], typing.Awaitable[None]]) -> typing.Callable[[], typing.Awaitable[None]]:
        """
        <!-- FishyJoes.export(thunkTwiceMaker) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_AsyncFunctions_thunkTwiceMaker", "object", ("object", thunk))
    
