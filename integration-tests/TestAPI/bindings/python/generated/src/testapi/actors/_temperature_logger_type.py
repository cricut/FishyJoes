from __future__ import annotations
from . import _temperature_logger_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class TemperatureLogger(fishyjoes_runtime.SwiftReference):
    """<!-- FishyJoes.export(Actors.TemperatureLogger) -->"""

    @property
    def backwards_label(self) -> str:
        """<!-- FishyJoes.export(backwardsLabel) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Actors_TemperatureLogger_backwardsLabel(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def extension_nonisolated_var_label(self) -> str:
        """<!-- FishyJoes.export(extensionNonisolatedVarLabel) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Actors_TemperatureLogger_extensionNonisolatedVarLabel(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def label(self) -> str:
        """<!-- FishyJoes.export(label) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Actors_TemperatureLogger_label(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @staticmethod
    def create(
        label: str,
        measurement: int,
    ) -> testapi.actors.TemperatureLogger:
        """<!-- FishyJoes.export(create) -->"""
        with fishyjoes_runtime.local_handles(label) as (_labelHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Actors_TemperatureLogger_create(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _labelHandle,
                    measurement,
                ),
                testapi.actors.TemperatureLogger
            )

    def update(
        self,
        measurement: int,
    ) -> typing.Awaitable[None]:
        """<!-- FishyJoes.export(update) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Actors_TemperatureLogger_update(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    measurement,
                ),
                "Awaitable"
            )

    def min_(
        self,
    ) -> typing.Awaitable[int]:
        """<!-- FishyJoes.export(min) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Actors_TemperatureLogger_min(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                "Awaitable"
            )

    def extension_isolated_get_label(
        self,
    ) -> typing.Awaitable[str]:
        """<!-- FishyJoes.export(extensionIsolatedGetLabel) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                "Awaitable"
            )

    def extension_nonisolated_get_label(
        self,
    ) -> str:
        """<!-- FishyJoes.export(extensionNonisolatedGetLabel) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Actors_TemperatureLogger_extensionNonisolatedGetLabel(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                str
            )
