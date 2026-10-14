from __future__ import annotations
from . import _testapi_exported as testapi
from . import python_naming_collisions
from ._c_api import _testapi_lib
from ._python_naming_collisions_type import PythonNamingCollisions
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_PythonNamingCollisions_from: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_PythonNamingCollisions_from'))

iota_get_TestAPI_PythonNamingCollisions_class_: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions_class_'))

iota_get_TestAPI_PythonNamingCollisions_dunder____: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions_dunder____'))

iota_get_TestAPI_PythonNamingCollisions_is_na_n: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions_is_na_n'))

iota_get_TestAPI_PythonNamingCollisions_leading_underscore_: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions_leading_underscore_'))

iota_get_TestAPI_PythonNamingCollisions_list: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions_list'))

iota_get_TestAPI_PythonNamingCollisions_title_url: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions_title_url'))

iota_get_TestAPI_PythonNamingCollisions_url: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions_url'))

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, object):
        case unknown: raise ValueError(f'Unknown PythonNamingCollisions case "{unknown})". Enums are not meant to be extended.')

# MARK: setup

# TODO: setup for testapi.PythonNamingCollisions
