from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from ._test_differing_export_name_protocol_diffy_type import TestDifferingExportNameProtocolDiffy
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_TestDifferingExportNameProtocol_tata: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestDifferingExportNameProtocol_tata'))

# MARK: C callback implementations

# MARK: setup

# TODO: setup for testapi.TestDifferingExportNameProtocolDiffy
