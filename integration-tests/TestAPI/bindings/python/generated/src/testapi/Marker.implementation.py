# MARK: C APIs

__iota_TestAPI_ReferenceOnlyTypes_Marker_equals: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_ReferenceOnlyTypes_Marker_hash: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
    createRef(Marker(ref))
);

# MARK: setup
