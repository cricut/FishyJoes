from __future__ import annotations

import fishyjoes_runtime
from . import _attributed_string_implementation as _impl


class AttributedString(fishyjoes_runtime.SwiftReference):
    """ A string with associated attributes for portions of its text.

    See `text` or `characters` for access to the text of an attributed string.
    See `runs` for access to the attribute information associated with the attributed string's text.

    <!-- FishyJoes.exportReference(AttributedString) -->
    """

    @property
    def characters(self) -> fishyjoes_runtime.attributed_string.CharacterView:
        """ The characters of the attributed string, as a view into the underlying string.
        <!-- FishyJoes.export(characters) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_characters(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.CharacterView)

    @property
    def end_index(self) -> fishyjoes_runtime.attributed_string.Index:
        """ An attributed string’s past-the-end position — the position one greater than the last valid subscript argument.

        See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.

        <!-- FishyJoes.export(endIndex) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_endIndex(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.Index)

    @property
    def runs(self) -> fishyjoes_runtime.attributed_string.Runs:
        """ The attributed runs of the attributed string, as a view into the underlying string.

        This view provides access to the attribute information associated with the attributed string.

        See `runs.elementAtPosition()` or its `get()` operator for a way to access the attributes that
        are associated with a particular position in the attributed string.

        For example, `s.runs.first().attributes` yields the attributes in the first run of `s`
        and `s.runs[index].attributes` yields the attributes associated with the position `index` in `s`.

        <!-- FishyJoes.export(runs) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_runs(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.Runs)

    @property
    def start_index(self) -> fishyjoes_runtime.attributed_string.Index:
        """ The position of the first character in a nonempty attributed string.

        See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.

        <!-- FishyJoes.export(startIndex) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_startIndex(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.Index)

    @property
    def string(self) -> str:
        """ Text represented by the attributed string.

        See `runs` for the attribute information associated with the attributed string's text.

        <!-- FishyJoes.export(string) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_string(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def substring(self) -> fishyjoes_runtime.AttributedSubstring:
        """ An attributed substring representing the full content of the attributed string.
        <!-- FishyJoes.export(substring) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_substring(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.AttributedSubstring)

    @property
    def unicode_scalars(self) -> fishyjoes_runtime.attributed_string.UnicodeScalarView:
        """ The Unicode scalars of the attributed string, as a view into the underlying string.
        <!-- FishyJoes.export(unicodeScalars) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedString_unicodeScalars(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.UnicodeScalarView)

    def substring_for_range(
        self,
        range_: fishyjoes_runtime.SwiftRange[fishyjoes_runtime.attributed_string.Index],
    ) -> fishyjoes_runtime.AttributedSubstring:
        """ Obtains an attributed substring representing part of the attributed string.

        - Parameter range The portion of the attributed string to be represented by the substring, bounded by `startIndex` and `endIndex`.

        <!-- FishyJoes.export(substringForRange) -->
        """
        with fishyjoes_runtime.local_handles(self, range_) as (_selfHandle, _rangeHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedString_substringForRange(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _rangeHandle,
                ),
                fishyjoes_runtime.AttributedSubstring
            )

    def append(
        self,
        attributed_string: fishyjoes_runtime.AttributedString,
    ) -> None:
        """ Appends the text and any associated attributes of another attributed string to the end of this one.
        - Parameter attributedString The attributed string containing the text and attributes to append.

        <!-- FishyJoes.export(append) -->
        """
        with fishyjoes_runtime.local_handles(self, attributed_string) as (_selfHandle, _attributed_stringHandle,):
            return _impl.iota_Foundation_AttributedString_append(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _attributed_stringHandle,
            )

    def append_substring(
        self,
        substring: fishyjoes_runtime.AttributedSubstring,
    ) -> None:
        """ Appends the text and any associated attributes of the portion of an attributed string represented by a substring to the end of this one.
        - Parameter subtring The substring containing the text and attributes to append.

        <!-- FishyJoes.export(appendSubstring) -->
        """
        with fishyjoes_runtime.local_handles(self, substring) as (_selfHandle, _substringHandle,):
            return _impl.iota_Foundation_AttributedString_appendSubstring(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _substringHandle,
            )

    def insert(
        self,
        attributed_string: fishyjoes_runtime.AttributedString,
        index: fishyjoes_runtime.attributed_string.Index,
    ) -> None:
        """ Inserts the text and any associated attributes of another attributed string into this one at the specified position.

        - Parameter attributedString The attributed string containing the text and attributes to insert.
        - Parameter index Position at which the content of `attributedString` should be inserted, bounded by `startIndex` and `endIndex`.
            If `index` is `startIndex` the content will be inserted before all content of this attributed string.
            If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `append()`.

        <!-- FishyJoes.export(insert) -->
        """
        with fishyjoes_runtime.local_handles(self, attributed_string, index) as (_selfHandle, _attributed_stringHandle, _indexHandle,):
            return _impl.iota_Foundation_AttributedString_insert(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _attributed_stringHandle,
                _indexHandle,
            )

    def insert_substring(
        self,
        substring: fishyjoes_runtime.AttributedSubstring,
        index: fishyjoes_runtime.attributed_string.Index,
    ) -> None:
        """ Inserts the text and any associated attributes of a substring of an attributed string into this one at the specified position.

        - Parameter substring The substring of an attributed string containing the text and attributes to insert.
        - Parameter index Position at which the content of `substring` should be inserted, bounded by `startIndex` and `endIndex`.
            If `index` is `startIndex` the content will be inserted before all content of this attributed string.
            If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `appendSubstring()`.

        <!-- FishyJoes.export(insertSubstring) -->
        """
        with fishyjoes_runtime.local_handles(self, substring, index) as (_selfHandle, _substringHandle, _indexHandle,):
            return _impl.iota_Foundation_AttributedString_insertSubstring(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _substringHandle,
                _indexHandle,
            )

    def replace_subrange(
        self,
        range_: fishyjoes_runtime.SwiftRange[fishyjoes_runtime.attributed_string.Index],
        attributed_string: fishyjoes_runtime.AttributedString,
    ) -> None:
        """ Replaces a portion of the text and associated attributes of the attributed string with content from another one.

        - Parameter range The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.
        - Parameter attributedString The attributed string containing the text and attributes that replaces the content in `range`.

        <!-- FishyJoes.export(replaceSubrange) -->
        """
        with fishyjoes_runtime.local_handles(self, range_, attributed_string) as (_selfHandle, _rangeHandle, _attributed_stringHandle,):
            return _impl.iota_Foundation_AttributedString_replaceSubrange(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _rangeHandle,
                _attributed_stringHandle,
            )

    def replace_subrange_with_substring(
        self,
        range_: fishyjoes_runtime.SwiftRange[fishyjoes_runtime.attributed_string.Index],
        substring: fishyjoes_runtime.AttributedSubstring,
    ) -> None:
        """ Replaces a portion of the text and associated attributes of the attributed string with content from a substring of another one.

        - Parameter range The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.
        - Parameter substring The substring of an attributed string containing the text and attributes that replaces the content in `range`.

        <!-- FishyJoes.export(replaceSubrangeWithSubstring) -->
        """
        with fishyjoes_runtime.local_handles(self, range_, substring) as (_selfHandle, _rangeHandle, _substringHandle,):
            return _impl.iota_Foundation_AttributedString_replaceSubrangeWithSubstring(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _rangeHandle,
                _substringHandle,
            )

    def remove_subrange(
        self,
        range_: fishyjoes_runtime.SwiftRange[fishyjoes_runtime.attributed_string.Index],
    ) -> None:
        """ Removes a portion of the text and associated attributes from the attributed string.

        - Parameter range The portion of the attributed string to remove, bounded by `startIndex` and `endIndex`.

        <!-- FishyJoes.export(removeSubrange) -->
        """
        with fishyjoes_runtime.local_handles(self, range_) as (_selfHandle, _rangeHandle,):
            return _impl.iota_Foundation_AttributedString_removeSubrange(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _rangeHandle,
            )

    def set_attributes(
        self,
        attributes: fishyjoes_runtime.AttributeContainer,
    ) -> None:
        """ Associates attributes with the content of the entire attributed string, replacing any existing attribute information.

        - Parameter attributes The attributes which will subsequently apply to all text in the attributed string.

        <!-- FishyJoes.export(setAttributes) -->
        """
        with fishyjoes_runtime.local_handles(self, attributes) as (_selfHandle, _attributesHandle,):
            return _impl.iota_Foundation_AttributedString_setAttributes(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _attributesHandle,
            )

    def set_attributes_for_range(
        self,
        range_: fishyjoes_runtime.SwiftRange[fishyjoes_runtime.attributed_string.Index],
        attributes: fishyjoes_runtime.AttributeContainer,
    ) -> None:
        """ Associates attributes with the content of a portion of the attributed string, replacing any existing attribute information.

        - Parameter range The portion of the attributed string whose attributes are to be replaced, bounded by `startIndex` and `endIndex`.
        - Parameter attributes The attributes which will subsequently apply to the text in `range`.

        <!-- FishyJoes.export(setAttributesForRange) -->
        """
        with fishyjoes_runtime.local_handles(self, range_, attributes) as (_selfHandle, _rangeHandle, _attributesHandle,):
            return _impl.iota_Foundation_AttributedString_setAttributesForRange(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _rangeHandle,
                _attributesHandle,
            )

    def merge_attributes(
        self,
        attributes: fishyjoes_runtime.AttributeContainer,
        *,
        keep_current: bool = False,
    ) -> None:
        """ Associates attributes with the content of the entire attributed string, merging with any existing attribute information.

        - Parameter attributes The attributes which will subsequently apply to all text in the attributed string.
        - Parameter keepCurrent For attributes in `attributes` that already have a value in the attributed string,
            passing `true` retains the current value of the attribute,
            passing `false` replaces the value of the attribute with the one in `attributes`.

        <!-- FishyJoes.export(mergeAttributes) -->
        """
        with fishyjoes_runtime.local_handles(self, attributes) as (_selfHandle, _attributesHandle,):
            return _impl.iota_Foundation_AttributedString_mergeAttributes(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _attributesHandle,
                keep_current,
            )

    def merge_attributes_for_range(
        self,
        range_: fishyjoes_runtime.SwiftRange[fishyjoes_runtime.attributed_string.Index],
        attributes: fishyjoes_runtime.AttributeContainer,
        *,
        keep_current: bool = False,
    ) -> None:
        """ Associates attributes with the content of a portion of the attributed string, merging with any existing attribute information.

        - Parameter range The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.
        - Parameter attributes The attributes which will subsequently apply to the text in `range`.
        - Parameter keepCurrent For attributes in `attributes` that already have a value in `range` in the attributed string,
            passing `true` retains the current value of the attribute,
            passing `false` replaces the value of the attribute with the one in `attributes`.

        <!-- FishyJoes.export(mergeAttributesForRange) -->
        """
        with fishyjoes_runtime.local_handles(self, range_, attributes) as (_selfHandle, _rangeHandle, _attributesHandle,):
            return _impl.iota_Foundation_AttributedString_mergeAttributesForRange(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _rangeHandle,
                _attributesHandle,
                keep_current,
            )

    def replace_attributes(
        self,
        attributes: fishyjoes_runtime.AttributeContainer,
        others: fishyjoes_runtime.AttributeContainer,
    ) -> None:
        """ Replaces occurrences of attributes in one attribute container with those in another attribute container.

        - Parameter attributes The existing attributes to replace.
        - Parameter others The new attributes to apply.

        <!-- FishyJoes.export(replaceAttributes) -->
        """
        with fishyjoes_runtime.local_handles(self, attributes, others) as (_selfHandle, _attributesHandle, _othersHandle,):
            return _impl.iota_Foundation_AttributedString_replaceAttributes(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _attributesHandle,
                _othersHandle,
            )

    def replace_attributes_for_range(
        self,
        range_: fishyjoes_runtime.SwiftRange[fishyjoes_runtime.attributed_string.Index],
        attributes: fishyjoes_runtime.AttributeContainer,
        others: fishyjoes_runtime.AttributeContainer,
    ) -> None:
        """ Replaces occurrences of attributes in one attribute container with those in another attribute container.

        - Parameter range The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.
        - Parameter attributes The existing attributes to replace.
        - Parameter others The new attributes to apply.

        <!-- FishyJoes.export(replaceAttributesForRange) -->
        """
        with fishyjoes_runtime.local_handles(self, range_, attributes, others) as (_selfHandle, _rangeHandle, _attributesHandle, _othersHandle,):
            return _impl.iota_Foundation_AttributedString_replaceAttributesForRange(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _rangeHandle,
                _attributesHandle,
                _othersHandle,
            )

    @staticmethod
    def create_empty(
    ) -> fishyjoes_runtime.AttributedString:
        """ Creates an attributed string containing the empty string as its text with no associated attributes.
        <!-- FishyJoes.export(createEmpty) -->
        """
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_Foundation_AttributedString_createEmpty(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            fishyjoes_runtime.AttributedString
        )

    @staticmethod
    def create(
        string: str,
        *,
        attributes: fishyjoes_runtime.AttributeContainer | None = None,
    ) -> fishyjoes_runtime.AttributedString:
        """ Creates an attributed string containing a string as its text, all associated with the specified attributes.

        - Parameter string A string containing the text to serve as the content of the attributed string.
        - Parameter attributes Attributes to associate with the full range of the attributed string.

        <!-- FishyJoes.export(create) -->
        """
        with fishyjoes_runtime.local_handles(string, attributes) as (_stringHandle, _attributesHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedString_create(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _stringHandle,
                    _attributesHandle,
                ),
                fishyjoes_runtime.AttributedString
            )

    @staticmethod
    def create_from_substring(
        substring: fishyjoes_runtime.AttributedSubstring,
    ) -> fishyjoes_runtime.AttributedString:
        """ Creates an attributed string drawing its the text and attributes from a substring of another attributed string.

        - Parameter substring A substring of another attributed string whose content is used for the created attributed string.

        <!-- FishyJoes.export(createFromSubstring) -->
        """
        with fishyjoes_runtime.local_handles(substring) as (_substringHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedString_createFromSubstring(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _substringHandle,
                ),
                fishyjoes_runtime.AttributedString
            )

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        if not isinstance(other, fishyjoes_runtime.AttributedString): return False
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle):
            return _impl.iota_Foundation_AttributedString_equals(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    @staticmethod
    def _equals(
        lhs: fishyjoes_runtime.AttributedString,
        rhs: fishyjoes_runtime.AttributedString | None,
    ) -> bool:
        with fishyjoes_runtime.local_handles(lhs, rhs) as (_lhsHandle, _rhsHandle,):
            return _impl.iota_Foundation_AttributedString_equals(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _lhsHandle,
                _rhsHandle,
            )

    def __hash__(
        self,
    ) -> int:
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_get_Foundation_AttributedString_hash(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
            )
