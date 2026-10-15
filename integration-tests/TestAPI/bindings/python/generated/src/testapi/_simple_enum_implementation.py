from __future__ import annotations
from . import _testapi_exported as testapi
from . import simple_enum
from ._c_api import _testapi_lib
from ._simple_enum_type import _BaseSimpleEnum
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_SimpleEnum_favoriteColor: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_SimpleEnum_favoriteColor'))

iota_set_TestAPI_SimpleEnum_favoriteColor: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_set_TestAPI_SimpleEnum_favoriteColor'))

iota_get_TestAPI_SimpleEnum_hex: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_SimpleEnum_hex'))

iota_TestAPI_SimpleEnum_pickAColor: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_SimpleEnum_pickAColor'))

iota_TestAPI_SimpleEnum_hexMethod: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_SimpleEnum_hexMethod'))

iota_TestAPI_SimpleEnum_resetFavoriteColor: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_SimpleEnum_resetFavoriteColor'))

# MARK: C callback implementations

@fishyjoes_runtime.callback("TestAPI_SimpleEnum_DiscriminatorFn")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, _BaseSimpleEnum):
        case simple_enum.Red: return 0
        case simple_enum.Green: return 1
        case simple_enum.Blue: return 2
        case unknown: raise ValueError(f'Unknown SimpleEnum case "{unknown})". Enums are not meant to be extended.')

@fishyjoes_runtime.callback("TestAPI_SimpleEnum_RedConstructorFn")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_red(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(simple_enum.Red(
    ))

@fishyjoes_runtime.callback("TestAPI_SimpleEnum_RedExtractorFn")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_red(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, simple_enum.Red)

@fishyjoes_runtime.callback("TestAPI_SimpleEnum_GreenConstructorFn")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_green(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(simple_enum.Green(
    ))

@fishyjoes_runtime.callback("TestAPI_SimpleEnum_GreenExtractorFn")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_green(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, simple_enum.Green)

@fishyjoes_runtime.callback("TestAPI_SimpleEnum_BlueConstructorFn")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_blue(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(simple_enum.Blue(
    ))

@fishyjoes_runtime.callback("TestAPI_SimpleEnum_BlueExtractorFn")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_blue(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, simple_enum.Blue)

# MARK: setup

# TODO: setup for testapi.SimpleEnum
