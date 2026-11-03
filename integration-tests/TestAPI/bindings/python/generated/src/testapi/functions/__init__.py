from __future__ import annotations
from .. import _functions_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
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
    "exercise0",
    "exercise1",
    "exercise2",
    "exercise3",
    "exercise4",
    "exercise5",
    "exercise6",
    "will_throw",
    "thunk_twice_maker",
]

def get_add3_things() -> typing.Callable[[float, float, int], float]:
    """<!-- FishyJoes.export(add3Things) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Functions_add3Things(fishyjoes_runtime.Runtime.shared.env_ref), "Callable")

def get_const42() -> typing.Callable[[], int]:
    """<!-- FishyJoes.export(const42) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Functions_const42(fishyjoes_runtime.Runtime.shared.env_ref), "Callable")

def get_fifth_thing() -> typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]]:
    """<!-- FishyJoes.export(fifthThing) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Functions_fifthThing(fishyjoes_runtime.Runtime.shared.env_ref), "Callable")

def get_abs() -> typing.Callable[[int], int]:
    """<!-- FishyJoes.export(abs) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Functions_abs(fishyjoes_runtime.Runtime.shared.env_ref), "Callable")

def get_int_compose() -> typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]]:
    """<!-- FishyJoes.export(intCompose) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Functions_intCompose(fishyjoes_runtime.Runtime.shared.env_ref), "Callable")

def get_make_list() -> typing.Callable[[str, str, str, str], list[str]]:
    """<!-- FishyJoes.export(makeList) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Functions_makeList(fishyjoes_runtime.Runtime.shared.env_ref), "Callable")

def get_sixth_thing() -> typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int]:
    """<!-- FishyJoes.export(sixthThing) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Functions_sixthThing(fishyjoes_runtime.Runtime.shared.env_ref), "Callable")

def exercise0(
    fn: typing.Callable[[], int],
) -> str:
    """<!-- FishyJoes.export(exercise0) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Functions_exercise0(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            str
        )

def exercise1(
    fn: typing.Callable[[int], int],
) -> str:
    """<!-- FishyJoes.export(exercise1) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Functions_exercise1(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            str
        )

def exercise2(
    fn: typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]],
) -> str:
    """<!-- FishyJoes.export(exercise2) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Functions_exercise2(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            str
        )

def exercise3(
    fn: typing.Callable[[float, float, int], float],
) -> str:
    """<!-- FishyJoes.export(exercise3) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Functions_exercise3(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            str
        )

def exercise4(
    fn: typing.Callable[[str, str, str, str], list[str]],
) -> str:
    """<!-- FishyJoes.export(exercise4) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Functions_exercise4(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            str
        )

def exercise5(
    fn: typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]],
) -> str:
    """<!-- FishyJoes.export(exercise5) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Functions_exercise5(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            str
        )

def exercise6(
    fn: typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int],
) -> str:
    """<!-- FishyJoes.export(exercise6) -->"""
    with fishyjoes_runtime.local_handles(fn) as (_fnHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Functions_exercise6(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _fnHandle,
            ),
            str
        )

def will_throw(
) -> str:
    """<!-- FishyJoes.export(willThrow) -->"""
    return fishyjoes_runtime.consume_created_ref(
        _impl.iota_TestAPI_Functions_willThrow(
            fishyjoes_runtime.Runtime.shared.env_ref,
        ),
        str
    )

def thunk_twice_maker(
    thunk: typing.Callable[[], None],
) -> typing.Callable[[], None]:
    """<!-- FishyJoes.export(thunkTwiceMaker) -->"""
    with fishyjoes_runtime.local_handles(thunk) as (_thunkHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Functions_thunkTwiceMaker(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _thunkHandle,
            ),
            "Callable"
        )
