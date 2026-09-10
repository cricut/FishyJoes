# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    value: TODO[ffiConsumedName],
    children: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(Tree(
        value=consumeRef(value),
        children=consumeRef(children),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_value(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, Tree).value)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_children(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, Tree).children)

# MARK: setup
