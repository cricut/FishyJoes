from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class TestAsyncFunctions(typing.Protocol):
    """
    <!-- FishyJoes.export(TestAsyncFunctions) -->
    Generated FishyJoes Python protocol surface.
    """
    @property
    def add3Things(self) -> typing.Callable[[builtins.float, builtins.float, builtins.int], typing.Awaitable[builtins.float]]:
        """
        <!-- FishyJoes.export(add3Things) -->
        """
        ...
    

    @property
    def const42(self) -> typing.Callable[[], typing.Awaitable[builtins.int]]:
        """
        <!-- FishyJoes.export(const42) -->
        """
        ...
    

    @property
    def fifthThing(self) -> typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[builtins.int]]]]:
        """
        <!-- FishyJoes.export(fifthThing) -->
        """
        ...
    

    @property
    def iabs(self) -> typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]:
        """
        <!-- FishyJoes.export(iabs) -->
        """
        ...
    

    @property
    def intCompose(self) -> typing.Callable[[typing.Callable[[builtins.int], typing.Awaitable[builtins.int]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]]:
        """
        <!-- FishyJoes.export(intCompose) -->
        """
        ...
    

    @property
    def makeList(self) -> typing.Callable[[builtins.str, builtins.str, builtins.str, builtins.str], typing.Awaitable[builtins.list[builtins.str]]]:
        """
        <!-- FishyJoes.export(makeList) -->
        """
        ...
    

    @property
    def six(self) -> typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]], builtins.int], typing.Awaitable[builtins.int]]:
        """
        <!-- FishyJoes.export(six) -->
        """
        ...
    

    @property
    def willThrow(self) -> typing.Callable[[], typing.Awaitable[builtins.int]]:
        """
        <!-- FishyJoes.export(willThrow) -->
        """
        ...
    

    async def exercise0(self, fn: typing.Callable[[], typing.Awaitable[builtins.int]]) -> typing.Awaitable[builtins.str]:
        """
        <!-- FishyJoes.export(exercise0) -->
        """
        ...
    

    async def exercise1(self, fn: typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]) -> typing.Awaitable[builtins.str]:
        """
        <!-- FishyJoes.export(exercise1) -->
        """
        ...
    

    async def exercise2(self, fn: typing.Callable[[typing.Callable[[builtins.int], typing.Awaitable[builtins.int]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]], typing.Callable[[builtins.int], typing.Awaitable[builtins.int]]]) -> typing.Awaitable[builtins.str]:
        """
        <!-- FishyJoes.export(exercise2) -->
        """
        ...
    

    async def exercise3(self, fn: typing.Callable[[builtins.float, builtins.float, builtins.int], typing.Awaitable[builtins.float]]) -> typing.Awaitable[builtins.str]:
        """
        <!-- FishyJoes.export(exercise3) -->
        """
        ...
    

    async def exercise4(self, fn: typing.Callable[[builtins.str, builtins.str, builtins.str, builtins.str], typing.Awaitable[builtins.list[builtins.str]]]) -> typing.Awaitable[builtins.str]:
        """
        <!-- FishyJoes.export(exercise4) -->
        """
        ...
    

    async def exercise5(self, fn: typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[builtins.int]]]]) -> typing.Awaitable[builtins.str]:
        """
        <!-- FishyJoes.export(exercise5) -->
        """
        ...
    

    async def exercise6(self, fn: typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]], builtins.int], typing.Awaitable[builtins.int]]) -> typing.Awaitable[builtins.str]:
        """
        <!-- FishyJoes.export(exercise6) -->
        """
        ...
    

    def thunkTwiceMaker(self, thunk: typing.Callable[[], typing.Awaitable[None]]) -> typing.Callable[[], typing.Awaitable[None]]:
        """
        <!-- FishyJoes.export(thunkTwiceMaker) -->
        """
        ...
    

    async def defaultExercise6(self, fn: typing.Callable[[builtins.str, builtins.int, builtins.float, builtins.str, typing.Callable[[], typing.Awaitable[builtins.int]], builtins.int], typing.Awaitable[builtins.int]]) -> typing.Awaitable[builtins.str]:
        """
        <!-- FishyJoes.export(defaultExercise6) -->
        """
        ...
    

    def witness(self) -> TestAsyncFunctions:
        """
        <!-- FishyJoes.export(witness) -->
        """
        ...
    
