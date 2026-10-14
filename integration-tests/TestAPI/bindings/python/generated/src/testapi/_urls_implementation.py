from __future__ import annotations
from . import _testapi_exported as testapi
from . import urls
from ._c_api import _testapi_lib
from ._urls_type import Urls
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_URLs_echo: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    str,
], str] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_URLs_echo'))

iota_get_TestAPI_URLs_data_image: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], str] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_URLs_data_image'))

iota_get_TestAPI_URLs_local_file: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], str] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_URLs_local_file'))

iota_get_TestAPI_URLs_remote_file: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], str] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_URLs_remote_file'))

iota_get_TestAPI_URLs_simple: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], str] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_URLs_simple'))

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, object):
        case unknown: raise ValueError(f'Unknown Urls case "{unknown})". Enums are not meant to be extended.')

# MARK: setup

# TODO: setup for testapi.Urls
