# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    darkness: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(Shade(
        darkness=consumeRef(darkness),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_darkness(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, Shade).darkness)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_darkness(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, Shade).darkness = consumeRef(newValue, float)

# MARK: setup
