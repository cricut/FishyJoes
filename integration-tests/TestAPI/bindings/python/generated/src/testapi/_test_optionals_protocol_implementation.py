from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_TestOptionalsProtocol_flarp: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_TestOptionalsProtocol_flarp'))

iota_TestAPI_TestOptionalsProtocol_wombat: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestOptionalsProtocol_wombat'))

iota_TestAPI_TestOptionalsProtocol_spqr: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], int] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestOptionalsProtocol_spqr'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TestAPI_TestOptionalsProtocol_flarp_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_get_flarp(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.TestOptionalsProtocol).flarp)

@fishyjoes_runtime.callback('TestAPI_TestOptionalsProtocol_wombat_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_wombat(
    obj: fishyjoes_runtime.UnownedRef,
    zxc: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestOptionalsProtocol).wombat(
            fishyjoes_runtime.peek_ref(zxc, int, types.NoneType),
        )
    )

@fishyjoes_runtime.callback('TestAPI_TestOptionalsProtocol_spqr_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=0)
def ffi_method_spqr(
    obj: fishyjoes_runtime.UnownedRef,
    pippo: fishyjoes_runtime.UnownedRef,
) -> int:
    return fishyjoes_runtime.peek_ref(obj, testapi.TestOptionalsProtocol).spqr(
        fishyjoes_runtime.peek_ref(pippo, testapi.associated_data_enum.Thing, testapi.associated_data_enum.Other, testapi.associated_data_enum.Bar, testapi.associated_data_enum.NoValue, testapi.associated_data_enum.None_, testapi.associated_data_enum.SimpleEnum),
    )

# MARK: setup
