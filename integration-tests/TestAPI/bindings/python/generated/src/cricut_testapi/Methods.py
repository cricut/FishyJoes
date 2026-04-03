from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class Methods(NativeReference):
    """
    <!-- FishyJoes.exportReference(Methods) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
    

    @property
    def garply(self) -> int:
        """
        <!-- FishyJoes.export(garply) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Methods_garply", "object", ("object", self))
    

    @property
    def instanceGet(self) -> int:
        """
        <!-- FishyJoes.export(instanceGet) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Methods_instanceGet", "object", ("object", self))
    

    def get_instanceGetMethod(self) -> int:
        """
        <!-- FishyJoes.exportAsMethod(instanceGetMethod) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Methods_instanceGetMethod", "object", ("object", self))
    

    @property
    def instanceModifiable(self) -> int:
        """
        <!-- FishyJoes.export(instanceModifiable) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Methods_instanceModifiable", "object", ("object", self))
    

    @instanceModifiable.setter
    def instanceModifiable(self, value: int) -> None:
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_set_TestAPI_Methods_instanceModifiable", "void", ("object", self), ("object", value))
    

    @property
    def instanceStored(self) -> int:
        """
        <!-- FishyJoes.export(instanceStored) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Methods_instanceStored", "object", ("object", self))
    

    @instanceStored.setter
    def instanceStored(self, value: int) -> None:
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_set_TestAPI_Methods_instanceStored", "void", ("object", self), ("object", value))
    

    @staticmethod
    def staticGet() -> int:
        """
        <!-- FishyJoes.export(staticGet) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Methods_staticGet", "object")
    

    @staticmethod
    def get_staticGetMethod() -> int:
        """
        <!-- FishyJoes.exportAsMethod(staticGetMethod) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Methods_staticGetMethod", "object")
    

    @staticmethod
    def staticModifiable() -> int:
        """
        <!-- FishyJoes.export(staticModifiable) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Methods_staticModifiable", "object")
    

    @staticmethod
    def set_staticModifiable(value: int) -> None:
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_set_TestAPI_Methods_staticModifiable", "void", ("object", value))
    

    @staticmethod
    def staticStored() -> int:
        """
        <!-- FishyJoes.export(staticStored) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Methods_staticStored", "object")
    

    @staticmethod
    def set_staticStored(value: int) -> None:
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_set_TestAPI_Methods_staticStored", "void", ("object", value))
    

    @staticmethod
    def create() -> Methods:
        """
        <!-- FishyJoes.export(create) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Methods_create", "object")
    

    def doublePlusGood(self, a: int, b: int) -> int:
        """
        <!-- FishyJoes.export(doublePlusGood) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Methods_doublePlusGood", "object", ("object", self), ("object", a), ("object", b))
    

    async def async42(self) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(async42) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_async42")
    

    async def asyncYield(self) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(asyncYield) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_asyncYield")
    

    async def asyncSleep(self) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(asyncSleep) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_asyncSleep")
    

    async def asyncVoid(self) -> typing.Awaitable[None]:
        """
        <!-- FishyJoes.export(asyncVoid) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_asyncVoid")
    

    async def asyncDouble(self, d: int) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(asyncDouble) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_asyncDouble")
    

    async def asyncMultipleArgs(self, i: int, j: typing.Callable[[], typing.Awaitable[int]]) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(asyncMultipleArgs) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_asyncMultipleArgs")
    

    async def asyncThrowing(self) -> typing.Awaitable[None]:
        """
        <!-- FishyJoes.export(asyncThrowing) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_asyncThrowing")
    

    async def asyncCallbackFunc0(self, callback: typing.Callable[[], typing.Awaitable[int]]) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(asyncCallbackFunc0) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_asyncCallbackFunc0")
    

    @staticmethod
    async def staticAsync42() -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(staticAsync42) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_staticAsync42")
    

    @staticmethod
    async def staticAsyncYield() -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(staticAsyncYield) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_staticAsyncYield")
    

    @staticmethod
    async def staticAsyncSleep() -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(staticAsyncSleep) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_staticAsyncSleep")
    

    @staticmethod
    async def staticAsyncVoid() -> typing.Awaitable[None]:
        """
        <!-- FishyJoes.export(staticAsyncVoid) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_staticAsyncVoid")
    

    @staticmethod
    async def staticAsyncDouble(d: int) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(staticAsyncDouble) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_staticAsyncDouble")
    

    @staticmethod
    async def staticAsyncMultipleArgs(i: int, j: typing.Callable[[], typing.Awaitable[int]]) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(staticAsyncMultipleArgs) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_staticAsyncMultipleArgs")
    

    @staticmethod
    async def staticAsyncThrowing() -> typing.Awaitable[None]:
        """
        <!-- FishyJoes.export(staticAsyncThrowing) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_staticAsyncThrowing")
    

    @staticmethod
    async def staticAsyncCallbackFunc0(callback: typing.Callable[[], typing.Awaitable[int]]) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(staticAsyncCallbackFunc0) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Methods_staticAsyncCallbackFunc0")
    

    @staticmethod
    def methodWithNewlinesInTypes(thing: typing.Callable[[int, bytes, int], typing.Awaitable[typing.Any]]) -> None:
        """
        <!-- FishyJoes.export(methodWithNewlinesInTypes) -->
        """
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_TestAPI_Methods_methodWithNewlinesInTypes", "void", ("object", thing))
    
