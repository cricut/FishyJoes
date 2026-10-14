from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from ._test_async_foreign_side_functions_struct_type import TestAsyncForeignSideFunctionsStruct
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_defaultExercise6: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_defaultExercise6'))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0'))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1'))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2'))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3'))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4'))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5'))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6'))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker'))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    const42: fishyjoes_runtime.ConsumedRef,
    iabs: fishyjoes_runtime.ConsumedRef,
    int_compose: fishyjoes_runtime.ConsumedRef,
    add3_things: fishyjoes_runtime.ConsumedRef,
    make_list: fishyjoes_runtime.ConsumedRef,
    fifth_thing: fishyjoes_runtime.ConsumedRef,
    six: fishyjoes_runtime.ConsumedRef,
    will_throw: fishyjoes_runtime.ConsumedRef,
    exercise0_fun: fishyjoes_runtime.ConsumedRef,
    exercise1_fun: fishyjoes_runtime.ConsumedRef,
    exercise2_fun: fishyjoes_runtime.ConsumedRef,
    exercise3_fun: fishyjoes_runtime.ConsumedRef,
    exercise4_fun: fishyjoes_runtime.ConsumedRef,
    exercise5_fun: fishyjoes_runtime.ConsumedRef,
    exercise6_fun: fishyjoes_runtime.ConsumedRef,
    thunk_twice_maker_fun: fishyjoes_runtime.ConsumedRef
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(TestAsyncForeignSideFunctionsStruct(
        const42 = fishyjoes_runtime.consume_ref(const42, "Callable"),
        iabs = fishyjoes_runtime.consume_ref(iabs, "Callable"),
        int_compose = fishyjoes_runtime.consume_ref(int_compose, "Callable"),
        add3_things = fishyjoes_runtime.consume_ref(add3_things, "Callable"),
        make_list = fishyjoes_runtime.consume_ref(make_list, "Callable"),
        fifth_thing = fishyjoes_runtime.consume_ref(fifth_thing, "Callable"),
        six = fishyjoes_runtime.consume_ref(six, "Callable"),
        will_throw = fishyjoes_runtime.consume_ref(will_throw, "Callable"),
        exercise0_fun = fishyjoes_runtime.consume_ref(exercise0_fun, "Callable"),
        exercise1_fun = fishyjoes_runtime.consume_ref(exercise1_fun, "Callable"),
        exercise2_fun = fishyjoes_runtime.consume_ref(exercise2_fun, "Callable"),
        exercise3_fun = fishyjoes_runtime.consume_ref(exercise3_fun, "Callable"),
        exercise4_fun = fishyjoes_runtime.consume_ref(exercise4_fun, "Callable"),
        exercise5_fun = fishyjoes_runtime.consume_ref(exercise5_fun, "Callable"),
        exercise6_fun = fishyjoes_runtime.consume_ref(exercise6_fun, "Callable"),
        thunk_twice_maker_fun = fishyjoes_runtime.consume_ref(thunk_twice_maker_fun, "Callable"),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_const42(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).const42)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_iabs(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).iabs)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_int_compose(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).int_compose)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_add3_things(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).add3_things)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_make_list(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).make_list)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_fifth_thing(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).fifth_thing)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_six(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).six)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_will_throw(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).will_throw)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise0_fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise0_fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise1_fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise1_fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise2_fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise2_fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise3_fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise3_fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise4_fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise4_fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise5_fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise5_fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise6_fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise6_fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_thunk_twice_maker_fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).thunk_twice_maker_fun)

# MARK: setup

# TODO: setup for testapi.TestAsyncForeignSideFunctionsStruct
