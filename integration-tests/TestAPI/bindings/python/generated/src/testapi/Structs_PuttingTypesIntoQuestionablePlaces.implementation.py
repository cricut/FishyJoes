# MARK: C APIs

__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
    createRef(Structs_PuttingTypesIntoQuestionablePlaces(ref))
);

# MARK: setup
