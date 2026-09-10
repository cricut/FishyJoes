# MARK: C APIs

__iota__default_TestAPI_TestDefaultComputedPropertiesStruct_plutonic: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    spam: TODO[ffiConsumedName],
    noot: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(TestDefaultComputedPropertiesStruct(
        spam=consumeRef(spam),
        noot=consumeRef(noot),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_spam(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestDefaultComputedPropertiesStruct).spam)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_spam(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TestDefaultComputedPropertiesStruct).spam = consumeRef(newValue, bool)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_noot(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestDefaultComputedPropertiesStruct).noot)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_noot(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TestDefaultComputedPropertiesStruct).noot = consumeRef(newValue, int)

# MARK: setup
