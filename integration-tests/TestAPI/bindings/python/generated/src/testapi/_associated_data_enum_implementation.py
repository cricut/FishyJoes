from . import _testapi_exported as testapi
from . import associated_data_enum
from ._associated_data_enum_type import AssociatedDataEnum
from ._c_api import _testapi_lib
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_TestAPI_AssociatedDataEnum_plus: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_get_TestAPI_AssociatedDataEnum_intValue: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

iota_get_TestAPI_AssociatedDataEnum_staticThing: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, AssociatedDataEnum):
        case associated_data_enum.Thing: return 0
        case associated_data_enum.Other: return 1
        case associated_data_enum.Bar: return 2
        case associated_data_enum.NoValue: return 3
        case associated_data_enum.None_: return 4
        case associated_data_enum.SimpleEnum: return 5
        case unknown: raise ValueError(f'Unknown AssociatedDataEnum case "{unknown})". Enums are not meant to be extended.')

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_thing(
    value: fishyjoes_runtime.ConsumedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(associated_data_enum.Thing(
        fishyjoes_runtime.consume_ref(value, int), # type: ignore[arg-type]
    ))

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_Thing(
    obj: fishyjoes_runtime.UnownedRef,
    out_value: fishyjoes_runtime.OutCreatedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, associated_data_enum.Thing)
    out_value[0] = fishyjoes_runtime.create_ref(self.value)

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_other(
    unnamed: fishyjoes_runtime.ConsumedRef,
    _1: fishyjoes_runtime.ConsumedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(associated_data_enum.Other(
        fishyjoes_runtime.consume_ref(unnamed, str), # type: ignore[arg-type]
        fishyjoes_runtime.consume_ref(_1, int), # type: ignore[arg-type]
    ))

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_Other(
    obj: fishyjoes_runtime.UnownedRef,
    out_unnamed: fishyjoes_runtime.OutCreatedRef,
    out__1: fishyjoes_runtime.OutCreatedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, associated_data_enum.Other)
    out_unnamed[0] = fishyjoes_runtime.create_ref(self.unnamed)
    out__1[0] = fishyjoes_runtime.create_ref(self._1)

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_bar(
    named: fishyjoes_runtime.ConsumedRef,
    _1: fishyjoes_runtime.ConsumedRef,
    toggled: fishyjoes_runtime.ConsumedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(associated_data_enum.Bar(
        fishyjoes_runtime.consume_ref(named, str), # type: ignore[arg-type]
        fishyjoes_runtime.consume_ref(_1, testapi.associated_data_enum.Thing, testapi.associated_data_enum.Other, testapi.associated_data_enum.Bar, testapi.associated_data_enum.NoValue, testapi.associated_data_enum.None_, testapi.associated_data_enum.SimpleEnum), # type: ignore[arg-type]
        fishyjoes_runtime.consume_ref(toggled, bool), # type: ignore[arg-type]
    ))

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_Bar(
    obj: fishyjoes_runtime.UnownedRef,
    out_named: fishyjoes_runtime.OutCreatedRef,
    out__1: fishyjoes_runtime.OutCreatedRef,
    out_toggled: fishyjoes_runtime.OutCreatedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, associated_data_enum.Bar)
    out_named[0] = fishyjoes_runtime.create_ref(self.named)
    out__1[0] = fishyjoes_runtime.create_ref(self._1)
    out_toggled[0] = fishyjoes_runtime.create_ref(self.toggled)

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_no_value(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(associated_data_enum.NoValue(
    ))

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_NoValue(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, associated_data_enum.NoValue)

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_none_(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(associated_data_enum.None_(
    ))

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_None_(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, associated_data_enum.None_)

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_simple_enum(
    value: fishyjoes_runtime.ConsumedRef,
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(associated_data_enum.SimpleEnum(
        fishyjoes_runtime.consume_ref(value, testapi.simple_enum.Red, testapi.simple_enum.Green, testapi.simple_enum.Blue), # type: ignore[arg-type]
    ))

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_SimpleEnum(
    obj: fishyjoes_runtime.UnownedRef,
    out_value: fishyjoes_runtime.OutCreatedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, associated_data_enum.SimpleEnum)
    out_value[0] = fishyjoes_runtime.create_ref(self.value)

# MARK: setup

# TODO: setup for testapi.AssociatedDataEnum
