# MARK: C APIs

__iota_TestAPI_Structs_MemberwiseStruct_asyncGetMutable: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_Structs_MemberwiseStruct_create: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    immutable: TODO[ffiConsumedName],
    mutable: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(MemberwiseStruct(
        immutable=consumeRef(immutable),
        mutable=consumeRef(mutable),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_immutable(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, MemberwiseStruct)._immutable)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_immutable(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, MemberwiseStruct)._immutable = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_mutable(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, MemberwiseStruct).mutable)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_mutable(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, MemberwiseStruct).mutable = consumeRef(newValue, str)

# MARK: setup
