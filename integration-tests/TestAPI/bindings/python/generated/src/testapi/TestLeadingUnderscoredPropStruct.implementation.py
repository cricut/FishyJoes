# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    _leadingUnderscoreProp: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(TestLeadingUnderscoredPropStruct(
        _leadingUnderscoreProp=consumeRef(_leadingUnderscoreProp),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get__leadingUnderscoreProp(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestLeadingUnderscoredPropStruct).leadingUnderscoreProp_)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set__leadingUnderscoreProp(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TestLeadingUnderscoredPropStruct).leadingUnderscoreProp_ = consumeRef(newValue, str)

# MARK: setup
