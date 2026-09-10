# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    message: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(Error(
        message=consumeRef(message),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_message(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, Error).message)

# MARK: setup
