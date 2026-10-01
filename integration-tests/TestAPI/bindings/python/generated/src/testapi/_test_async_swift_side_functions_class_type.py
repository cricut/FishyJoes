from . import _test_async_swift_side_functions_class_implementation as _impl
from . import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class TestAsyncSwiftSideFunctionsClass(fishyjoes_runtime.SwiftReference, testapi.TestAsyncFunctions):
    """<!-- FishyJoes.export(TestAsyncSwiftSideFunctionsClass) -->"""

    @property
    def add3Things(self) -> typing.Callable[[float, float, int], float]:
        """<!-- FishyJoes.export(add3Things) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_add3Things(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def const42(self) -> typing.Callable[[], int]:
        """<!-- FishyJoes.export(const42) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_const42(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def fifthThing(self) -> typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]]:
        """<!-- FishyJoes.export(fifthThing) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_fifthThing(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def iabs(self) -> typing.Callable[[int], int]:
        """<!-- FishyJoes.export(iabs) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_iabs(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def intCompose(self) -> typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]]:
        """<!-- FishyJoes.export(intCompose) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_intCompose(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def makeList(self) -> typing.Callable[[str, str, str, str], list[str]]:
        """<!-- FishyJoes.export(makeList) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_makeList(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def six(self) -> typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int]:
        """<!-- FishyJoes.export(six) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_six(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def willThrow(self) -> typing.Callable[[], int]:
        """<!-- FishyJoes.export(willThrow) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_willThrow(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    def exercise0(
        self,
        fn: typing.Callable[[], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise0) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise0(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise1(
        self,
        fn: typing.Callable[[int], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise1) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise1(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise2(
        self,
        fn: typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise2) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise2(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise3(
        self,
        fn: typing.Callable[[float, float, int], float],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise3) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise3(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise4(
        self,
        fn: typing.Callable[[str, str, str, str], list[str]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise4) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise4(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise5(
        self,
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise5) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise5(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise6(
        self,
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise6) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise6(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def thunkTwiceMaker(
        self,
        thunk: typing.Callable[[], None],
    ) -> typing.Callable[[], None]:
        """<!-- FishyJoes.export(thunkTwiceMaker) -->"""
        with fishyjoes_runtime.local_handles(self, thunk) as (_selfHandle, _thunkHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncSwiftSideFunctionsClass_thunkTwiceMaker(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _thunkHandle,
                ),
                "Callable"
            )

    def witness(
        self,
    ) -> testapi.TestAsyncFunctions:
        """<!-- FishyJoes.export(witness) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncSwiftSideFunctionsClass_witness(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                testapi.TestAsyncFunctions
            )

    @staticmethod
    def init(
    ) -> testapi.TestAsyncSwiftSideFunctionsClass:
        """<!-- FishyJoes.export(init) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_TestAsyncSwiftSideFunctionsClass_init(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            testapi.TestAsyncSwiftSideFunctionsClass
        )

    def defaultExercise6(
        self,
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(defaultExercise6) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncSwiftSideFunctionsClass_defaultExercise6(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )
