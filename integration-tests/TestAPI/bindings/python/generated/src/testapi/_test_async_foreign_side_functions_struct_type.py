from __future__ import annotations
from ._test_async_functions_type import TestAsyncFunctions # early import to make cycles work correctly
from . import _test_async_foreign_side_functions_struct_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class TestAsyncForeignSideFunctionsStruct(TestAsyncFunctions):
    """<!-- FishyJoes.export(TestAsyncForeignSideFunctionsStruct) -->"""

    const42: typing.Final[typing.Callable[[], typing.Awaitable[int]]]
    iabs: typing.Final[typing.Callable[[int], typing.Awaitable[int]]]
    int_compose: typing.Final[typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]]
    add3_things: typing.Final[typing.Callable[[float, float, int], typing.Awaitable[float]]]
    make_list: typing.Final[typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]]
    fifth_thing: typing.Final[typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]]
    six: typing.Final[typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]]
    will_throw: typing.Final[typing.Callable[[], typing.Awaitable[int]]]
    exercise0_fun: typing.Final[typing.Callable[[typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[str]]]
    exercise1_fun: typing.Final[typing.Callable[[typing.Callable[[int], typing.Awaitable[int]]], typing.Awaitable[str]]]
    exercise2_fun: typing.Final[typing.Callable[[typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]], typing.Awaitable[str]]]
    exercise3_fun: typing.Final[typing.Callable[[typing.Callable[[float, float, int], typing.Awaitable[float]]], typing.Awaitable[str]]]
    exercise4_fun: typing.Final[typing.Callable[[typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]], typing.Awaitable[str]]]
    exercise5_fun: typing.Final[typing.Callable[[typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]], typing.Awaitable[str]]]
    exercise6_fun: typing.Final[typing.Callable[[typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]], typing.Awaitable[str]]]
    thunk_twice_maker_fun: typing.Final[typing.Callable[[typing.Callable[[], typing.Awaitable[None]]], typing.Callable[[], typing.Awaitable[None]]]]
    __slots__: list[str] = [
        'const42',
        'iabs',
        'int_compose',
        'add3_things',
        'make_list',
        'fifth_thing',
        'six',
        'will_throw',
        'exercise0_fun',
        'exercise1_fun',
        'exercise2_fun',
        'exercise3_fun',
        'exercise4_fun',
        'exercise5_fun',
        'exercise6_fun',
        'thunk_twice_maker_fun',
    ]

    def __init__(
        self,
        const42: typing.Callable[[], typing.Awaitable[int]],
        iabs: typing.Callable[[int], typing.Awaitable[int]],
        int_compose: typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]],
        add3_things: typing.Callable[[float, float, int], typing.Awaitable[float]],
        make_list: typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]],
        fifth_thing: typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]],
        six: typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]],
        will_throw: typing.Callable[[], typing.Awaitable[int]],
        exercise0_fun: typing.Callable[[typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[str]],
        exercise1_fun: typing.Callable[[typing.Callable[[int], typing.Awaitable[int]]], typing.Awaitable[str]],
        exercise2_fun: typing.Callable[[typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]], typing.Awaitable[str]],
        exercise3_fun: typing.Callable[[typing.Callable[[float, float, int], typing.Awaitable[float]]], typing.Awaitable[str]],
        exercise4_fun: typing.Callable[[typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]], typing.Awaitable[str]],
        exercise5_fun: typing.Callable[[typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]], typing.Awaitable[str]],
        exercise6_fun: typing.Callable[[typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]], typing.Awaitable[str]],
        thunk_twice_maker_fun: typing.Callable[[typing.Callable[[], typing.Awaitable[None]]], typing.Callable[[], typing.Awaitable[None]]],
    ) -> None:
        self.const42 = const42
        self.iabs = iabs
        self.int_compose = int_compose
        self.add3_things = add3_things
        self.make_list = make_list
        self.fifth_thing = fifth_thing
        self.six = six
        self.will_throw = will_throw
        self.exercise0_fun = exercise0_fun
        self.exercise1_fun = exercise1_fun
        self.exercise2_fun = exercise2_fun
        self.exercise3_fun = exercise3_fun
        self.exercise4_fun = exercise4_fun
        self.exercise5_fun = exercise5_fun
        self.exercise6_fun = exercise6_fun
        self.thunk_twice_maker_fun = thunk_twice_maker_fun

    def __repr__(self) -> str:
        return f'testapi.TestAsyncForeignSideFunctionsStruct(...)'

    @typing.override
    def exercise0(
        self,
        fn: typing.Callable[[], typing.Awaitable[int]],
    ) -> typing.Awaitable[str]:
        """<!-- FishyJoes.export(exercise0) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                "Awaitable"
            )

    @typing.override
    def exercise1(
        self,
        fn: typing.Callable[[int], typing.Awaitable[int]],
    ) -> typing.Awaitable[str]:
        """<!-- FishyJoes.export(exercise1) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                "Awaitable"
            )

    @typing.override
    def exercise2(
        self,
        fn: typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]],
    ) -> typing.Awaitable[str]:
        """<!-- FishyJoes.export(exercise2) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                "Awaitable"
            )

    @typing.override
    def exercise3(
        self,
        fn: typing.Callable[[float, float, int], typing.Awaitable[float]],
    ) -> typing.Awaitable[str]:
        """<!-- FishyJoes.export(exercise3) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                "Awaitable"
            )

    @typing.override
    def exercise4(
        self,
        fn: typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]],
    ) -> typing.Awaitable[str]:
        """<!-- FishyJoes.export(exercise4) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                "Awaitable"
            )

    @typing.override
    def exercise5(
        self,
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]],
    ) -> typing.Awaitable[str]:
        """<!-- FishyJoes.export(exercise5) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                "Awaitable"
            )

    @typing.override
    def exercise6(
        self,
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]],
    ) -> typing.Awaitable[str]:
        """<!-- FishyJoes.export(exercise6) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                "Awaitable"
            )

    @typing.override
    def thunk_twice_maker(
        self,
        thunk: typing.Callable[[], typing.Awaitable[None]],
    ) -> typing.Callable[[], typing.Awaitable[None]]:
        """<!-- FishyJoes.export(thunkTwiceMaker) -->"""
        with fishyjoes_runtime.local_handles(self, thunk) as (_selfHandle, _thunkHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker(
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
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                testapi.TestAsyncFunctions
            )

    @typing.override
    def default_exercise6(
        self,
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]],
    ) -> typing.Awaitable[str]:
        """<!-- FishyJoes.export(defaultExercise6) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_defaultExercise6(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                "Awaitable"
            )

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        return isinstance(other, TestAsyncForeignSideFunctionsStruct) and \
            self.const42 == other.const42 and \
            self.iabs == other.iabs and \
            self.int_compose == other.int_compose and \
            self.add3_things == other.add3_things and \
            self.make_list == other.make_list and \
            self.fifth_thing == other.fifth_thing and \
            self.six == other.six and \
            self.will_throw == other.will_throw and \
            self.exercise0_fun == other.exercise0_fun and \
            self.exercise1_fun == other.exercise1_fun and \
            self.exercise2_fun == other.exercise2_fun and \
            self.exercise3_fun == other.exercise3_fun and \
            self.exercise4_fun == other.exercise4_fun and \
            self.exercise5_fun == other.exercise5_fun and \
            self.exercise6_fun == other.exercise6_fun and \
            self.thunk_twice_maker_fun == other.thunk_twice_maker_fun and \
            True
