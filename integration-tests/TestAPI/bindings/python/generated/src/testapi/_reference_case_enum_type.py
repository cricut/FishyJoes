from __future__ import annotations
from . import _reference_case_enum_implementation as _impl
from . import _testapi_exported as testapi
from . import reference_case_enum
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class _BaseReferenceCaseEnum:
    """An inhabited enum that the product annotated `exportReference` rather than"""
    """`export`. An enum's cases are its only construction surface, so the generator"""
    """must still surface the cases (mirroring the `export` enum path) instead of"""
    """emitting an unconstructable, members-less opaque reference shell. Mirrors the"""
    """real CriRaster `Image.Kind` / `Image.Color.Channel` shape."""
    """<!-- FishyJoes.exportReference(ReferenceCaseEnum) -->"""

    @property
    def opposite(self) -> testapi.ReferenceCaseEnum:
        """<!-- FishyJoes.export(opposite) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ReferenceCaseEnum_opposite(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), testapi.reference_case_enum.North, testapi.reference_case_enum.South, testapi.reference_case_enum.East, testapi.reference_case_enum.West)

# String type syntax used to avoid circular import problems at runtime
ReferenceCaseEnum: typing.TypeAlias = typing.Union[
    'reference_case_enum.North',
    'reference_case_enum.South',
    'reference_case_enum.East',
    'reference_case_enum.West',
]
