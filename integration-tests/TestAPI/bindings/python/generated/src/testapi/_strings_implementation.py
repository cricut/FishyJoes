from __future__ import annotations
from . import _testapi_exported as testapi
from . import strings
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_Strings_accent: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Strings_accent'))

iota_get_TestAPI_Strings_chinese: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Strings_chinese'))

iota_get_TestAPI_Strings_chineseBMP: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Strings_chineseBMP'))

iota_get_TestAPI_Strings_chineseSIP: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Strings_chineseSIP'))

iota_get_TestAPI_Strings_emoji: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Strings_emoji'))

iota_get_TestAPI_Strings_emojiMulti: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Strings_emojiMulti'))

iota_get_TestAPI_Strings_script: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Strings_script'))

iota_get_TestAPI_Strings_simple: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Strings_simple'))

iota_TestAPI_Strings_echo: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Strings_echo'))

iota_TestAPI_Strings_split: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Strings_split'))

# MARK: C callback implementations

# MARK: setup

# TODO: setup for testapi.Strings
