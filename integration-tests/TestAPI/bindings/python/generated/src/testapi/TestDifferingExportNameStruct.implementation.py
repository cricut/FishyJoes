# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    tata: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(TestDifferingExportNameStruct(
        tata=consumeRef(tata),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_tata(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TestDifferingExportNameStruct).tata)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_tata(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TestDifferingExportNameStruct).tata = consumeRef(newValue, int)

# MARK: setup
