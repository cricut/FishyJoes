from __future__ import annotations
from .. import _associated_data_enum_implementation as _impl
from .. import _testapi_exported as testapi
from ._bar_type import Bar
from ._no_value_type import NoValue
from ._none__type import None_
from ._other_type import Other
from ._simple_enum_type import SimpleEnum
from ._thing_type import Thing
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
