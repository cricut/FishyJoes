from . import _testapi_exported as testapi
from . import test_non_exported_protocol_enum
from ._c_api import _testapi_lib
from ._test_non_exported_protocol_enum_type import TestNonExportedProtocolEnum
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_TestNonExportedProtocolEnum_hoge: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_get_TestAPI_TestNonExportedProtocolEnum_fuga: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, TestNonExportedProtocolEnum):
        case test_non_exported_protocol_enum.Hogehoge: return 0
        case unknown: raise ValueError(f'Unknown TestNonExportedProtocolEnum case "{unknown})". Enums are not meant to be extended.')

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_hogehoge(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(test_non_exported_protocol_enum.Hogehoge(
    ))

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_Hogehoge(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, test_non_exported_protocol_enum.Hogehoge)

# MARK: setup

# TODO: setup for testapi.TestNonExportedProtocolEnum
