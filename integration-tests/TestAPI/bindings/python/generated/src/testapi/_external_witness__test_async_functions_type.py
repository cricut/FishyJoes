from __future__ import annotations
from . import _external_witness__test_async_functions_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class ExternalWitness_TestAsyncFunctions(fishyjoes_runtime.SwiftReference, testapi.TestAsyncFunctions):
    """<!-- FishyJoes.export(TestAsyncFunctions) -->"""

    @property
    @typing.override
    def add3_things(self) -> typing.Callable[[float, float, int], typing.Awaitable[float]]:
        """<!-- FishyJoes.export(add3Things) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_add3_things(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    @typing.override
    def const42(self) -> typing.Callable[[], typing.Awaitable[int]]:
        """<!-- FishyJoes.export(const42) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_const42(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    @typing.override
    def fifth_thing(self) -> typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]:
        """<!-- FishyJoes.export(fifthThing) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_fifth_thing(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    @typing.override
    def iabs(self) -> typing.Callable[[int], typing.Awaitable[int]]:
        """<!-- FishyJoes.export(iabs) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_iabs(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    @typing.override
    def int_compose(self) -> typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]:
        """<!-- FishyJoes.export(intCompose) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_int_compose(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    @typing.override
    def make_list(self) -> typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]:
        """<!-- FishyJoes.export(makeList) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_make_list(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    @typing.override
    def six(self) -> typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]:
        """<!-- FishyJoes.export(six) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_six(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @property
    @typing.override
    def will_throw(self) -> typing.Callable[[], typing.Awaitable[int]]:
        """<!-- FishyJoes.export(willThrow) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestAsyncFunctions_will_throw(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), "Callable")

    @typing.override
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

    @typing.override
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

    @typing.override
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

    @typing.override
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

    @typing.override
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

    @typing.override
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

    @typing.override
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

    @typing.override
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

    @typing.override
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
