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
        if native_ref is not None:
            import weakref
            weakref.finalize(self, _get_runtime().release_native_ref, native_ref)
        
    

    @property
    def garply(self) -> int:
        """
        <!-- FishyJoes.export(garply) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Methods_garply", "int", ("object", self))
    

    @property
    def instanceGet(self) -> int:
        """
        <!-- FishyJoes.export(instanceGet) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Methods_instanceGet", "int", ("object", self))
    

    def get_instanceGetMethod(self) -> int:
        """
        <!-- FishyJoes.exportAsMethod(instanceGetMethod) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Methods_instanceGetMethod", "int", ("object", self))
    

    @property
    def instanceModifiable(self) -> int:
        """
        <!-- FishyJoes.export(instanceModifiable) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Methods_instanceModifiable", "int", ("object", self))
    

    @instanceModifiable.setter
    def instanceModifiable(self, value: int) -> None:
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_set_TestAPI_Methods_instanceModifiable", "void", ("object", self), ("int", value))
    

    @property
    def instanceStored(self) -> int:
        """
        <!-- FishyJoes.export(instanceStored) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Methods_instanceStored", "int", ("object", self))
    

    @instanceStored.setter
    def instanceStored(self, value: int) -> None:
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_set_TestAPI_Methods_instanceStored", "void", ("object", self), ("int", value))
    

    @staticmethod
    def staticGet() -> int:
        """
        <!-- FishyJoes.export(staticGet) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Methods_staticGet", "int")
    

    @staticmethod
    def get_staticGetMethod() -> int:
        """
        <!-- FishyJoes.exportAsMethod(staticGetMethod) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Methods_staticGetMethod", "int")
    

    @staticmethod
    def staticModifiable() -> int:
        """
        <!-- FishyJoes.export(staticModifiable) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Methods_staticModifiable", "int")
    

    @staticmethod
    def set_staticModifiable(value: int) -> None:
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_set_TestAPI_Methods_staticModifiable", "void", ("int", value))
    

    @staticmethod
    def staticStored() -> int:
        """
        <!-- FishyJoes.export(staticStored) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Methods_staticStored", "int")
    

    @staticmethod
    def set_staticStored(value: int) -> None:
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_set_TestAPI_Methods_staticStored", "void", ("int", value))
    

    @staticmethod
    def create() -> Methods:
        """
        <!-- FishyJoes.export(create) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Methods_create", "object")
    

    def doublePlusGood(self, a: int, b: float) -> int:
        """
        <!-- FishyJoes.export(doublePlusGood) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Methods_doublePlusGood", "int", ("object", self), ("int", a), ("double", b))
    

    async def async42(self) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(async42) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_async42", "object", ("object", self)))
    

    async def asyncYield(self) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(asyncYield) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_asyncYield", "object", ("object", self)))
    

    async def asyncSleep(self) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(asyncSleep) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_asyncSleep", "object", ("object", self)))
    

    async def asyncVoid(self) -> typing.Awaitable[None]:
        """
        <!-- FishyJoes.export(asyncVoid) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_asyncVoid", "object", ("object", self)))
    

    async def asyncDouble(self, d: float) -> typing.Awaitable[float]:
        """
        <!-- FishyJoes.export(asyncDouble) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_asyncDouble", "object", ("object", self), ("double", d)))
    

    async def asyncMultipleArgs(self, i: int, j: typing.Callable[[], typing.Awaitable[int]]) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(asyncMultipleArgs) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_asyncMultipleArgs", "object", ("object", self), ("int", i), ("object", j)))
    

    async def asyncThrowing(self) -> typing.Awaitable[None]:
        """
        <!-- FishyJoes.export(asyncThrowing) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_asyncThrowing", "object", ("object", self)))
    

    async def asyncCallbackFunc0(self, callback: typing.Callable[[], typing.Awaitable[int]]) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(asyncCallbackFunc0) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_asyncCallbackFunc0", "object", ("object", self), ("object", callback)))
    

    @staticmethod
    async def staticAsync42() -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(staticAsync42) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_staticAsync42", "object"))
    

    @staticmethod
    async def staticAsyncYield() -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(staticAsyncYield) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_staticAsyncYield", "object"))
    

    @staticmethod
    async def staticAsyncSleep() -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(staticAsyncSleep) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_staticAsyncSleep", "object"))
    

    @staticmethod
    async def staticAsyncVoid() -> typing.Awaitable[None]:
        """
        <!-- FishyJoes.export(staticAsyncVoid) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_staticAsyncVoid", "object"))
    

    @staticmethod
    async def staticAsyncDouble(d: float) -> typing.Awaitable[float]:
        """
        <!-- FishyJoes.export(staticAsyncDouble) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_staticAsyncDouble", "object", ("double", d)))
    

    @staticmethod
    async def staticAsyncMultipleArgs(i: int, j: typing.Callable[[], typing.Awaitable[int]]) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(staticAsyncMultipleArgs) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_staticAsyncMultipleArgs", "object", ("int", i), ("object", j)))
    

    @staticmethod
    async def staticAsyncThrowing() -> typing.Awaitable[None]:
        """
        <!-- FishyJoes.export(staticAsyncThrowing) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_staticAsyncThrowing", "object"))
    

    @staticmethod
    async def staticAsyncCallbackFunc0(callback: typing.Callable[[], typing.Awaitable[int]]) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(staticAsyncCallbackFunc0) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Methods_staticAsyncCallbackFunc0", "object", ("object", callback)))
    

    @staticmethod
    def methodWithNewlinesInTypes(thing: typing.Callable[[int, bytes, bool], typing.Awaitable[typing.Any]]) -> None:
        """
        <!-- FishyJoes.export(methodWithNewlinesInTypes) -->
        """
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_TestAPI_Methods_methodWithNewlinesInTypes", "void", ("object", thing))
    

_cls_TestAPI_Methods_setup = Methods
