from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from warnings import deprecated
import collections.abc
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_AProtocol_baz: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], bool] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_AProtocol_baz'))

iota_get_TestAPI_AProtocol_foo: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_AProtocol_foo'))

iota_TestAPI_AProtocol_bar: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    int,
    int,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_AProtocol_bar'))

iota_TestAPI_AProtocol_hasADefaultImplementation: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    int,
    float,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_AProtocol_hasADefaultImplementation'))

iota_TestAPI_AProtocol_hasADefaultImplementation2: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    bool,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_AProtocol_hasADefaultImplementation2'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TestAPI_AProtocol_baz_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=False)
def ffi_get_baz(obj: fishyjoes_runtime.UnownedRef) -> bool:
    return fishyjoes_runtime.peek_ref(obj, testapi.AProtocol).baz

@fishyjoes_runtime.callback('TestAPI_AProtocol_foo_getFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_get_foo(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.AProtocol).foo)

@fishyjoes_runtime.callback('TestAPI_AProtocol_bar_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_bar(
    obj: fishyjoes_runtime.UnownedRef,
    x: int,
    y: int,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.AProtocol).bar(
            x,
            y,
        )
    )

@fishyjoes_runtime.callback('TestAPI_AProtocol_hasADefaultImplementation_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_has_a_default_implementation(
    obj: fishyjoes_runtime.UnownedRef,
    x: int,
    y: float,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.AProtocol).has_a_default_implementation(
            x,
            y,
        )
    )

@fishyjoes_runtime.callback('TestAPI_AProtocol_hasADefaultImplementation2_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_has_a_default_implementation2(
    obj: fishyjoes_runtime.UnownedRef,
    a: fishyjoes_runtime.UnownedRef,
    b: bool,
    c: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.AProtocol).has_a_default_implementation2(
            fishyjoes_runtime.peek_ref(a, str),
            b,
            fishyjoes_runtime.peek_ref(c, str),
        )
    )

# MARK: setup
