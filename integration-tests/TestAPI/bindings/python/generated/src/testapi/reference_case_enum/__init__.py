from __future__ import annotations
from .. import _reference_case_enum_implementation as _impl
from .. import _testapi_exported as testapi
from .east import East
from .north import North
from .south import South
from .west import West
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "North",
    "South",
    "East",
    "West",
    "get_default_direction",
    "rotate180",
]

def get_default_direction() -> testapi.ReferenceCaseEnum:
    """Mirrors `Image.kind`: a value-returning accessor whose result must be"""
    """comparable to a known case from Python."""
    """<!-- FishyJoes.export(defaultDirection) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ReferenceCaseEnum_default_direction(fishyjoes_runtime.Runtime.shared.env_ref), testapi.reference_case_enum.North, testapi.reference_case_enum.South, testapi.reference_case_enum.East, testapi.reference_case_enum.West)

def rotate180(
    direction: testapi.ReferenceCaseEnum,
) -> testapi.ReferenceCaseEnum:
    """A method that both consumes (parameter) and produces (return) the"""
    """reference-annotated enum — only callable from Python if the cases bridge."""
    """<!-- FishyJoes.export(rotate180) -->"""
    with fishyjoes_runtime.local_handles(direction) as (_directionHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ReferenceCaseEnum_rotate180(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _directionHandle,
            ),
            testapi.reference_case_enum.North, testapi.reference_case_enum.South, testapi.reference_case_enum.East, testapi.reference_case_enum.West
        )
