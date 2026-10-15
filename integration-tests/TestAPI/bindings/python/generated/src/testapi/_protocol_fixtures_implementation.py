from __future__ import annotations
from . import _testapi_exported as testapi
from . import protocol_fixtures
from ._c_api import _testapi_lib
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

# MARK: setup

# TODO: setup for testapi.ProtocolFixtures
