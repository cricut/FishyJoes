from __future__ import annotations
from .. import _reference_only_types_implementation as _impl
from .. import _testapi_exported as testapi
from ._marker_type import Marker
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "Marker",
    "marker",
]

def marker(
) -> testapi.reference_only_types.Marker:
    """<!-- FishyJoes.export(marker, cSharp: MakeMarker) -->"""
    return fishyjoes_runtime.consume_created_ref(
        _impl.iota_TestAPI_ReferenceOnlyTypes_marker(
            fishyjoes_runtime.Runtime.shared.env_ref,
        ),
        testapi.reference_only_types.Marker
    )
