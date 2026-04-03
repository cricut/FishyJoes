from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class TestAsyncSwiftSideFunctionsClass(NativeReference):
    """
    <!-- FishyJoes.export(TestAsyncSwiftSideFunctionsClass) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
    

    @property
    def add3Things(self) -> typing.Callable[[int, int, int], typing.Awaitable[int]]:
        """
        <!-- FishyJoes.export(add3Things) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_add3Things", "object", ("object", self))
    

    @property
    def const42(self) -> typing.Callable[[], typing.Awaitable[int]]:
        """
        <!-- FishyJoes.export(const42) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_const42", "object", ("object", self))
    

    @property
    def fifthThing(self) -> typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]:
        """
        <!-- FishyJoes.export(fifthThing) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_fifthThing", "object", ("object", self))
    

    @property
    def iabs(self) -> typing.Callable[[int], typing.Awaitable[int]]:
        """
        <!-- FishyJoes.export(iabs) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_iabs", "object", ("object", self))
    

    @property
    def intCompose(self) -> typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]:
        """
        <!-- FishyJoes.export(intCompose) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_intCompose", "object", ("object", self))
    

    @property
    def makeList(self) -> typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]:
        """
        <!-- FishyJoes.export(makeList) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_makeList", "object", ("object", self))
    

    @property
    def six(self) -> typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]:
        """
        <!-- FishyJoes.export(six) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_six", "object", ("object", self))
    

    @property
    def willThrow(self) -> typing.Callable[[], typing.Awaitable[int]]:
        """
        <!-- FishyJoes.export(willThrow) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_willThrow", "object", ("object", self))
    

    async def exercise0(self, fn: typing.Callable[[], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise0) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_TestAsyncSwiftSideFunctionsClass_exercise0")
    

    async def exercise1(self, fn: typing.Callable[[int], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise1) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_TestAsyncSwiftSideFunctionsClass_exercise1")
    

    async def exercise2(self, fn: typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise2) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_TestAsyncSwiftSideFunctionsClass_exercise2")
    

    async def exercise3(self, fn: typing.Callable[[int, int, int], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise3) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_TestAsyncSwiftSideFunctionsClass_exercise3")
    

    async def exercise4(self, fn: typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise4) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_TestAsyncSwiftSideFunctionsClass_exercise4")
    

    async def exercise5(self, fn: typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise5) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_TestAsyncSwiftSideFunctionsClass_exercise5")
    

    async def exercise6(self, fn: typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(exercise6) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_TestAsyncSwiftSideFunctionsClass_exercise6")
    

    def thunkTwiceMaker(self, thunk: typing.Callable[[], typing.Awaitable[None]]) -> typing.Callable[[], typing.Awaitable[None]]:
        """
        <!-- FishyJoes.export(thunkTwiceMaker) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_thunkTwiceMaker", "object", ("object", self), ("object", thunk))
    

    def witness(self) -> TestAsyncFunctions:
        """
        <!-- FishyJoes.export(witness) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_witness", "object", ("object", self))
    

    @staticmethod
    def init() -> TestAsyncSwiftSideFunctionsClass:
        """
        <!-- FishyJoes.export(init) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_init", "object")
    

    async def defaultExercise6(self, fn: typing.Callable[[str, int, int, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(defaultExercise6) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_TestAsyncSwiftSideFunctionsClass_defaultExercise6")
    
