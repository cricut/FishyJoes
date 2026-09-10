# MARK: C APIs

__iota_TestAPI_Structs_ReferenceStruct_asyncGetMutable: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_Structs_ReferenceStruct_create: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_Structs_ReferenceStruct_equals: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_Structs_ReferenceStruct_hash: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_Structs_ReferenceStruct_immutable: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_Structs_ReferenceStruct_mutable: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_set_TestAPI_Structs_ReferenceStruct_mutable: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
    createRef(ReferenceStruct(ref))
);

# MARK: setup
