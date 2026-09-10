@dataclasses.dataclass
class TestAsyncForeignSideFunctionsStruct(testapi.TestAsyncFunctions):
    """<!-- FishyJoes.export(TestAsyncForeignSideFunctionsStruct) -->"""
    const42: Final[typing.Callable[[], int]]
    iabs: Final[typing.Callable[[int], int]]
    intCompose: Final[typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]]]
    add3Things: Final[typing.Callable[[float, float, int], float]]
    makeList: Final[typing.Callable[[str, str, str, str], list[str]]]
    fifthThing: Final[typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]]]
    six: Final[typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int]]
    willThrow: Final[typing.Callable[[], int]]
    exercise0Fun: Final[typing.Callable[[typing.Callable[[], int]], str]]
    exercise1Fun: Final[typing.Callable[[typing.Callable[[int], int]], str]]
    exercise2Fun: Final[typing.Callable[[typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]]], str]]
    exercise3Fun: Final[typing.Callable[[typing.Callable[[float, float, int], float]], str]]
    exercise4Fun: Final[typing.Callable[[typing.Callable[[str, str, str, str], list[str]]], str]]
    exercise5Fun: Final[typing.Callable[[typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]]], str]]
    exercise6Fun: Final[typing.Callable[[typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int]], str]]
    thunkTwiceMakerFun: Final[typing.Callable[[typing.Callable[[], None]], typing.Callable[[], None]]]

    def exercise0(
        fn: typing.Callable[[], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise0) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                testapi.TestAsyncFunctions
            )

    def defaultExercise6(
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(defaultExercise6) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_defaultExercise6)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _fnHandle.ptr,
                ),
                fishyjoes_runtime.Future
            )
