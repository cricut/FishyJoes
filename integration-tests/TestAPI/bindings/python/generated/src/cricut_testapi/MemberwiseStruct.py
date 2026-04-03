from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class MemberwiseStruct:
    """
    <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
    Generated FishyJoes Python value type.
    """
    immutable: str
    mutable: str

    @staticmethod
    def create() -> MemberwiseStruct:
        """
        <!-- FishyJoes.export(create) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Structs_MemberwiseStruct_create", "object")
    

    async def asyncGetMutable(self) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(asyncGetMutable) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Structs_MemberwiseStruct_asyncGetMutable")
    
