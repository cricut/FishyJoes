# MARK: C APIs

__iota_TestAPI_TestNonExportedProtocolEnum_hoge: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_TestNonExportedProtocolEnum_fuga: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def _enum_discriminator(objRef: UnownedHostRef) -> int:
    match peekRef(obj, TestNonExportedProtocolEnum):
        case Test_Non_Exported_Protocol_Enum.Hogehoge: return 0
        case unknown: raise ValueError(f'Unknown TestNonExportedProtocolEnum case "{unknown})". Enums are not meant to be extended.')

static CreatedRef newHogehoge(
    OutCreatedRef exn
) => catchingRef(exn, () =>
    createRef(TestNonExportedProtocolEnum_Hogehoge(
    ))
)

static void extractHogehoge(
    UnownedRef obj,
    OutCreatedRef exn
) {
    catching(exn, () {
        final _self = peekRef<TestNonExportedProtocolEnum_Hogehoge>(obj)
    })
}

# MARK: setup

# TODO: setup for testapi.TestNonExportedProtocolEnum
