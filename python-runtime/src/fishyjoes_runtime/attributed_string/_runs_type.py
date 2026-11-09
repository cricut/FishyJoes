from __future__ import annotations

import fishyjoes_runtime
from . import _runs_implementation as _impl


class Runs(fishyjoes_runtime.SwiftReference):
    """ An iterable view into segments of the attributed string or substring, each of which indicates where a run of identical attributes begins or ends.
    <!-- FishyJoes.exportReference(AttributedString.Runs) -->
    """

    @property
    def end_index(self) -> fishyjoes_runtime.attributed_string.runs.Index:
        """ The past-the-end position — the position one greater than the last valid subscript argument.
        <!-- FishyJoes.export(endIndex) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_Runs_endIndex(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.runs.Index)

    @property
    def start_index(self) -> fishyjoes_runtime.attributed_string.runs.Index:
        """ The position of the first run in a nonempty attributed string or substring.
        <!-- FishyJoes.export(startIndex) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_Runs_startIndex(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.runs.Index)

    def index_before(
        self,
        index: fishyjoes_runtime.attributed_string.runs.Index,
    ) -> fishyjoes_runtime.attributed_string.runs.Index:
        """ Obtains the run index before another index.

        - Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
        - Returns The index of the run before `index`.
            If `index` is `startIndex` an exception is thrown.
            If `index` is `endIndex`, the last valid index is returned.

        <!-- FishyJoes.export(indexBefore) -->
        """
        with fishyjoes_runtime.local_handles(self, index) as (_selfHandle, _indexHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedString_Runs_indexBefore(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _indexHandle,
                ),
                fishyjoes_runtime.attributed_string.runs.Index
            )

    def index_after(
        self,
        index: fishyjoes_runtime.attributed_string.runs.Index,
    ) -> fishyjoes_runtime.attributed_string.runs.Index:
        """ Obtains the run index after another index.

        - Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
        - Returns The index of the run after `index`.
            If `index` is `endIndex`, an exception is thrown.
            If `index` is `startIndex`, the first valid index is returned.

        <!-- FishyJoes.export(indexAfter) -->
        """
        with fishyjoes_runtime.local_handles(self, index) as (_selfHandle, _indexHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedString_Runs_indexAfter(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _indexHandle,
                ),
                fishyjoes_runtime.attributed_string.runs.Index
            )

    def element_at(
        self,
        index: fishyjoes_runtime.attributed_string.runs.Index,
    ) -> fishyjoes_runtime.attributed_string.runs.Run:
        """ Obtains the run descriptor at a run index.

        - Parameter index The index of the desired run, between `startIndex` inclusive and `endIndex` exclusive.
        - Returns The descriptor for the run at `index`.
             If `index` is `endIndex`, an exception is thrown.
             If `index` is `startIndex`, the first valid run descriptor is returned.

        <!-- FishyJoes.export(elementAt) -->
        """
        with fishyjoes_runtime.local_handles(self, index) as (_selfHandle, _indexHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedString_Runs_elementAt(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _indexHandle,
                ),
                fishyjoes_runtime.attributed_string.runs.Run
            )

    def element_at_position(
        self,
        index: fishyjoes_runtime.attributed_string.Index,
    ) -> fishyjoes_runtime.attributed_string.runs.Run:
        """ Obtains the run descriptor associated with an attributed string index.

        - Parameter index The index of the desired position in the attributed string or substring that this object is a view for,
                     between its `startIndex` inclusive and `endIndex` exclusive.
        - Returns The descriptor for the run whose `range` contains `index`.
            If `index` is `endIndex` of the view's attributed string or substring, an exception is thrown.
            If `index` is `startIndex` of the view's attributed string or substring, the first valid run descriptor is returned.

        <!-- FishyJoes.export(elementAtPosition) -->
        """
        with fishyjoes_runtime.local_handles(self, index) as (_selfHandle, _indexHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedString_Runs_elementAtPosition(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _indexHandle,
                ),
                fishyjoes_runtime.attributed_string.runs.Run
            )

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        if not isinstance(other, fishyjoes_runtime.attributed_string.Runs): return False
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle):
            return _impl.iota_Foundation_AttributedString_Runs_equals(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    @staticmethod
    def _equals(
        lhs: fishyjoes_runtime.attributed_string.Runs,
        rhs: fishyjoes_runtime.attributed_string.Runs | None,
    ) -> bool:
        with fishyjoes_runtime.local_handles(lhs, rhs) as (_lhsHandle, _rhsHandle,):
            return _impl.iota_Foundation_AttributedString_Runs_equals(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _lhsHandle,
                _rhsHandle,
            )

    def __hash__(
        self,
    ) -> int:
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_get_Foundation_AttributedString_Runs_hash(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
            )
