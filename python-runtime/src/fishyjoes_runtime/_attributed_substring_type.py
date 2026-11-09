from __future__ import annotations
from . import _attributed_substring_implementation as _impl
import fishyjoes_runtime

class AttributedSubstring(fishyjoes_runtime.SwiftReference):
    """ A type that represents a portion of an attributed string.

    The attributed string for which the type represents a sub-portion can be accessed in the `base` property.
    The indices offered in `startIndex` and `endIndex` are in the same index space as those in `base`,
    so they can be used to find what part of `base` the substring represents.

    <!-- FishyJoes.exportReference(AttributedSubstring) -->
    """

    @property
    def base(self) -> fishyjoes_runtime.AttributedString:
        """ The attributed string that this substring references.

        The `startIndex` and `endIndex` of this substring are comparable to `base.startIndex` and `base.endIndex` and are guaranteed to be bounded by them.
        As such, the portion of the base string represented by the substring is the range from `startIndex` inclusive to `endIndex` exclusive.

        <!-- FishyJoes.export(base) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedSubstring_base(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.AttributedString)

    @property
    def characters(self) -> fishyjoes_runtime.attributed_string.CharacterView:
        """ The characters of the attributed substring, as a view into the underlying string.
        <!-- FishyJoes.export(characters) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedSubstring_characters(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.CharacterView)

    @property
    def end_index(self) -> fishyjoes_runtime.attributed_string.Index:
        """ An attributed substring’s past-the-end position — the position one greater than the last valid subscript argument.

        See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.

        <!-- FishyJoes.export(endIndex) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedSubstring_endIndex(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.Index)

    @property
    def runs(self) -> fishyjoes_runtime.attributed_string.Runs:
        """ The attributed runs of the attributed substring, as a view into the underlying string.

        This view provides access to the attribute information associated with the attributed substring.

        See `runs.elementAtPosition()` or its `get()` operator for a way to access the attributes that
        are associated with a particular position in the attributed substring.

        For example, `s.runs.first().attributes` yields the attributes in the first run of `s`
        and `s.runs[index].attributes` yields the attributes associated with the position `index` in `s`.

        <!-- FishyJoes.export(runs) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedSubstring_runs(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.Runs)

    @property
    def start_index(self) -> fishyjoes_runtime.attributed_string.Index:
        """ The position of the first character in a nonempty attributed substring.

        See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.

        <!-- FishyJoes.export(startIndex) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedSubstring_startIndex(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.Index)

    @property
    def string(self) -> str:
        """ Text represented by the attributed substring.

        See `runs` for the attribute information associated with the attributed substring's text.

        <!-- FishyJoes.export(string) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedSubstring_string(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def substring(self) -> fishyjoes_runtime.AttributedSubstring:
        """ An attributed substring representing the full content of the attributed substring.
        <!-- FishyJoes.export(substring) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedSubstring_substring(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.AttributedSubstring)

    @property
    def unicode_scalars(self) -> fishyjoes_runtime.attributed_string.UnicodeScalarView:
        """ The Unicode scalars of the attributed substring, as a view into the underlying string.
        <!-- FishyJoes.export(unicodeScalars) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_Foundation_AttributedSubstring_unicodeScalars(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), fishyjoes_runtime.attributed_string.UnicodeScalarView)

    def substring_for_range(
        self,
        range_: fishyjoes_runtime.SwiftRange[fishyjoes_runtime.attributed_string.Index],
    ) -> fishyjoes_runtime.AttributedSubstring:
        """ Obtains an attributed substring representing part of the attributed substring.

        - Parameter range The portion of the attributed substring to be represented by the substring, bounded by `startIndex` and `endIndex`.
        - Returns A substring of `base` over `range`.

        <!-- FishyJoes.export(substringForRange) -->
        """
        with fishyjoes_runtime.local_handles(self, range_) as (_selfHandle, _rangeHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_Foundation_AttributedSubstring_substringForRange(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _rangeHandle,
                ),
                fishyjoes_runtime.AttributedSubstring
            )

    @staticmethod
    def create_empty(
    ) -> fishyjoes_runtime.AttributedSubstring:
        """ Creates an attributed substring with an empty base attributed string.
        <!-- FishyJoes.export(createEmpty) -->
        """
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_Foundation_AttributedSubstring_createEmpty(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            fishyjoes_runtime.AttributedSubstring
        )

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        if not isinstance(other, fishyjoes_runtime.AttributedSubstring): return False
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle):
            return _impl.iota_Foundation_AttributedSubstring_equals(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    @staticmethod
    def _equals(
        lhs: fishyjoes_runtime.AttributedSubstring,
        rhs: fishyjoes_runtime.AttributedSubstring | None,
    ) -> bool:
        with fishyjoes_runtime.local_handles(lhs, rhs) as (_lhsHandle, _rhsHandle,):
            return _impl.iota_Foundation_AttributedSubstring_equals(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _lhsHandle,
                _rhsHandle,
            )

    def __hash__(
        self,
    ) -> int:
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_get_Foundation_AttributedSubstring_hash(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
            )
