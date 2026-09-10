# MARK: C APIs

__iota_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_testCall: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    x: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(AttributedString_PuttingTypesIntoQuestionablePlaces(
        x=consumeRef(x),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_x(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, AttributedString_PuttingTypesIntoQuestionablePlaces).x)

# MARK: setup
