from __future__ import annotations
from . import _testapi_exported as testapi
from . import reference_empty_enum
from ._c_api import _testapi_lib
from ._reference_empty_enum_type import ReferenceEmptyEnum
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_ReferenceEmptyEnum_aStaticProperty: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_ReferenceEmptyEnum_aStaticProperty'))

iota_TestAPI_ReferenceEmptyEnum_notGoingToHappen: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_ReferenceEmptyEnum_notGoingToHappen'))

iota_TestAPI_ReferenceEmptyEnum_aStaticMethod: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_ReferenceEmptyEnum_aStaticMethod'))

# MARK: C callback implementations

# MARK: setup

# TODO: setup for testapi.ReferenceEmptyEnum
