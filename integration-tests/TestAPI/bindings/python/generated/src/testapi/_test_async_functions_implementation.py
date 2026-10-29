from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from warnings import deprecated
import collections.abc
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_TestAsyncFunctions_add3Things: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestAsyncFunctions_add3Things'))

iota_get_TestAPI_TestAsyncFunctions_const42: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestAsyncFunctions_const42'))

iota_get_TestAPI_TestAsyncFunctions_fifthThing: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestAsyncFunctions_fifthThing'))

iota_get_TestAPI_TestAsyncFunctions_iabs: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestAsyncFunctions_iabs'))

iota_get_TestAPI_TestAsyncFunctions_intCompose: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestAsyncFunctions_intCompose'))

iota_get_TestAPI_TestAsyncFunctions_makeList: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestAsyncFunctions_makeList'))

iota_get_TestAPI_TestAsyncFunctions_six: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestAsyncFunctions_six'))

iota_get_TestAPI_TestAsyncFunctions_willThrow: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestAsyncFunctions_willThrow'))

iota_TestAPI_TestAsyncFunctions_exercise0: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncFunctions_exercise0'))

iota_TestAPI_TestAsyncFunctions_exercise1: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncFunctions_exercise1'))

iota_TestAPI_TestAsyncFunctions_exercise2: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncFunctions_exercise2'))

iota_TestAPI_TestAsyncFunctions_exercise3: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncFunctions_exercise3'))

iota_TestAPI_TestAsyncFunctions_exercise4: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncFunctions_exercise4'))

iota_TestAPI_TestAsyncFunctions_exercise5: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncFunctions_exercise5'))

iota_TestAPI_TestAsyncFunctions_exercise6: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncFunctions_exercise6'))

iota_TestAPI_TestAsyncFunctions_thunkTwiceMaker: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncFunctions_thunkTwiceMaker'))

iota_TestAPI_TestAsyncFunctions_defaultExercise6: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncFunctions_defaultExercise6'))

iota_TestAPI_TestAsyncFunctions_witness: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncFunctions_witness'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_add3Things_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_get_add3_things(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).add3_things)

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_const42_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_get_const42(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).const42)

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_fifthThing_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_get_fifth_thing(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).fifth_thing)

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_iabs_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_get_iabs(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).iabs)

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_intCompose_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_get_int_compose(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).int_compose)

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_makeList_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_get_make_list(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).make_list)

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_six_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_get_six(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).six)

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_willThrow_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_get_will_throw(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).will_throw)

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_exercise0_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_exercise0(
    obj: fishyjoes_runtime.UnownedRef,
    fn: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).exercise0(
            fishyjoes_runtime.peek_ref(fn, collections.abc.Callable),
        )
    )

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_exercise1_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_exercise1(
    obj: fishyjoes_runtime.UnownedRef,
    fn: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).exercise1(
            fishyjoes_runtime.peek_ref(fn, collections.abc.Callable),
        )
    )

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_exercise2_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_exercise2(
    obj: fishyjoes_runtime.UnownedRef,
    fn: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).exercise2(
            fishyjoes_runtime.peek_ref(fn, collections.abc.Callable),
        )
    )

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_exercise3_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_exercise3(
    obj: fishyjoes_runtime.UnownedRef,
    fn: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).exercise3(
            fishyjoes_runtime.peek_ref(fn, collections.abc.Callable),
        )
    )

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_exercise4_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_exercise4(
    obj: fishyjoes_runtime.UnownedRef,
    fn: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).exercise4(
            fishyjoes_runtime.peek_ref(fn, collections.abc.Callable),
        )
    )

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_exercise5_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_exercise5(
    obj: fishyjoes_runtime.UnownedRef,
    fn: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).exercise5(
            fishyjoes_runtime.peek_ref(fn, collections.abc.Callable),
        )
    )

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_exercise6_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_exercise6(
    obj: fishyjoes_runtime.UnownedRef,
    fn: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).exercise6(
            fishyjoes_runtime.peek_ref(fn, collections.abc.Callable),
        )
    )

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_thunkTwiceMaker_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_thunk_twice_maker(
    obj: fishyjoes_runtime.UnownedRef,
    thunk: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).thunk_twice_maker(
            fishyjoes_runtime.peek_ref(thunk, collections.abc.Callable),
        )
    )

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_defaultExercise6_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_default_exercise6(
    obj: fishyjoes_runtime.UnownedRef,
    fn: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).default_exercise6(
            fishyjoes_runtime.peek_ref(fn, collections.abc.Callable),
        )
    )

@fishyjoes_runtime.callback('TestAPI_TestAsyncFunctions_witness_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_witness(
    obj: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestAsyncFunctions).witness(
        )
    )

# MARK: setup
