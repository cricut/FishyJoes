from __future__ import annotations
from . import _testapi_exported as testapi
from . import deprecations
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_Deprecations_deprecatedVariable: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Deprecations_deprecatedVariable'))

iota_TestAPI_Deprecations_deprecatedMethod: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Deprecations_deprecatedMethod'))

# MARK: C callback implementations

# MARK: setup

# TODO: setup for testapi.Deprecations
