from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class TemperatureLogger(NativeReference):
    """
    <!-- FishyJoes.export(Actors.TemperatureLogger) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
        if native_ref is not None:
            import weakref
            weakref.finalize(self, _get_runtime().release_native_ref, native_ref)
        
    

    @property
    def backwardsLabel(self) -> str:
        """
        <!-- FishyJoes.export(backwardsLabel) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Actors_TemperatureLogger_backwardsLabel", "object", ("object", self))
    

    @property
    def extensionNonisolatedVarLabel(self) -> str:
        """
        <!-- FishyJoes.export(extensionNonisolatedVarLabel) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Actors_TemperatureLogger_extensionNonisolatedVarLabel", "object", ("object", self))
    

    @property
    def label(self) -> str:
        """
        <!-- FishyJoes.export(label) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Actors_TemperatureLogger_label", "object", ("object", self))
    

    @staticmethod
    def create(label: str, measurement: int) -> TemperatureLogger:
        """
        <!-- FishyJoes.export(create) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Actors_TemperatureLogger_create", "object", ("object", label), ("int", measurement))
    

    async def update(self, measurement: int) -> typing.Awaitable[None]:
        """
        <!-- FishyJoes.export(update) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Actors_TemperatureLogger_update", "object", ("object", self), ("int", measurement)))
    

    async def min(self) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(min) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Actors_TemperatureLogger_min", "object", ("object", self)))
    

    async def extensionIsolatedGetLabel(self) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(extensionIsolatedGetLabel) -->
        """
        _ensure_runtime_loaded()
        import asyncio
        return await asyncio.to_thread(lambda: _get_runtime().call_symbol("__iota_TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel", "object", ("object", self)))
    

    def extensionNonisolatedGetLabel(self) -> str:
        """
        <!-- FishyJoes.export(extensionNonisolatedGetLabel) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Actors_TemperatureLogger_extensionNonisolatedGetLabel", "object", ("object", self))
    
