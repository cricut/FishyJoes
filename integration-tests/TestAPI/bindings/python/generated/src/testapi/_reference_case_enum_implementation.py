from __future__ import annotations
from . import _testapi_exported as testapi
from . import reference_case_enum
from ._c_api import _testapi_lib
from ._reference_case_enum_type import ReferenceCaseEnum
from ._reference_case_enum_type import _BaseReferenceCaseEnum
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_ReferenceCaseEnum_defaultDirection: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_ReferenceCaseEnum_defaultDirection'))

iota_get_TestAPI_ReferenceCaseEnum_opposite: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_ReferenceCaseEnum_opposite'))

iota_TestAPI_ReferenceCaseEnum_rotate180: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_ReferenceCaseEnum_rotate180'))

# MARK: C callback implementations

@fishyjoes_runtime.callback("TestAPI_ReferenceCaseEnum_Discriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, _BaseReferenceCaseEnum):
        case reference_case_enum.North: return 0
        case reference_case_enum.South: return 1
        case reference_case_enum.East: return 2
        case reference_case_enum.West: return 3
        case unknown: raise ValueError(f'Unknown ReferenceCaseEnum case "{unknown})". Enums are not meant to be extended.')

@fishyjoes_runtime.callback("TestAPI_ReferenceCaseEnum_NorthConstructor")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_north(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(reference_case_enum.North(
    ))

@fishyjoes_runtime.callback("TestAPI_ReferenceCaseEnum_NorthExtractor")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_north(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, reference_case_enum.North)

@fishyjoes_runtime.callback("TestAPI_ReferenceCaseEnum_SouthConstructor")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_south(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(reference_case_enum.South(
    ))

@fishyjoes_runtime.callback("TestAPI_ReferenceCaseEnum_SouthExtractor")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_south(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, reference_case_enum.South)

@fishyjoes_runtime.callback("TestAPI_ReferenceCaseEnum_EastConstructor")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_east(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(reference_case_enum.East(
    ))

@fishyjoes_runtime.callback("TestAPI_ReferenceCaseEnum_EastExtractor")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_east(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, reference_case_enum.East)

@fishyjoes_runtime.callback("TestAPI_ReferenceCaseEnum_WestConstructor")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_west(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(reference_case_enum.West(
    ))

@fishyjoes_runtime.callback("TestAPI_ReferenceCaseEnum_WestExtractor")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_west(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, reference_case_enum.West)

# MARK: setup

# TODO: setup for testapi.ReferenceCaseEnum
