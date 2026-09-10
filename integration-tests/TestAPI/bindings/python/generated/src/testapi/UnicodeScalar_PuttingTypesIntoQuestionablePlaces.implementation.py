# MARK: C APIs

__iota_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def _enum_discriminator(objRef: UnownedHostRef) -> int:
    match peekRef(obj, UnicodeScalar_PuttingTypesIntoQuestionablePlaces):
        case Unicode_Scalar__Putting_Types_Into_Questionable_Places.Thing: return 0
        case unknown: raise ValueError(f'Unknown UnicodeScalar_PuttingTypesIntoQuestionablePlaces case "{unknown})". Enums are not meant to be extended.')

static CreatedRef newThing(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing(
    ))
)

static void extractThing(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing>(obj)
    })
}

# MARK: setup

# TODO: setup for testapi.UnicodeScalar_PuttingTypesIntoQuestionablePlaces
