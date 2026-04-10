from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class MutableStruct:
    """
    <!-- FishyJoes.export(Structs.MutableStruct) -->
    Generated FishyJoes Python value type.
    """
    i: int

    @staticmethod
    def create() -> MutableStruct:
        """
        <!-- FishyJoes.export(create) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Structs_MutableStruct_create", "object")
    

    def increment(self) -> None:
        """
        <!-- FishyJoes.export(increment) -->
        """
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_TestAPI_Structs_MutableStruct_increment", "void", ("object", self))
    

    async def incrementAsync(self) -> typing.Awaitable[None]:
        """
        <!-- FishyJoes.export(incrementAsync) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Structs_MutableStruct_incrementAsync", "object", ("object", self)))
    

    async def asyncGetI(self) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(asyncGetI) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Structs_MutableStruct_asyncGetI", "object", ("object", self)))
    
