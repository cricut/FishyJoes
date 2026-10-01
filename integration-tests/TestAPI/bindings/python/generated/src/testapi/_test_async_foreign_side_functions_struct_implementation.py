from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from ._test_async_foreign_side_functions_struct_type import TestAsyncForeignSideFunctionsStruct
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_defaultExercise6: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    const42: fishyjoes_runtime.ConsumedRef,
    iabs: fishyjoes_runtime.ConsumedRef,
    intCompose: fishyjoes_runtime.ConsumedRef,
    add3Things: fishyjoes_runtime.ConsumedRef,
    makeList: fishyjoes_runtime.ConsumedRef,
    fifthThing: fishyjoes_runtime.ConsumedRef,
    six: fishyjoes_runtime.ConsumedRef,
    willThrow: fishyjoes_runtime.ConsumedRef,
    exercise0Fun: fishyjoes_runtime.ConsumedRef,
    exercise1Fun: fishyjoes_runtime.ConsumedRef,
    exercise2Fun: fishyjoes_runtime.ConsumedRef,
    exercise3Fun: fishyjoes_runtime.ConsumedRef,
    exercise4Fun: fishyjoes_runtime.ConsumedRef,
    exercise5Fun: fishyjoes_runtime.ConsumedRef,
    exercise6Fun: fishyjoes_runtime.ConsumedRef,
    thunkTwiceMakerFun: fishyjoes_runtime.ConsumedRef
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(TestAsyncForeignSideFunctionsStruct(
        const42 = fishyjoes_runtime.consume_ref(const42, "Callable"),
        iabs = fishyjoes_runtime.consume_ref(iabs, "Callable"),
        intCompose = fishyjoes_runtime.consume_ref(intCompose, "Callable"),
        add3Things = fishyjoes_runtime.consume_ref(add3Things, "Callable"),
        makeList = fishyjoes_runtime.consume_ref(makeList, "Callable"),
        fifthThing = fishyjoes_runtime.consume_ref(fifthThing, "Callable"),
        six = fishyjoes_runtime.consume_ref(six, "Callable"),
        willThrow = fishyjoes_runtime.consume_ref(willThrow, "Callable"),
        exercise0Fun = fishyjoes_runtime.consume_ref(exercise0Fun, "Callable"),
        exercise1Fun = fishyjoes_runtime.consume_ref(exercise1Fun, "Callable"),
        exercise2Fun = fishyjoes_runtime.consume_ref(exercise2Fun, "Callable"),
        exercise3Fun = fishyjoes_runtime.consume_ref(exercise3Fun, "Callable"),
        exercise4Fun = fishyjoes_runtime.consume_ref(exercise4Fun, "Callable"),
        exercise5Fun = fishyjoes_runtime.consume_ref(exercise5Fun, "Callable"),
        exercise6Fun = fishyjoes_runtime.consume_ref(exercise6Fun, "Callable"),
        thunkTwiceMakerFun = fishyjoes_runtime.consume_ref(thunkTwiceMakerFun, "Callable"),
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
def _ffi_get_intCompose(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).intCompose)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_add3Things(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).add3Things)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_makeList(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).makeList)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_fifthThing(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).fifthThing)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_six(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).six)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_willThrow(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).willThrow)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise0Fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise0Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise1Fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise1Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise2Fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise2Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise3Fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise3Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise4Fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise4Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise5Fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise5Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_exercise6Fun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).exercise6Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_thunkTwiceMakerFun(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestAsyncForeignSideFunctionsStruct).thunkTwiceMakerFun)

# MARK: setup

# TODO: setup for testapi.TestAsyncForeignSideFunctionsStruct
