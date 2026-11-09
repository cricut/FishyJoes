from __future__ import annotations

import fishyjoes_runtime
from . import _index_implementation as _impl


class Index(fishyjoes_runtime.SwiftReference):
    """ A type that represents the position of a character or code unit within an attributed string.
    <!-- FishyJoes.exportReference(AttributedString.Index) -->
    """

    def compare(self, other: Index) -> int:
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle):
            return _impl.iota_Foundation_AttributedString_Index_compare(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    def __lt__(self, other: Index) -> bool: return self.compare(other) < 0
    def __gt__(self, other: Index) -> bool: return self.compare(other) > 0
    def __le__(self, other: Index) -> bool: return self.compare(other) <= 0
    def __ge__(self, other: Index) -> bool: return self.compare(other) >= 0

    def __hash__(
        self,
    ) -> int:
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_get_Foundation_AttributedString_Index_hash(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
            )
