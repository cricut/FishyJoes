from . import _reference_case_enum_implementation as _impl
from . import _testapi_exported as testapi
from . import reference_case_enum
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

    # TODO: static field defaultDirection
    @property
    def opposite(self) -> testapi.ReferenceCaseEnum:
        """<!-- FishyJoes.export(opposite) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ReferenceCaseEnum_opposite(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), testapi.reference_case_enum.North, testapi.reference_case_enum.South, testapi.reference_case_enum.East, testapi.reference_case_enum.West)

    @staticmethod
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

ReferenceCaseEnum: typing.TypeAlias = typing.Union[
    reference_case_enum.North,
    reference_case_enum.South,
    reference_case_enum.East,
    reference_case_enum.West,
]
