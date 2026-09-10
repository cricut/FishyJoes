# MARK: C APIs

__iota_TestAPI_AProtocolImplementation_bar: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_AProtocolImplementation_hasADefaultImplementation: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_AProtocolImplementation_hasADefaultImplementation2: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    foo: TODO[ffiConsumedName],
    baz: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(AProtocolImplementation(
        foo=consumeRef(foo),
        baz=consumeRef(baz),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_foo(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, AProtocolImplementation).foo)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_foo(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, AProtocolImplementation).foo = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_baz(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, AProtocolImplementation).baz)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_baz(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, AProtocolImplementation).baz = consumeRef(newValue, bool)

# MARK: setup
