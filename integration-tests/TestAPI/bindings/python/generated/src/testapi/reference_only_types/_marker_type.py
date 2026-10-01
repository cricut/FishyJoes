from . import _marker_implementation as _impl
from .. import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class Marker(fishyjoes_runtime.SwiftReference):
    """<!-- FishyJoes.exportReference(ReferenceOnlyTypes.Marker) -->"""

    @property
    def hashCode(self) -> int:
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_ReferenceOnlyTypes_Marker_hash(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        if not isinstance(other, testapi.reference_only_types.Marker): return False
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle,):
            return _impl.iota_TestAPI_ReferenceOnlyTypes_Marker_equals(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    @staticmethod
    def _equals(
        lhs: testapi.reference_only_types.Marker,
        rhs: testapi.reference_only_types.Marker | None,
    ) -> bool:
        with fishyjoes_runtime.local_handles(lhs, rhs) as (_lhsHandle, _rhsHandle,):
            return _impl.iota_TestAPI_ReferenceOnlyTypes_Marker_equals(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _lhsHandle,
                _rhsHandle,
            )
