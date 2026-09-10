class TestAsyncSwiftSideFunctionsClass(SwiftReference, testapi.TestAsyncFunctions):
    """<!-- FishyJoes.export(TestAsyncSwiftSideFunctionsClass) -->"""

    """<!-- FishyJoes.export(add3Things) -->"""
    typing.Callable[[float, float, int], float] get add3Things =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<typing.Callable[[float, float, int], float]>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_add3Things(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(const42) -->"""
    typing.Callable[[], int] get const42 =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<typing.Callable[[], int]>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_const42(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(fifthThing) -->"""
    typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]] get fifthThing =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]]>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_fifthThing(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(iabs) -->"""
    typing.Callable[[int], int] get iabs =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<typing.Callable[[int], int]>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_iabs(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(intCompose) -->"""
    typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]] get intCompose =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]]>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_intCompose(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(makeList) -->"""
    typing.Callable[[str, str, str, str], list[str]] get makeList =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<typing.Callable[[str, str, str, str], list[str]]>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_makeList(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(six) -->"""
    typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int] get six =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int]>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_six(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    """<!-- FishyJoes.export(willThrow) -->"""
    typing.Callable[[], int] get willThrow =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<typing.Callable[[], int]>(f__iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_willThrow(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    def exercise0(
        fn: typing.Callable[[], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise0) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise0)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _fnHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def exercise1(
        fn: typing.Callable[[int], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise1) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise1)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _fnHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def exercise2(
        fn: typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise2) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise2)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _fnHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def exercise3(
        fn: typing.Callable[[float, float, int], float],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise3) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise3)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _fnHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def exercise4(
        fn: typing.Callable[[str, str, str, str], list[str]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise4) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise4)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _fnHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def exercise5(
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise5) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise5)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _fnHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def exercise6(
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise6) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise6)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _fnHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )

    def thunkTwiceMaker(
        thunk: typing.Callable[[], None],
    ) -> typing.Callable[[], None]:
        """<!-- FishyJoes.export(thunkTwiceMaker) -->"""
        with fishyjoes_runtime.local_handles(self, thunk) as (_selfHandle, _thunkHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_thunkTwiceMaker)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _thunkHandle.ptr,
                ),
                object
            )

    def witness(
    ) -> testapi.TestAsyncFunctions:
        """<!-- FishyJoes.export(witness) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_witness)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                testapi.TestAsyncFunctions
            )

    @staticmethod
    def init(
    ) -> testapi.TestAsyncSwiftSideFunctionsClass:
        """<!-- FishyJoes.export(init) -->"""
        return consume_created_ref(
            fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_init)(
                Loader.shared.env,
            ),
            testapi.TestAsyncSwiftSideFunctionsClass
        )

    def defaultExercise6(
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(defaultExercise6) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncSwiftSideFunctionsClass_defaultExercise6)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _fnHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )
