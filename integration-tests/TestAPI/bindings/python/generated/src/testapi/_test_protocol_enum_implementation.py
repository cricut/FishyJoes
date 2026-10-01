from . import _testapi_exported as testapi
from . import test_protocol_enum
from ._c_api import _testapi_lib
from ._test_protocol_enum_type import TestProtocolEnum
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_TestProtocolEnum_bar: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestProtocolEnum_baz: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestProtocolEnum_foo: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestProtocolEnum_garply: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestProtocolEnum_plugh: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_TestAPI_TestProtocolEnum_xyzzy: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, TestProtocolEnum):
        case test_protocol_enum.Qux: return 0
        case unknown: raise ValueError(f'Unknown TestProtocolEnum case "{unknown})". Enums are not meant to be extended.')

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_qux(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(test_protocol_enum.Qux(
    ))

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_Qux(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, test_protocol_enum.Qux)

# MARK: setup

# TODO: setup for testapi.TestProtocolEnum
