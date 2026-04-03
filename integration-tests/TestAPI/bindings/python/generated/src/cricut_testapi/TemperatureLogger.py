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
    

    @property
    def backwardsLabel(self) -> str:
        """
        <!-- FishyJoes.export(backwardsLabel) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Actors_TemperatureLogger_backwardsLabel", "object", ("object", self))
    

    @property
    def extensionNonisolatedVarLabel(self) -> str:
        """
        <!-- FishyJoes.export(extensionNonisolatedVarLabel) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Actors_TemperatureLogger_extensionNonisolatedVarLabel", "object", ("object", self))
    

    @property
    def label(self) -> str:
        """
        <!-- FishyJoes.export(label) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Actors_TemperatureLogger_label", "object", ("object", self))
    

    @staticmethod
    def create(label: str, measurement: int) -> TemperatureLogger:
        """
        <!-- FishyJoes.export(create) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Actors_TemperatureLogger_create", "object", ("object", label), ("object", measurement))
    

    async def update(self, measurement: int) -> typing.Awaitable[None]:
        """
        <!-- FishyJoes.export(update) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Actors_TemperatureLogger_update")
    

    async def min(self) -> typing.Awaitable[int]:
        """
        <!-- FishyJoes.export(min) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Actors_TemperatureLogger_min")
    

    async def extensionIsolatedGetLabel(self) -> typing.Awaitable[str]:
        """
        <!-- FishyJoes.export(extensionIsolatedGetLabel) -->
        """
        _ensure_runtime_loaded()
        _not_implemented("TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel")
    

    def extensionNonisolatedGetLabel(self) -> str:
        """
        <!-- FishyJoes.export(extensionNonisolatedGetLabel) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Actors_TemperatureLogger_extensionNonisolatedGetLabel", "object", ("object", self))
    
