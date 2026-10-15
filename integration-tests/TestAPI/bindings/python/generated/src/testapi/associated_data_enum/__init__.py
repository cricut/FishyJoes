from __future__ import annotations
from .. import _associated_data_enum_implementation as _impl
from .. import _testapi_exported as testapi
from .bar import Bar
from .no_value import NoValue
from .none_ import None_
from .other import Other
from .simple_enum import SimpleEnum
from .thing import Thing
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "Thing",
    "Other",
    "Bar",
    "NoValue",
    "None_",
    "SimpleEnum",
    "get_static_thing",
]

def get_static_thing() -> testapi.AssociatedDataEnum:
    """<!-- FishyJoes.export(staticThing) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AssociatedDataEnum_staticThing(fishyjoes_runtime.Runtime.shared.env_ref), testapi.associated_data_enum.Thing, testapi.associated_data_enum.Other, testapi.associated_data_enum.Bar, testapi.associated_data_enum.NoValue, testapi.associated_data_enum.None_, testapi.associated_data_enum.SimpleEnum)
