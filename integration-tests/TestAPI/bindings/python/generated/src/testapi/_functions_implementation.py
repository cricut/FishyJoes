from __future__ import annotations
from . import _testapi_exported as testapi
from . import functions
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_Functions_add3Things: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Functions_add3Things'))

iota_get_TestAPI_Functions_const42: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Functions_const42'))

iota_get_TestAPI_Functions_fifthThing: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Functions_fifthThing'))

iota_get_TestAPI_Functions_abs: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Functions_abs'))

iota_get_TestAPI_Functions_intCompose: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Functions_intCompose'))

iota_get_TestAPI_Functions_makeList: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Functions_makeList'))

iota_get_TestAPI_Functions_sixthThing: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Functions_sixthThing'))

iota_TestAPI_Functions_exercise0: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Functions_exercise0'))

iota_TestAPI_Functions_exercise1: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Functions_exercise1'))

iota_TestAPI_Functions_exercise2: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Functions_exercise2'))

iota_TestAPI_Functions_exercise3: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Functions_exercise3'))

iota_TestAPI_Functions_exercise4: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Functions_exercise4'))

iota_TestAPI_Functions_exercise5: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Functions_exercise5'))

iota_TestAPI_Functions_exercise6: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Functions_exercise6'))

iota_TestAPI_Functions_willThrow: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Functions_willThrow'))

iota_TestAPI_Functions_thunkTwiceMaker: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Functions_thunkTwiceMaker'))

# MARK: C callback implementations

# MARK: setup

# TODO: setup for testapi.Functions
