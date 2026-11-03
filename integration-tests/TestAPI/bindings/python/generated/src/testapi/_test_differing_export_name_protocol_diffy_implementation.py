from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_TestDifferingExportNameProtocol_tata: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], int] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestDifferingExportNameProtocol_tata'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TestAPI_TestDifferingExportNameProtocol_tata_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=0)
def ffi_get_tata(obj: fishyjoes_runtime.UnownedRef) -> int:
    return fishyjoes_runtime.peek_ref(obj, testapi.TestDifferingExportNameProtocolDiffy).tata

# MARK: setup
