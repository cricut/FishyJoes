class Methods(SwiftReference):
    """<!-- FishyJoes.exportReference(Methods) -->"""

    """<!-- FishyJoes.export(garply) -->"""
    int get garply =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<int>(f__iota_get_TestAPI_Methods_garply(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(instanceGet) -->"""
    int get instanceGet =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<int>(f__iota_get_TestAPI_Methods_instanceGet(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.exportAsMethod(instanceGetMethod) -->"""
    int get instanceGetMethod =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<int>(f__iota_get_TestAPI_Methods_instanceGetMethod(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(instanceModifiable) -->"""
    int get instanceModifiable =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<int>(f__iota_get_TestAPI_Methods_instanceModifiable(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    void set instanceModifiable(int value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__iota_set_TestAPI_Methods_instanceModifiable(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
    }
    """<!-- FishyJoes.export(instanceStored) -->"""
    int get instanceStored =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<int>(f__iota_get_TestAPI_Methods_instanceStored(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    void set instanceStored(int value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__iota_set_TestAPI_Methods_instanceStored(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
    }
    """<!-- FishyJoes.export(staticGet) -->"""
    static int get staticGet =>
        check((exn) =>
            consumeCreatedRef<int>(f__iota_get_TestAPI_Methods_staticGet(Loader.shared.env, exn))
        )

    """<!-- FishyJoes.exportAsMethod(staticGetMethod) -->"""
    static int get staticGetMethod =>
        check((exn) =>
            consumeCreatedRef<int>(f__iota_get_TestAPI_Methods_staticGetMethod(Loader.shared.env, exn))
        )

    """<!-- FishyJoes.export(staticModifiable) -->"""
    static int get staticModifiable =>
        check((exn) =>
            consumeCreatedRef<int>(f__iota_get_TestAPI_Methods_staticModifiable(Loader.shared.env, exn))
        )

    static void set staticModifiable(int value) {
        GCRef.using(value, (_valueHandle) =>
            check((exn) =>
                f__iota_set_TestAPI_Methods_staticModifiable(Loader.shared.env, _valueHandle.ptr, exn)
            )
        )
    }
    """<!-- FishyJoes.export(staticStored) -->"""
    static int get staticStored =>
        check((exn) =>
            consumeCreatedRef<int>(f__iota_get_TestAPI_Methods_staticStored(Loader.shared.env, exn))
        )

    static void set staticStored(int value) {
        GCRef.using(value, (_valueHandle) =>
            check((exn) =>
                f__iota_set_TestAPI_Methods_staticStored(Loader.shared.env, _valueHandle.ptr, exn)
            )
        )
    }
    @staticmethod
    def create(
    ) -> testapi.Methods:
        """<!-- FishyJoes.export(create) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_create)(
                Loader.shared.env,
            ),
            testapi.Methods
        )

    def doublePlusGood(
        a: int,
        b: float,
    ) -> int:
        """<!-- FishyJoes.export(doublePlusGood) -->"""
        with fishyjoes_runtime.local_handles(self, a, b) as (_selfHandle, _aHandle, _bHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_doublePlusGood)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _aHandle.ptr,
                    _bHandle.ptr,
                ),
                int
            )

    def async42(
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(async42) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_async42)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def asyncYield(
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(asyncYield) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_asyncYield)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def asyncSleep(
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(asyncSleep) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_asyncSleep)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def asyncVoid(
    ) -> fishyjoes_runtime.Future[None]:
        """<!-- FishyJoes.export(asyncVoid) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_asyncVoid)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def asyncDouble(
        d: float,
    ) -> fishyjoes_runtime.Future[float]:
        """<!-- FishyJoes.export(asyncDouble) -->"""
        with fishyjoes_runtime.local_handles(self, d) as (_selfHandle, _dHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_asyncDouble)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _dHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def asyncMultipleArgs(
        i: int,
        j: typing.Callable[[], int],
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(asyncMultipleArgs) -->"""
        with fishyjoes_runtime.local_handles(self, i, j) as (_selfHandle, _iHandle, _jHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_asyncMultipleArgs)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _iHandle.ptr,
                    _jHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def asyncThrowing(
    ) -> fishyjoes_runtime.Future[None]:
        """<!-- FishyJoes.export(asyncThrowing) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_asyncThrowing)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def asyncCallbackFunc0(
        callback: typing.Callable[[], int],
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(asyncCallbackFunc0) -->"""
        with fishyjoes_runtime.local_handles(self, callback) as (_selfHandle, _callbackHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_asyncCallbackFunc0)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _callbackHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    @staticmethod
    def staticAsync42(
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(staticAsync42) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_staticAsync42)(
                Loader.shared.env,
            ),
            fishyjoes_runtime.Future
        )

    @staticmethod
    def staticAsyncYield(
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(staticAsyncYield) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_staticAsyncYield)(
                Loader.shared.env,
            ),
            fishyjoes_runtime.Future
        )

    @staticmethod
    def staticAsyncSleep(
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(staticAsyncSleep) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_staticAsyncSleep)(
                Loader.shared.env,
            ),
            fishyjoes_runtime.Future
        )

    @staticmethod
    def staticAsyncVoid(
    ) -> fishyjoes_runtime.Future[None]:
        """<!-- FishyJoes.export(staticAsyncVoid) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_staticAsyncVoid)(
                Loader.shared.env,
            ),
            fishyjoes_runtime.Future
        )

    @staticmethod
    def staticAsyncDouble(
        d: float,
    ) -> fishyjoes_runtime.Future[float]:
        """<!-- FishyJoes.export(staticAsyncDouble) -->"""
        with fishyjoes_runtime.local_handles(d) as (_dHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_staticAsyncDouble)(
                    Loader.shared.env,
                    _dHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    @staticmethod
    def staticAsyncMultipleArgs(
        i: int,
        j: typing.Callable[[], int],
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(staticAsyncMultipleArgs) -->"""
        with fishyjoes_runtime.local_handles(i, j) as (_iHandle, _jHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_staticAsyncMultipleArgs)(
                    Loader.shared.env,
                    _iHandle.ptr,
                    _jHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    @staticmethod
    def staticAsyncThrowing(
    ) -> fishyjoes_runtime.Future[None]:
        """<!-- FishyJoes.export(staticAsyncThrowing) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_staticAsyncThrowing)(
                Loader.shared.env,
            ),
            fishyjoes_runtime.Future
        )

    @staticmethod
    def staticAsyncCallbackFunc0(
        callback: typing.Callable[[], int],
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(staticAsyncCallbackFunc0) -->"""
        with fishyjoes_runtime.local_handles(callback) as (_callbackHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_staticAsyncCallbackFunc0)(
                    Loader.shared.env,
                    _callbackHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    @staticmethod
    def methodWithNewlinesInTypes(
        thing: typing.Callable[[int, bytes, bool], fishyjoes_runtime.Result[int,testapi.TheMethodError]],
    ) -> None:
        """<!-- FishyJoes.export(methodWithNewlinesInTypes) -->"""
        with fishyjoes_runtime.local_handles(thing) as (_thingHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_Methods_methodWithNewlinesInTypes)(
                    Loader.shared.env,
                    _thingHandle.ptr,
                ),
                types.NoneType
            )
