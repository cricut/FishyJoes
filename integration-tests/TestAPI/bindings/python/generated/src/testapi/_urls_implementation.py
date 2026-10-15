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

iota_get_TestAPI_URLs_dataImage: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], str] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_URLs_dataImage'))

iota_get_TestAPI_URLs_localFile: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], str] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_URLs_localFile'))

iota_get_TestAPI_URLs_remoteFile: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], str] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_URLs_remoteFile'))

iota_get_TestAPI_URLs_simple: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], str] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_URLs_simple'))

iota_TestAPI_URLs_echo: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    str,
], str] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_URLs_echo'))

# MARK: C callback implementations

# MARK: setup

# TODO: setup for testapi.Urls
