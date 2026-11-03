from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_TestMethodsProtocol_foo: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestMethodsProtocol_foo'))

iota_TestAPI_TestMethodsProtocol_bar: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], bool] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestMethodsProtocol_bar'))

iota_TestAPI_TestMethodsProtocol_baz: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    bool,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestMethodsProtocol_baz'))

iota_TestAPI_TestMethodsProtocol_garply: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestMethodsProtocol_garply'))

iota_TestAPI_TestMethodsProtocol_xyzzy: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    int,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestMethodsProtocol_xyzzy'))

iota_TestAPI_TestMethodsProtocol_plugh: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_TestMethodsProtocol_plugh'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TestAPI_TestMethodsProtocol_foo_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def ffi_method_foo(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    return fishyjoes_runtime.peek_ref(obj, testapi.TestMethodsProtocol).foo(
    )

@fishyjoes_runtime.callback('TestAPI_TestMethodsProtocol_bar_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=False)
def ffi_method_bar(
    obj: fishyjoes_runtime.UnownedRef,
) -> bool:
    return fishyjoes_runtime.peek_ref(obj, testapi.TestMethodsProtocol).bar(
    )

@fishyjoes_runtime.callback('TestAPI_TestMethodsProtocol_baz_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def ffi_method_baz(
    obj: fishyjoes_runtime.UnownedRef,
    qux: bool,
) -> None:
    return fishyjoes_runtime.peek_ref(obj, testapi.TestMethodsProtocol).baz(
        qux,
    )

@fishyjoes_runtime.callback('TestAPI_TestMethodsProtocol_garply_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_garply(
    obj: fishyjoes_runtime.UnownedRef,
    _0: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestMethodsProtocol).garply(
            fishyjoes_runtime.peek_ref(_0, str),
        )
    )

@fishyjoes_runtime.callback('TestAPI_TestMethodsProtocol_xyzzy_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_xyzzy(
    obj: fishyjoes_runtime.UnownedRef,
    thud: int,
    grault: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestMethodsProtocol).xyzzy(
            thud,
            fishyjoes_runtime.peek_ref(grault, list),
        )
    )

@fishyjoes_runtime.callback('TestAPI_TestMethodsProtocol_plugh_methodFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_method_plugh(
    obj: fishyjoes_runtime.UnownedRef,
    fred: fishyjoes_runtime.UnownedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(
        fishyjoes_runtime.peek_ref(obj, testapi.TestMethodsProtocol).plugh(
            fishyjoes_runtime.peek_ref(fred, tuple),
        )
    )

# MARK: setup
