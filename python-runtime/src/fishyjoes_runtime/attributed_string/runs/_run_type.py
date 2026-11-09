from __future__ import annotations

import fishyjoes_runtime
from . import _run_implementation as _impl


class Run(fishyjoes_runtime.SwiftReference):
    """ Description of a run of attributes within an attributed string or substring.
    <!-- FishyJoes.exportReference(AttributedString.Runs.Run) -->
    """

    @property
    def attributes(self) -> fishyjoes_runtime.AttributeContainer:
        """ The attributes associated with of the portion of the attributed string that this run description represents.
        <!-- FishyJoes.export(attributes) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_Runs_Run_attributes(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.AttributeContainer)

    @property
    def range(self) -> fishyjoes_runtime.SwiftRange[fishyjoes_runtime.attributed_string.Index]:
        """ The range of the portion of the attributed string that this run description represents.
        <!-- FishyJoes.export(range) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_Runs_Run_range(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.SwiftRange)

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        if not isinstance(other, fishyjoes_runtime.attributed_string.runs.Run): return False
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle):
            return _impl.iota_Foundation_AttributedString_Runs_Run_equals(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    @staticmethod
    def _equals(
        lhs: fishyjoes_runtime.attributed_string.runs.Run,
        rhs: fishyjoes_runtime.attributed_string.runs.Run | None,
    ) -> bool:
        with fishyjoes_runtime.local_handles(lhs, rhs) as (_lhsHandle, _rhsHandle,):
            return _impl.iota_Foundation_AttributedString_Runs_Run_equals(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _lhsHandle,
                _rhsHandle,
            )

    def __hash__(
        self,
    ) -> int:
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_get_Foundation_AttributedString_Runs_Run_hash(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
            )
