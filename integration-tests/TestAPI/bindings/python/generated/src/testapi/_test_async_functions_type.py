from __future__ import annotations
from . import _test_async_functions_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import abc
import fishyjoes_runtime
import types
import typing

class TestAsyncFunctions(abc.ABC):
    """<!-- FishyJoes.export(TestAsyncFunctions) -->"""

    def exercise0(
        self,
        fn: typing.Callable[[], typing.Awaitable[int]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise0) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncFunctions_exercise0(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise1(
        self,
        fn: typing.Callable[[int], typing.Awaitable[int]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise1) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncFunctions_exercise1(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise2(
        self,
        fn: typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise2) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncFunctions_exercise2(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise3(
        self,
        fn: typing.Callable[[float, float, int], typing.Awaitable[float]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise3) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncFunctions_exercise3(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise4(
        self,
        fn: typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise4) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncFunctions_exercise4(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise5(
        self,
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise5) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncFunctions_exercise5(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise6(
        self,
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise6) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncFunctions_exercise6(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def thunk_twice_maker(
        self,
        thunk: typing.Callable[[], typing.Awaitable[None]],
    ) -> typing.Callable[[], typing.Awaitable[None]]:
        """<!-- FishyJoes.export(thunkTwiceMaker) -->"""
        with fishyjoes_runtime.local_handles(self, thunk) as (_selfHandle, _thunkHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncFunctions_thunkTwiceMaker(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _thunkHandle,
                ),
                "Callable"
            )

    def default_exercise6(
        self,
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(defaultExercise6) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncFunctions_defaultExercise6(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def witness(
        self,
    ) -> testapi.TestAsyncFunctions:
        """<!-- FishyJoes.export(witness) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncFunctions_witness(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                testapi.TestAsyncFunctions
            )

    @property
    def add3_things(self) -> typing.Callable[[float, float, int], typing.Awaitable[float]]:
        """<!-- FishyJoes.export(add3Things) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_add3Things(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def const42(self) -> typing.Callable[[], typing.Awaitable[int]]:
        """<!-- FishyJoes.export(const42) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_const42(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def fifth_thing(self) -> typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]:
        """<!-- FishyJoes.export(fifthThing) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_fifthThing(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def iabs(self) -> typing.Callable[[int], typing.Awaitable[int]]:
        """<!-- FishyJoes.export(iabs) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_iabs(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def int_compose(self) -> typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]:
        """<!-- FishyJoes.export(intCompose) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_intCompose(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def make_list(self) -> typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]:
        """<!-- FishyJoes.export(makeList) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_makeList(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def six(self) -> typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]:
        """<!-- FishyJoes.export(six) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_six(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    def will_throw(self) -> typing.Callable[[], typing.Awaitable[int]]:
        """<!-- FishyJoes.export(willThrow) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_willThrow(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")
