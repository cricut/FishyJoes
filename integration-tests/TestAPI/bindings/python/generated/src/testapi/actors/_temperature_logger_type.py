from . import _temperature_logger_implementation as _impl
from .. import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class TemperatureLogger(fishyjoes_runtime.SwiftReference):
    """<!-- FishyJoes.export(Actors.TemperatureLogger) -->"""

    @property
    def backwardsLabel(self) -> str:
        """<!-- FishyJoes.export(backwardsLabel) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Actors_TemperatureLogger_backwardsLabel(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def extensionNonisolatedVarLabel(self) -> str:
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
        with fishyjoes_runtime.local_handles(label, measurement) as (_labelHandle, _measurementHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Actors_TemperatureLogger_create(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _labelHandle,
                    _measurementHandle,
                ),
                testapi.actors.TemperatureLogger
            )

    def update(
        self,
        measurement: int,
    ) -> fishyjoes_runtime.Future[None]:
        """<!-- FishyJoes.export(update) -->"""
        with fishyjoes_runtime.local_handles(self, measurement) as (_selfHandle, _measurementHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Actors_TemperatureLogger_update(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _measurementHandle,
                ),
                fishyjoes_runtime.Future
            )

    def min(
        self,
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(min) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Actors_TemperatureLogger_min(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                fishyjoes_runtime.Future
            )

    def extensionIsolatedGetLabel(
        self,
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(extensionIsolatedGetLabel) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                fishyjoes_runtime.Future
            )

    def extensionNonisolatedGetLabel(
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
