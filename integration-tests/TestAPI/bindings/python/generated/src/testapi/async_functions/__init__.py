from __future__ import annotations
from .. import _async_functions_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import collections.abc
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "get_add3_things",
    "get_const42",
    "get_fifth_thing",
    "get_abs",
    "get_int_compose",
    "get_make_list",
    "get_sixth_thing",
    "get_will_throw",
    "delayed_const",
    "exercise0",
    "exercise1",
    "exercise2",
    "exercise3",
    "exercise4",
    "exercise5",
    "exercise6",
    "thunk_twice_maker",
]

def get_add3_things() -> typing.Callable[[float, float, int], typing.Awaitable[float]]:
    """<!-- FishyJoes.export(add3Things) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AsyncFunctions_add3Things(fishyjoes_runtime.Runtime.shared.env_ref), collections.abc.Callable)

def get_const42() -> typing.Callable[[], typing.Awaitable[int]]:
    """<!-- FishyJoes.export(const42) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AsyncFunctions_const42(fishyjoes_runtime.Runtime.shared.env_ref), collections.abc.Callable)

def get_fifth_thing() -> typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]]:
    """<!-- FishyJoes.export(fifthThing) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AsyncFunctions_fifthThing(fishyjoes_runtime.Runtime.shared.env_ref), collections.abc.Callable)

def get_abs() -> typing.Callable[[int], typing.Awaitable[int]]:
    """<!-- FishyJoes.export(abs) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AsyncFunctions_abs(fishyjoes_runtime.Runtime.shared.env_ref), collections.abc.Callable)

def get_int_compose() -> typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]]:
    """<!-- FishyJoes.export(intCompose) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AsyncFunctions_intCompose(fishyjoes_runtime.Runtime.shared.env_ref), collections.abc.Callable)

def get_make_list() -> typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]]:
    """<!-- FishyJoes.export(makeList) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AsyncFunctions_makeList(fishyjoes_runtime.Runtime.shared.env_ref), collections.abc.Callable)

def get_sixth_thing() -> typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]]:
    """<!-- FishyJoes.export(sixthThing) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AsyncFunctions_sixthThing(fishyjoes_runtime.Runtime.shared.env_ref), collections.abc.Callable)

def get_will_throw() -> typing.Callable[[], typing.Awaitable[int]]:
    """<!-- FishyJoes.export(willThrow) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AsyncFunctions_willThrow(fishyjoes_runtime.Runtime.shared.env_ref), collections.abc.Callable)

def delayed_const(
    nanoseconds: int,
) -> typing.Awaitable[int]:
    """<!-- FishyJoes.export(delayedConst) -->"""
    return fishyjoes_runtime.consume_created_ref(
        _impl.iota_TestAPI_AsyncFunctions_delayedConst(
            fishyjoes_runtime.Runtime.shared.env_ref,
            nanoseconds,
        ),
        typing.Awaitable
    )

def exercise0(
    fn: typing.Callable[[], typing.Awaitable[int]],
) -> typing.Awaitable[str]:
    """<!-- FishyJoes.export(exercise0) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AsyncFunctions_exercise0(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            typing.Awaitable
        )

def exercise1(
    fn: typing.Callable[[int], typing.Awaitable[int]],
) -> typing.Awaitable[str]:
    """<!-- FishyJoes.export(exercise1) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AsyncFunctions_exercise1(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            typing.Awaitable
        )

def exercise2(
    fn: typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]],
) -> typing.Awaitable[str]:
    """<!-- FishyJoes.export(exercise2) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AsyncFunctions_exercise2(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            typing.Awaitable
        )

def exercise3(
    fn: typing.Callable[[float, float, int], typing.Awaitable[float]],
) -> typing.Awaitable[str]:
    """<!-- FishyJoes.export(exercise3) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AsyncFunctions_exercise3(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            typing.Awaitable
        )

def exercise4(
    fn: typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]],
) -> typing.Awaitable[str]:
    """<!-- FishyJoes.export(exercise4) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AsyncFunctions_exercise4(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            typing.Awaitable
        )

def exercise5(
    fn: typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]],
) -> typing.Awaitable[str]:
    """<!-- FishyJoes.export(exercise5) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AsyncFunctions_exercise5(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            typing.Awaitable
        )

def exercise6(
    fn: typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]],
) -> typing.Awaitable[str]:
    """<!-- FishyJoes.export(exercise6) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AsyncFunctions_exercise6(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            typing.Awaitable
        )

def thunk_twice_maker(
    thunk: typing.Callable[[], typing.Awaitable[None]],
) -> typing.Callable[[], typing.Awaitable[None]]:
    """<!-- FishyJoes.export(thunkTwiceMaker) -->"""
    with fishyjoes_runtime.local_handles(thunk) as (_thunkHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AsyncFunctions_thunkTwiceMaker(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _thunkHandle,
            ),
            collections.abc.Callable
        )
