# MARK: C APIs

__iota_TestAPI_Structs_MutableStruct_asyncGetI: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_Structs_MutableStruct_create: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_Structs_MutableStruct_increment: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_Structs_MutableStruct_incrementAsync: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    i: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(MutableStruct(
        i=consumeRef(i),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_i(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, MutableStruct).i)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_i(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, MutableStruct).i = consumeRef(newValue, int)

# MARK: setup
