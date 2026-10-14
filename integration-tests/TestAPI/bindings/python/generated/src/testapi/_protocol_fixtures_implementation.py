from __future__ import annotations
from . import _testapi_exported as testapi
from . import protocol_fixtures
from ._c_api import _testapi_lib
from ._protocol_fixtures_type import ProtocolFixtures
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_ProtocolFixtures_describeAProtocol: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_ProtocolFixtures_describeAProtocol'))

iota_TestAPI_ProtocolFixtures_returnAProtocol: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_ProtocolFixtures_returnAProtocol'))

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, object):
        case unknown: raise ValueError(f'Unknown ProtocolFixtures case "{unknown})". Enums are not meant to be extended.')

# MARK: setup

# TODO: setup for testapi.ProtocolFixtures
