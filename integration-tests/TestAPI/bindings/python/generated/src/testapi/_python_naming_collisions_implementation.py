from __future__ import annotations
from . import _testapi_exported as testapi
from . import python_naming_collisions
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_PythonNamingCollisions_class: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions_class'))

iota_get_TestAPI_PythonNamingCollisions___dunder__: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions___dunder__'))

iota_get_TestAPI_PythonNamingCollisions_isNaN: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions_isNaN'))

iota_get_TestAPI_PythonNamingCollisions__leadingUnderscore: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions__leadingUnderscore'))

iota_get_TestAPI_PythonNamingCollisions_list: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions_list'))

iota_get_TestAPI_PythonNamingCollisions_Url: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions_Url'))

iota_get_TestAPI_PythonNamingCollisions_URL: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_PythonNamingCollisions_URL'))

iota_TestAPI_PythonNamingCollisions_from: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_PythonNamingCollisions_from'))

# MARK: C callback implementations

# MARK: setup

# TODO: setup for testapi.PythonNamingCollisions
