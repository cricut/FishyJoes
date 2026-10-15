from __future__ import annotations
from . import _testapi_exported as testapi
from . import associated_data_enum
from ._associated_data_enum_type import AssociatedDataEnum
from ._associated_data_enum_type import _BaseAssociatedDataEnum
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_AssociatedDataEnum_intValue: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_AssociatedDataEnum_intValue'))

iota_get_TestAPI_AssociatedDataEnum_staticThing: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_AssociatedDataEnum_staticThing'))

iota_TestAPI_AssociatedDataEnum_plus: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_AssociatedDataEnum_plus'))

# MARK: C callback implementations

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_Discriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, _BaseAssociatedDataEnum):
        case associated_data_enum.Thing: return 0
        case associated_data_enum.Other: return 1
        case associated_data_enum.Bar: return 2
        case associated_data_enum.NoValue: return 3
        case associated_data_enum.None_: return 4
        case associated_data_enum.SimpleEnum: return 5
        case unknown: raise ValueError(f'Unknown AssociatedDataEnum case "{unknown})". Enums are not meant to be extended.')

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_ThingConstructor")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_thing(
    value: fishyjoes_runtime.ConsumedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(associated_data_enum.Thing(
        fishyjoes_runtime.consume_ref(value, int),
    ))

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_ThingExtractor")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_thing(
    obj: fishyjoes_runtime.UnownedRef,
    out_value: fishyjoes_runtime.OutCreatedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, associated_data_enum.Thing)
    out_value[0] = fishyjoes_runtime.create_ref(self.value)

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_OtherConstructor")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_other(
    unnamed: fishyjoes_runtime.ConsumedRef,
    _1: fishyjoes_runtime.ConsumedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(associated_data_enum.Other(
        fishyjoes_runtime.consume_ref(unnamed, str),
        fishyjoes_runtime.consume_ref(_1, int),
    ))

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_OtherExtractor")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_other(
    obj: fishyjoes_runtime.UnownedRef,
    out_unnamed: fishyjoes_runtime.OutCreatedRef,
    out__1: fishyjoes_runtime.OutCreatedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, associated_data_enum.Other)
    out_unnamed[0] = fishyjoes_runtime.create_ref(self.unnamed)
    out__1[0] = fishyjoes_runtime.create_ref(self._1)

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_BarConstructor")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_bar(
    named: fishyjoes_runtime.ConsumedRef,
    _1: fishyjoes_runtime.ConsumedRef,
    toggled: fishyjoes_runtime.ConsumedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(associated_data_enum.Bar(
        fishyjoes_runtime.consume_ref(named, str),
        fishyjoes_runtime.consume_ref(_1, testapi.associated_data_enum.Thing, testapi.associated_data_enum.Other, testapi.associated_data_enum.Bar, testapi.associated_data_enum.NoValue, testapi.associated_data_enum.None_, testapi.associated_data_enum.SimpleEnum),
        fishyjoes_runtime.consume_ref(toggled, bool),
    ))

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_BarExtractor")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_bar(
    obj: fishyjoes_runtime.UnownedRef,
    out_named: fishyjoes_runtime.OutCreatedRef,
    out__1: fishyjoes_runtime.OutCreatedRef,
    out_toggled: fishyjoes_runtime.OutCreatedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, associated_data_enum.Bar)
    out_named[0] = fishyjoes_runtime.create_ref(self.named)
    out__1[0] = fishyjoes_runtime.create_ref(self._1)
    out_toggled[0] = fishyjoes_runtime.create_ref(self.toggled)

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_NoValueConstructor")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_no_value(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(associated_data_enum.NoValue(
    ))

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_NoValueExtractor")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_no_value(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, associated_data_enum.NoValue)

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_NoneConstructor")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_none(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(associated_data_enum.None_(
    ))

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_NoneExtractor")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_none(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, associated_data_enum.None_)

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_SimpleEnumConstructor")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_simple_enum(
    value: fishyjoes_runtime.ConsumedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(associated_data_enum.SimpleEnum(
        fishyjoes_runtime.consume_ref(value, testapi.simple_enum.Red, testapi.simple_enum.Green, testapi.simple_enum.Blue),
    ))

@fishyjoes_runtime.callback("TestAPI_AssociatedDataEnum_SimpleEnumExtractor")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_simple_enum(
    obj: fishyjoes_runtime.UnownedRef,
    out_value: fishyjoes_runtime.OutCreatedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, associated_data_enum.SimpleEnum)
    out_value[0] = fishyjoes_runtime.create_ref(self.value)

# MARK: setup

# TODO: setup for testapi.AssociatedDataEnum
