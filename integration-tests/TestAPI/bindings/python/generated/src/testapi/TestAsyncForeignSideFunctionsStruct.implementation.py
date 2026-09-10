# MARK: C APIs

__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_defaultExercise6: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    const42: TODO[ffiConsumedName],
    iabs: TODO[ffiConsumedName],
    intCompose: TODO[ffiConsumedName],
    add3Things: TODO[ffiConsumedName],
    makeList: TODO[ffiConsumedName],
    fifthThing: TODO[ffiConsumedName],
    six: TODO[ffiConsumedName],
    willThrow: TODO[ffiConsumedName],
    exercise0Fun: TODO[ffiConsumedName],
    exercise1Fun: TODO[ffiConsumedName],
    exercise2Fun: TODO[ffiConsumedName],
    exercise3Fun: TODO[ffiConsumedName],
    exercise4Fun: TODO[ffiConsumedName],
    exercise5Fun: TODO[ffiConsumedName],
    exercise6Fun: TODO[ffiConsumedName],
    thunkTwiceMakerFun: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(TestAsyncForeignSideFunctionsStruct(
        const42=consumeRef(const42),
        iabs=consumeRef(iabs),
        intCompose=consumeRef(intCompose),
        add3Things=consumeRef(add3Things),
        makeList=consumeRef(makeList),
        fifthThing=consumeRef(fifthThing),
        six=consumeRef(six),
        willThrow=consumeRef(willThrow),
        exercise0Fun=consumeRef(exercise0Fun),
        exercise1Fun=consumeRef(exercise1Fun),
        exercise2Fun=consumeRef(exercise2Fun),
        exercise3Fun=consumeRef(exercise3Fun),
        exercise4Fun=consumeRef(exercise4Fun),
        exercise5Fun=consumeRef(exercise5Fun),
        exercise6Fun=consumeRef(exercise6Fun),
        thunkTwiceMakerFun=consumeRef(thunkTwiceMakerFun),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_const42(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).const42)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_iabs(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).iabs)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_intCompose(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).intCompose)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_add3Things(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).add3Things)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_makeList(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).makeList)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_fifthThing(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).fifthThing)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_six(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).six)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_willThrow(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).willThrow)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_exercise0Fun(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).exercise0Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_exercise1Fun(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).exercise1Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_exercise2Fun(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).exercise2Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_exercise3Fun(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).exercise3Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_exercise4Fun(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).exercise4Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_exercise5Fun(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).exercise5Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_exercise6Fun(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).exercise6Fun)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_thunkTwiceMakerFun(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestAsyncForeignSideFunctionsStruct).thunkTwiceMakerFun)

# MARK: setup
