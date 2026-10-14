from __future__ import annotations
from .. import _reference_empty_enum_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "get_a_static_property",
    "not_going_to_happen",
    "a_static_method",
]

def get_a_static_property() -> int:
    """<!-- FishyJoes.export(aStaticProperty) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ReferenceEmptyEnum_a_static_property(fishyjoes_runtime.Runtime.shared.env_ref), int)

def not_going_to_happen(
) -> testapi.ReferenceEmptyEnum:
    """<!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->"""
    _impl.iota_TestAPI_ReferenceEmptyEnum_notGoingToHappen(
        fishyjoes_runtime.Runtime.shared.env_ref,
    )
    raise AssertionError("Return type is uninhabited. Expected code to be unreachable")

def a_static_method(
) -> int:
    """<!-- FishyJoes.export(aStaticMethod) -->"""
    return fishyjoes_runtime.consume_created_ref(
        _impl.iota_TestAPI_ReferenceEmptyEnum_aStaticMethod(
            fishyjoes_runtime.Runtime.shared.env_ref,
        ),
        int
    )
