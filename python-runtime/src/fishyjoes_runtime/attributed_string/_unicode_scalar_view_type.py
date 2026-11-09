from __future__ import annotations

import fishyjoes_runtime
from . import _unicode_scalar_view_implementation as _impl


class UnicodeScalarView(fishyjoes_runtime.SwiftReference):
    """ A view into the underlying storage of the attributed string, as Unicode scalars.
    <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
    """

    @property
    def end_index(self) -> fishyjoes_runtime.attributed_string.Index:
        """ The past-the-end position — the position one greater than the last valid subscript argument.
        <!-- FishyJoes.export(endIndex) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_UnicodeScalarView_endIndex(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.Index)

    @property
    def start_index(self) -> fishyjoes_runtime.attributed_string.Index:
        """ The position of the first Unicode scalar in a nonempty attributed string or substring.
        <!-- FishyJoes.export(startIndex) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_UnicodeScalarView_startIndex(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.Index)

    def index_before(
        self,
        index: fishyjoes_runtime.attributed_string.Index,
    ) -> fishyjoes_runtime.attributed_string.Index:
        """ Obtains the index of the Unicode scalar before the scalar referenced by another index in the view's attributed string or substring.

        - Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
        - Returns The index of the Unicode scalar before the one referenced by `index`.
            If `index` is `startIndex` an exception is thrown.
            If `index` is `endIndex`, the index to the last Unicode scalar in the view's attributed string or substring is returned.

        <!-- FishyJoes.export(indexBefore) -->
        """
        with fishyjoes_runtime.local_handles(self, index) as (_selfHandle, _indexHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedString_UnicodeScalarView_indexBefore(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _indexHandle,
                ),
                fishyjoes_runtime.attributed_string.Index
            )

    def index_after(
        self,
        index: fishyjoes_runtime.attributed_string.Index,
    ) -> fishyjoes_runtime.attributed_string.Index:
        """ Obtains the index of the Unicode scalar after the scalar referenced by another index in the view's attributed string or substring.

        - Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
        - Returns The index of the Unicode scalar before the one referenced by `index`.
            If `index` is `endIndex` an exception is thrown.
            If `index` is `startIndex`, the index to the first Unicode scalar in the view's attributed string or substring is returned.

        <!-- FishyJoes.export(indexAfter) -->
        """
        with fishyjoes_runtime.local_handles(self, index) as (_selfHandle, _indexHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedString_UnicodeScalarView_indexAfter(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _indexHandle,
                ),
                fishyjoes_runtime.attributed_string.Index
            )

    def element_at(
        self,
        index: fishyjoes_runtime.attributed_string.Index,
    ) -> int:
        """ Obtains the Unicode scalar associated with an attributed string index.

        - Parameter index The index of the desired Unicode scalar, between `startIndex` inclusive and `endIndex` exclusive.
        - Returns The Unicode scalar associated with `index`.
            If `index` is `endIndex`, an exception is thrown.
            If `index` is `startIndex`, the first Unicode scalar in the view's attributed string or substring is returned.

        <!-- FishyJoes.export(elementAt) -->
        """
        with fishyjoes_runtime.local_handles(self, index) as (_selfHandle, _indexHandle,):
            return _impl.iota_Foundation_AttributedString_UnicodeScalarView_elementAt(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _indexHandle,
            )
