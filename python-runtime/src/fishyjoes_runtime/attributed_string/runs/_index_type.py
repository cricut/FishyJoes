from __future__ import annotations

import fishyjoes_runtime
from . import _index_implementation as _impl


class Index(fishyjoes_runtime.SwiftReference):
    """ A type that represents the position of a descriptor for a run within an attributed string's view of runs.
    <!-- FishyJoes.exportReference(AttributedString.Runs.Index) -->
    """

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        if not isinstance(other, fishyjoes_runtime.attributed_string.runs.Index): return False
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle):
            return _impl.iota_Foundation_AttributedString_Runs_Index_equals(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    @staticmethod
    def _equals(
        lhs: fishyjoes_runtime.attributed_string.runs.Index,
        rhs: fishyjoes_runtime.attributed_string.runs.Index | None,
    ) -> bool:
        with fishyjoes_runtime.local_handles(lhs, rhs) as (_lhsHandle, _rhsHandle,):
            return _impl.iota_Foundation_AttributedString_Runs_Index_equals(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _lhsHandle,
                _rhsHandle,
            )

    def __hash__(
        self,
    ) -> int:
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_get_Foundation_AttributedString_Runs_Index_hash(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
            )
