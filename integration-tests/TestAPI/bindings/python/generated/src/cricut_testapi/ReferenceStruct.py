from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class ReferenceStruct(NativeReference):
    """
    <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
        if native_ref is not None:
            import weakref
            weakref.finalize(self, _get_runtime().release_native_ref, native_ref)
        
    

    @property
    def immutable(self) -> str:
        """
        <!-- FishyJoes.export(immutable) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Structs_ReferenceStruct_immutable", "object", ("object", self))
    

    @property
    def mutable(self) -> str:
        """
        <!-- FishyJoes.export(mutable) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Structs_ReferenceStruct_mutable", "object", ("object", self))
    

    @mutable.setter
    def mutable(self, value: str) -> None:
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_set_TestAPI_Structs_ReferenceStruct_mutable", "void", ("object", self), ("object", value))
    

    @staticmethod
    def create() -> ReferenceStruct:
        """
        <!-- FishyJoes.export(create) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Structs_ReferenceStruct_create", "object")
    

    async def asyncGetMutable(self) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(asyncGetMutable) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().invoke("__iota_TestAPI_Structs_ReferenceStruct_asyncGetMutable", "object", ("object", self)))
    
