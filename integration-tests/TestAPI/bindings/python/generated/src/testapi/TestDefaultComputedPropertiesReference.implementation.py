# MARK: C APIs

__iota_TestAPI_TestDefaultComputedPropertiesClass_init: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota__default_TestAPI_TestDefaultComputedPropertiesClass_plutonic: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
    createRef(TestDefaultComputedPropertiesReference(ref))
);

# MARK: setup
