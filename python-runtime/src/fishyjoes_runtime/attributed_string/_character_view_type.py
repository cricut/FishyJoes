from __future__ import annotations

import fishyjoes_runtime
from . import _character_view_implementation as _impl


class CharacterView(fishyjoes_runtime.SwiftReference):
    """ A view into the underlying storage of an attributed string or substring, as Unicode characters.
    <!-- FishyJoes.exportReference(AttributedString.CharacterView) -->
    """

    @property
    def end_index(self) -> fishyjoes_runtime.attributed_string.Index:
        """ The past-the-end position — the position one greater than the last valid subscript argument.
        <!-- FishyJoes.export(endIndex) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_CharacterView_endIndex(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.Index)

    @property
    def start_index(self) -> fishyjoes_runtime.attributed_string.Index:
        """ The position of the first character in a nonempty attributed string or substring.
        <!-- FishyJoes.export(startIndex) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_CharacterView_startIndex(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.Index)

    def index_before(
        self,
        index: fishyjoes_runtime.attributed_string.Index,
    ) -> fishyjoes_runtime.attributed_string.Index:
        """ Obtains the index of the character before the character referenced by another index in the view's attributed string or substring.

        - Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
        - Returns The index of the character before the one referenced by `index`.
            If `index` is `startIndex` an exception is thrown.
            If `index` is `endIndex`, the index to the last character in the view's attributed string or substring is returned.

        <!-- FishyJoes.export(indexBefore) -->
        """
        with fishyjoes_runtime.local_handles(self, index) as (_selfHandle, _indexHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedString_CharacterView_indexBefore(
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
        """ Obtains the index of the character after the character referenced by another index in the view's attributed string or substring.

        - Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
        - Returns The index of the character before the one referenced by `index`.
            If `index` is `endIndex` an exception is thrown.
            If `index` is `startIndex`, the index to the first character in the view's attributed string or substring is returned.

        <!-- FishyJoes.export(indexAfter) -->
        """
        with fishyjoes_runtime.local_handles(self, index) as (_selfHandle, _indexHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedString_CharacterView_indexAfter(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _indexHandle,
                ),
                fishyjoes_runtime.attributed_string.Index
            )

    def element_at(
        self,
        index: fishyjoes_runtime.attributed_string.Index,
    ) -> str:
        """ Obtains the character associated with an attributed string index.

        - Parameter index The index of the desired character, between `startIndex` inclusive and `endIndex` exclusive.
        - Returns The character associated with `index`.
            If `index` is `endIndex`, an exception is thrown.
            If `index` is `startIndex`, the first character in the view's attributed string or substring is returned.

        <!-- FishyJoes.export(elementAt) -->
        """
        with fishyjoes_runtime.local_handles(self, index) as (_selfHandle, _indexHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedString_CharacterView_elementAt(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _indexHandle,
                ),
                str
            )
