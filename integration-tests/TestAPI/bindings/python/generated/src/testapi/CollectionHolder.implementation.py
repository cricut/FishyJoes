# MARK: C APIs

__iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_Collections_CollectionHolder_staticProperty: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    boolArray: TODO[ffiConsumedName],
    boolSet: TODO[ffiConsumedName],
    boolDictionary: TODO[ffiConsumedName],
    integerArray: TODO[ffiConsumedName],
    integerSet: TODO[ffiConsumedName],
    integerDictionary: TODO[ffiConsumedName],
    stringArray: TODO[ffiConsumedName],
    stringSet: TODO[ffiConsumedName],
    stringDictionary: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(CollectionHolder(
        boolArray=consumeRef(boolArray),
        boolSet=consumeRef(boolSet),
        boolDictionary=consumeRef(boolDictionary),
        integerArray=consumeRef(integerArray),
        integerSet=consumeRef(integerSet),
        integerDictionary=consumeRef(integerDictionary),
        stringArray=consumeRef(stringArray),
        stringSet=consumeRef(stringSet),
        stringDictionary=consumeRef(stringDictionary),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_boolArray(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, CollectionHolder).boolArray)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_boolArray(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, CollectionHolder).boolArray = consumeRef(newValue, list)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_boolSet(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, CollectionHolder).boolSet)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_boolSet(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, CollectionHolder).boolSet = consumeRef(newValue, set)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_boolDictionary(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, CollectionHolder).boolDictionary)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_boolDictionary(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, CollectionHolder).boolDictionary = consumeRef(newValue, dict)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_integerArray(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, CollectionHolder).integerArray)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_integerArray(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, CollectionHolder).integerArray = consumeRef(newValue, list)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_integerSet(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, CollectionHolder).integerSet)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_integerSet(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, CollectionHolder).integerSet = consumeRef(newValue, set)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_integerDictionary(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, CollectionHolder).integerDictionary)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_integerDictionary(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, CollectionHolder).integerDictionary = consumeRef(newValue, dict)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_stringArray(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, CollectionHolder).stringArray)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_stringArray(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, CollectionHolder).stringArray = consumeRef(newValue, list)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_stringSet(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, CollectionHolder).stringSet)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_stringSet(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, CollectionHolder).stringSet = consumeRef(newValue, set)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_stringDictionary(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, CollectionHolder).stringDictionary)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_stringDictionary(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, CollectionHolder).stringDictionary = consumeRef(newValue, dict)

# MARK: setup
