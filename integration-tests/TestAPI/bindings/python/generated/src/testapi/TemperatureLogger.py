class TemperatureLogger(SwiftReference):
    """<!-- FishyJoes.export(Actors.TemperatureLogger) -->"""

    """<!-- FishyJoes.export(backwardsLabel) -->"""
    str get backwardsLabel =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota_get_TestAPI_Actors_TemperatureLogger_backwardsLabel(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(extensionNonisolatedVarLabel) -->"""
    str get extensionNonisolatedVarLabel =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota_get_TestAPI_Actors_TemperatureLogger_extensionNonisolatedVarLabel(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(label) -->"""
    str get label =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota_get_TestAPI_Actors_TemperatureLogger_label(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    @staticmethod
    def create(
        label: str,
        measurement: int,
    ) -> testapi.Actors.TemperatureLogger:
        """<!-- FishyJoes.export(create) -->"""
        with fishyjoes_runtime.local_handles(label, measurement) as (_labelHandle, _measurementHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Actors_TemperatureLogger_create)(
                    Loader.shared.env,
                    _labelHandle.ptr,
                    _measurementHandle.ptr,
                ),
                testapi.Actors.TemperatureLogger
            )

    def update(
        measurement: int,
    ) -> fishyjoes_runtime.Future[None]:
        """<!-- FishyJoes.export(update) -->"""
        with fishyjoes_runtime.local_handles(self, measurement) as (_selfHandle, _measurementHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Actors_TemperatureLogger_update)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _measurementHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def min(
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(min) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Actors_TemperatureLogger_min)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def extensionIsolatedGetLabel(
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(extensionIsolatedGetLabel) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def extensionNonisolatedGetLabel(
    ) -> str:
        """<!-- FishyJoes.export(extensionNonisolatedGetLabel) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Actors_TemperatureLogger_extensionNonisolatedGetLabel)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                str
            )
