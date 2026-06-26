"""Foundation AttributedString family for the FishyJoes Python runtime.

This module implements the rich, typed runtime surface for Foundation's
``AttributedString`` and its companions (``AttributedSubstring``,
``AttributeContainer``[``.FoundationAttributes``], the ``Runs``/``CharacterView``/
``UnicodeScalarView`` views, and the ``Index`` types), mirroring the equivalent
Dart and Kotlin runtimes. It consumes the ``@_cdecl`` symbols already exported by
``FishyJoesIotaRuntime`` (``Sources/FishyJoesIotaRuntime/AttributedString/*+iota.swift``);
no Swift runtime changes are required.

The classes are created by :func:`setup_attributed_string_family`, a factory
called once from ``fishyjoes_runtime.iota.create_runtime``. It lives in its own
module (like ``config``/``native``/``diagnostics``) so the marshalling core in
``iota.py`` stays focused; the typed stub surface lives in the generated
``_native.pyi`` (see ``PythonTranslator.emitAttributedStringFamilyStubs``).
"""

from __future__ import annotations


def setup_attributed_string_family(
    *,
    runtime_lib,
    env,
    check,
    call,
    setup_reference_type,
    SwiftReference,
    STRING,
    VOID,
    URL,
    Optional,
    ValueType,
    Range,
    uint32_value,
):
    """Bind the AttributedString-family cdecl symbols, define the runtime
    classes, register/setup their reference types, and return the
    ``Runtime_*`` export mapping merged into the runtime namespace.

    All arguments are the runtime primitives owned by ``create_runtime``; passing
    them in keeps this module free of import-time coupling to ``iota.py``.
    """

    _uint32_value = uint32_value

    def _bool_value(value) -> bool:
        # keepCurrent flags marshal as a raw Swift.Bool C arg; reject non-bools the
        # way the marshalling core's Bool primitive does rather than silently
        # coercing truthy values.
        if type(value) is not bool:
            raise ValueError(f"Expected Bool value, got {value!r}")
        return value

    def _runtime_symbol(name: str):
        return getattr(runtime_lib, name)


    def _runtime_reference_equals(expected_type, equals_function, lhs, rhs):
        if not isinstance(rhs, expected_type):
            return False
        return bool(check(lambda exn: equals_function(
            env,
            lhs._iota_ref,
            rhs._iota_ref,
            exn,
        )))


    def _runtime_reference_hash(hash_function, value):
        return check(lambda exn: hash_function(
            env,
            value._iota_ref,
            exn,
        ))


    _attributed_string_create = _runtime_symbol("__iota_Foundation_AttributedString_create")
    _attributed_string_get_string = _runtime_symbol("__iota_get_Foundation_AttributedString_string")
    _attributed_string_get_runs = _runtime_symbol("__iota_get_Foundation_AttributedString_runs")
    _attributed_string_get_characters = _runtime_symbol("__iota_get_Foundation_AttributedString_characters")
    _attributed_string_get_unicode_scalars = _runtime_symbol("__iota_get_Foundation_AttributedString_unicodeScalars")
    _attributed_string_get_substring = _runtime_symbol("__iota_get_Foundation_AttributedString_substring")
    _attributed_stringsubstring_for_range = _runtime_symbol("__iota_Foundation_AttributedString_substringForRange")
    _attributed_string_get_start_index = _runtime_symbol("__iota_get_Foundation_AttributedString_startIndex")
    _attributed_string_get_end_index = _runtime_symbol("__iota_get_Foundation_AttributedString_endIndex")
    _attributed_string_append = _runtime_symbol("__iota_Foundation_AttributedString_append")
    _attributed_string_append_substring = _runtime_symbol("__iota_Foundation_AttributedString_appendSubstring")
    _attributed_string_insert = _runtime_symbol("__iota_Foundation_AttributedString_insert")
    _attributed_string_insert_substring = _runtime_symbol("__iota_Foundation_AttributedString_insertSubstring")
    _attributed_string_replace_subrange = _runtime_symbol("__iota_Foundation_AttributedString_replaceSubrange")
    _attributed_string_replace_subrange_with_substring = _runtime_symbol("__iota_Foundation_AttributedString_replaceSubrangeWithSubstring")
    _attributed_string_remove_subrange = _runtime_symbol("__iota_Foundation_AttributedString_removeSubrange")
    _attributed_string_set_attributes = _runtime_symbol("__iota_Foundation_AttributedString_setAttributes")
    _attributed_string_set_attributes_for_range = _runtime_symbol("__iota_Foundation_AttributedString_setAttributesForRange")
    _attributed_string_merge_attributes = _runtime_symbol("__iota_Foundation_AttributedString_mergeAttributes")
    _attributed_string_merge_attributes_for_range = _runtime_symbol("__iota_Foundation_AttributedString_mergeAttributesForRange")
    _attributed_string_replace_attributes = _runtime_symbol("__iota_Foundation_AttributedString_replaceAttributes")
    _attributed_string_replace_attributes_for_range = _runtime_symbol("__iota_Foundation_AttributedString_replaceAttributesForRange")
    _attributed_string_create_empty = _runtime_symbol("__iota_Foundation_AttributedString_createEmpty")
    _attributed_string_create_from_substring = _runtime_symbol("__iota_Foundation_AttributedString_createFromSubstring")
    _attributed_string_equals = _runtime_symbol("__iota_Foundation_AttributedString_equals")
    _attributed_string_hash = _runtime_symbol("__iota_get_Foundation_AttributedString_hash")
    _attributed_string_index_equals = _runtime_symbol("__iota_Foundation_AttributedString_Index_equals")
    _attributed_string_index_hash = _runtime_symbol("__iota_get_Foundation_AttributedString_Index_hash")
    _attributed_string_index_compare = _runtime_symbol("__iota_Foundation_AttributedString_Index_compare")
    _unicode_scalar_view_get_start_index = _runtime_symbol("__iota_get_Foundation_AttributedString_UnicodeScalarView_startIndex")
    _unicode_scalar_view_get_end_index = _runtime_symbol("__iota_get_Foundation_AttributedString_UnicodeScalarView_endIndex")
    _unicode_scalar_view_index_before = _runtime_symbol("__iota_Foundation_AttributedString_UnicodeScalarView_indexBefore")
    _unicode_scalar_view_index_after = _runtime_symbol("__iota_Foundation_AttributedString_UnicodeScalarView_indexAfter")
    _unicode_scalar_viewelement_at = _runtime_symbol("__iota_Foundation_AttributedString_UnicodeScalarView_elementAt")
    _character_view_get_start_index = _runtime_symbol("__iota_get_Foundation_AttributedString_CharacterView_startIndex")
    _character_view_get_end_index = _runtime_symbol("__iota_get_Foundation_AttributedString_CharacterView_endIndex")
    _character_view_index_before = _runtime_symbol("__iota_Foundation_AttributedString_CharacterView_indexBefore")
    _character_view_index_after = _runtime_symbol("__iota_Foundation_AttributedString_CharacterView_indexAfter")
    _character_viewelement_at = _runtime_symbol("__iota_Foundation_AttributedString_CharacterView_elementAt")
    _runs_get_start_index = _runtime_symbol("__iota_get_Foundation_AttributedString_Runs_startIndex")
    _runs_get_end_index = _runtime_symbol("__iota_get_Foundation_AttributedString_Runs_endIndex")
    _runs_index_before = _runtime_symbol("__iota_Foundation_AttributedString_Runs_indexBefore")
    _runs_index_after = _runtime_symbol("__iota_Foundation_AttributedString_Runs_indexAfter")
    _runselement_at = _runtime_symbol("__iota_Foundation_AttributedString_Runs_elementAt")
    _runselement_at_position = _runtime_symbol("__iota_Foundation_AttributedString_Runs_elementAtPosition")
    _runs_equals = _runtime_symbol("__iota_Foundation_AttributedString_Runs_equals")
    _runs_hash = _runtime_symbol("__iota_get_Foundation_AttributedString_Runs_hash")
    _runs_index_equals = _runtime_symbol("__iota_Foundation_AttributedString_Runs_Index_equals")
    _runs_index_hash = _runtime_symbol("__iota_get_Foundation_AttributedString_Runs_Index_hash")
    _runs_index_compare = _runtime_symbol("__iota_Foundation_AttributedString_Runs_Index_compare")
    _runs_run_get_range = _runtime_symbol("__iota_get_Foundation_AttributedString_Runs_Run_range")
    _runs_run_get_attributes = _runtime_symbol("__iota_get_Foundation_AttributedString_Runs_Run_attributes")
    _runs_run_equals = _runtime_symbol("__iota_Foundation_AttributedString_Runs_Run_equals")
    _runs_run_hash = _runtime_symbol("__iota_get_Foundation_AttributedString_Runs_Run_hash")
    _attributed_substring_get_base = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_base")
    _attributed_substring_get_string = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_string")
    _attributed_substring_get_runs = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_runs")
    _attributed_substring_get_characters = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_characters")
    _attributed_substring_get_unicode_scalars = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_unicodeScalars")
    _attributed_substring_get_start_index = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_startIndex")
    _attributed_substring_get_end_index = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_endIndex")
    _attributed_substring_get_substring = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_substring")
    _attributed_substringsubstring_for_range = _runtime_symbol("__iota_Foundation_AttributedSubstring_substringForRange")
    _attributed_substring_create_empty = _runtime_symbol("__iota_Foundation_AttributedSubstring_createEmpty")
    _attributed_substring_equals = _runtime_symbol("__iota_Foundation_AttributedSubstring_equals")
    _attributed_substring_hash = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_hash")
    _attribute_container_merge = _runtime_symbol("__iota_FishyJoesCommonRuntime_AttributeContainer_merge")
    _attribute_container_create_empty = _runtime_symbol("__iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty")
    _attribute_container_equals = _runtime_symbol("__iota_FishyJoesCommonRuntime_AttributeContainer_equals")
    _attribute_container_hash = _runtime_symbol("__iota_get_FishyJoesCommonRuntime_AttributeContainer_hash")
    _foundation_attributes_get_link = _runtime_symbol("__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link")
    _foundation_attributes_set_link = _runtime_symbol("__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link")
    _foundation_attributes_get_language_identifier = _runtime_symbol("__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier")
    _foundation_attributes_set_language_identifier = _runtime_symbol("__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier")
    _foundation_attributes_create_empty = _runtime_symbol("__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty")
    _foundation_attributes_equals = _runtime_symbol("__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals")
    _foundation_attributes_hash = _runtime_symbol("__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash")
    _foundation_attributes_create_from_container = _runtime_symbol("__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer")
    _foundation_attributes_as_container = _runtime_symbol("__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_asContainer")


    # The Swift cdecl surface marshals every AttributedString.Index range through
    # `RangeConverter<Foundation.AttributedString.Index>`; reuse that exact swift
    # name so this descriptor interns to the same converter the generated
    # bindings register (e.g. AttributedStrings.full_range). Defined lazily so it
    # can reference AttributedString_Index, declared below.
    def _attributed_string_index_range():
        return Range(
            "RangeConverter<Foundation.AttributedString.Index>",
            ValueType("AttributedString_Index"),
        )


    class AttributedString(SwiftReference):
        def __init__(self, value=None, attributes=None):
            # Pythonic, type-dispatched constructor mirroring Swift's three inits:
            #   AttributedString()                -> init() (empty)
            #   AttributedString("hi", attrs)     -> init(_:attributes:)
            #   AttributedString(some_substring)  -> init(_ substring:)
            # so Python reaches the same constructors as Swift instead of through
            # Dart/Kotlin-named factories. Build the native value, then take
            # ownership of its reference (transferring the finalizer so the
            # temporary wrapper does not double-release).
            if value is None:
                # init() -> empty AttributedString (no text, no attributes).
                built = AttributedString._create_empty()
            elif isinstance(value, AttributedSubstring):
                # init(_ substring:) materialises a substring's text + attributes
                # into a standalone AttributedString. attributes is not meaningful
                # here (the substring already carries its attributes).
                if attributes is not None:
                    raise TypeError(
                        "attributes is only valid when constructing from a str"
                    )
                built = AttributedString._create_from_substring(value)
            elif isinstance(value, str):
                # init(_:attributes:): turn a Python str (with optional
                # AttributeContainer) into an AttributedString. Without this the
                # shaping tier (Font.shape_*, TextSegmentation, …) was unreachable:
                # the only AttributedStrings a consumer could obtain were Swift
                # return values.
                built = call(
                    _attributed_string_create,
                    args=[value, attributes],
                    arg_conversions=[STRING, Optional(ValueType("AttributeContainer"))],
                    return_conversion=ValueType("AttributedString"),
                )
            else:
                raise TypeError(
                    "Expected None, str, or AttributedSubstring, got "
                    f"{type(value).__name__}"
                )
            built._iota_finalizer.detach()
            self._adopt_iota_ref(built._iota_ref)

        @property
        def string(self):
            return call(
                _attributed_string_get_string,
                args=[self._iota_ref],
                return_conversion=STRING,
            )

        @property
        def runs(self):
            return call(
                _attributed_string_get_runs,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_Runs"),
            )

        @property
        def characters(self):
            return call(
                _attributed_string_get_characters,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_CharacterView"),
            )

        @property
        def unicode_scalars(self):
            return call(
                _attributed_string_get_unicode_scalars,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_UnicodeScalarView"),
            )

        @property
        def substring(self):
            return call(
                _attributed_string_get_substring,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedSubstring"),
            )

        def substring_for_range(self, range):
            # Private: bridges Swift's `subscript(range:)`. The sole public
            # accessor is `__getitem__` (`obj[range]`), mirroring the
            # `element_at`/`__getitem__` decision for the views.
            return call(
                _attributed_stringsubstring_for_range,
                args=[self._iota_ref, range],
                arg_conversions=[None, _attributed_string_index_range()],
                return_conversion=ValueType("AttributedSubstring"),
            )

        @property
        def start_index(self):
            return call(
                _attributed_string_get_start_index,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_Index"),
            )

        @property
        def end_index(self):
            return call(
                _attributed_string_get_end_index,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_Index"),
            )

        def append(self, attributed_string):
            return call(
                _attributed_string_append,
                args=[self._iota_ref, attributed_string],
                arg_conversions=[None, ValueType("AttributedString")],
                return_conversion=VOID,
            )

        def append_substring(self, substring):
            return call(
                _attributed_string_append_substring,
                args=[self._iota_ref, substring],
                arg_conversions=[None, ValueType("AttributedSubstring")],
                return_conversion=VOID,
            )

        def insert(self, attributed_string, index):
            return call(
                _attributed_string_insert,
                args=[self._iota_ref, attributed_string, index],
                arg_conversions=[None, ValueType("AttributedString"), ValueType("AttributedString_Index")],
                return_conversion=VOID,
            )

        def insert_substring(self, substring, index):
            return call(
                _attributed_string_insert_substring,
                args=[self._iota_ref, substring, index],
                arg_conversions=[None, ValueType("AttributedSubstring"), ValueType("AttributedString_Index")],
                return_conversion=VOID,
            )

        def replace_subrange(self, range, attributed_string):
            return call(
                _attributed_string_replace_subrange,
                args=[self._iota_ref, range, attributed_string],
                arg_conversions=[None, _attributed_string_index_range(), ValueType("AttributedString")],
                return_conversion=VOID,
            )

        def replace_subrange_with_substring(self, range, substring):
            return call(
                _attributed_string_replace_subrange_with_substring,
                args=[self._iota_ref, range, substring],
                arg_conversions=[None, _attributed_string_index_range(), ValueType("AttributedSubstring")],
                return_conversion=VOID,
            )

        def remove_subrange(self, range):
            return call(
                _attributed_string_remove_subrange,
                args=[self._iota_ref, range],
                arg_conversions=[None, _attributed_string_index_range()],
                return_conversion=VOID,
            )

        def set_attributes(self, attributes):
            return call(
                _attributed_string_set_attributes,
                args=[self._iota_ref, attributes],
                arg_conversions=[None, ValueType("AttributeContainer")],
                return_conversion=VOID,
            )

        def set_attributes_for_range(self, range, attributes):
            return call(
                _attributed_string_set_attributes_for_range,
                args=[self._iota_ref, range, attributes],
                arg_conversions=[None, _attributed_string_index_range(), ValueType("AttributeContainer")],
                return_conversion=VOID,
            )

        def merge_attributes(self, attributes, keep_current=False):
            # keepCurrent is a raw Swift.Bool C arg; pass it through verbatim the
            # way self/`_iota_ref` pointers are (conversion None).
            return call(
                _attributed_string_merge_attributes,
                args=[self._iota_ref, attributes, _bool_value(keep_current)],
                arg_conversions=[None, ValueType("AttributeContainer"), None],
                return_conversion=VOID,
            )

        def merge_attributes_for_range(self, range, attributes, keep_current=False):
            return call(
                _attributed_string_merge_attributes_for_range,
                args=[self._iota_ref, range, attributes, _bool_value(keep_current)],
                arg_conversions=[None, _attributed_string_index_range(), ValueType("AttributeContainer"), None],
                return_conversion=VOID,
            )

        def replace_attributes(self, attributes, others):
            return call(
                _attributed_string_replace_attributes,
                args=[self._iota_ref, attributes, others],
                arg_conversions=[None, ValueType("AttributeContainer"), ValueType("AttributeContainer")],
                return_conversion=VOID,
            )

        def replace_attributes_for_range(self, range, attributes, others):
            return call(
                _attributed_string_replace_attributes_for_range,
                args=[self._iota_ref, range, attributes, others],
                arg_conversions=[
                    None,
                    _attributed_string_index_range(),
                    ValueType("AttributeContainer"),
                    ValueType("AttributeContainer"),
                ],
                return_conversion=VOID,
            )

        @staticmethod
        def _create_empty():
            # Private helper for Swift's `init()`: Foundation's empty
            # AttributedString (no text, no attributes). The cdecl returns a fresh
            # owned reference. Reached Pythonically via `AttributedString()`.
            return call(
                _attributed_string_create_empty,
                return_conversion=ValueType("AttributedString"),
            )

        @staticmethod
        def _create_from_substring(substring):
            # Private helper for Swift's `init(_ substring:)`: materialises a
            # substring's text and attributes into a standalone AttributedString.
            # Reached Pythonically via `AttributedString(some_substring)`.
            return call(
                _attributed_string_create_from_substring,
                args=[substring],
                arg_conversions=[ValueType("AttributedSubstring")],
                return_conversion=ValueType("AttributedString"),
            )

        def __copy__(self):
            # Foundation AttributedString is a value type; the Pythonic clone is a
            # deep, independent copy, built from the whole-string substring (Swift's
            # `init(_ substring:)`). Expose it as copy.__copy__ so `copy.copy(value)`
            # and the explicit `copy()` method both work.
            return AttributedString._create_from_substring(self.substring)

        def copy(self):
            return self.__copy__()

        def __add__(self, other):
            # Concatenation returns a new value (operator+ in Dart/Kotlin): clone,
            # then append the right operand. Accepts an AttributedString, an
            # AttributedSubstring, or a plain str (promoted to an AttributedString).
            result = self.__copy__()
            if isinstance(other, AttributedString):
                result.append(other)
            elif isinstance(other, AttributedSubstring):
                result.append_substring(other)
            elif isinstance(other, str):
                result.append(AttributedString(other))
            else:
                return NotImplemented
            return result

        def __getitem__(self, range):
            return self.substring_for_range(range)

        def __setitem__(self, range, value):
            # Mirrors Kotlin's `operator set(range, …)`: replace the slice with an
            # AttributedString, an AttributedSubstring, or a plain str.
            if isinstance(value, AttributedString):
                self.replace_subrange(range, value)
            elif isinstance(value, AttributedSubstring):
                self.replace_subrange_with_substring(range, value)
            elif isinstance(value, str):
                self.replace_subrange(range, AttributedString(value))
            else:
                raise TypeError(
                    f"Expected AttributedString, AttributedSubstring, or str, got {type(value).__name__}"
                )

        def __eq__(self, other):
            return _runtime_reference_equals(AttributedString, _attributed_string_equals, self, other)

        def __hash__(self):
            return _runtime_reference_hash(_attributed_string_hash, self)


    class AttributedString_Index(SwiftReference):
        def _compare(self, other):
            if not isinstance(other, AttributedString_Index):
                return NotImplemented
            return check(lambda exn: _attributed_string_index_compare(
                env,
                self._iota_ref,
                other._iota_ref,
                exn,
            ))

        def __eq__(self, other):
            return _runtime_reference_equals(AttributedString_Index, _attributed_string_index_equals, self, other)

        def __lt__(self, other):
            result = self._compare(other)
            return NotImplemented if result is NotImplemented else result < 0

        def __le__(self, other):
            result = self._compare(other)
            return NotImplemented if result is NotImplemented else result <= 0

        def __gt__(self, other):
            result = self._compare(other)
            return NotImplemented if result is NotImplemented else result > 0

        def __ge__(self, other):
            result = self._compare(other)
            return NotImplemented if result is NotImplemented else result >= 0

        def __hash__(self):
            return _runtime_reference_hash(_attributed_string_index_hash, self)


    class AttributedString_UnicodeScalarView(SwiftReference):
        @property
        def start_index(self):
            return call(
                _unicode_scalar_view_get_start_index,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_Index"),
            )

        @property
        def end_index(self):
            return call(
                _unicode_scalar_view_get_end_index,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_Index"),
            )

        def index_before(self, index):
            return call(
                _unicode_scalar_view_index_before,
                args=[self._iota_ref, index],
                arg_conversions=[None, ValueType("AttributedString_Index")],
                return_conversion=ValueType("AttributedString_Index"),
            )

        def index_after(self, index):
            return call(
                _unicode_scalar_view_index_after,
                args=[self._iota_ref, index],
                arg_conversions=[None, ValueType("AttributedString_Index")],
                return_conversion=ValueType("AttributedString_Index"),
            )

        def element_at(self, index):
            # elementAt returns UInt32.CType, a raw uint32_t scalar (not a boxed
            # foreignObject), so it must NOT flow through a foreignObject return
            # conversion; validate the raw value the way UINT32 would.
            return _uint32_value(call(
                _unicode_scalar_viewelement_at,
                args=[self._iota_ref, index],
                arg_conversions=[None, ValueType("AttributedString_Index")],
            ))

        def __getitem__(self, index):
            return self.element_at(index)

        def __iter__(self):
            return _AttributedStringViewIterator(self)


    class AttributedString_CharacterView(SwiftReference):
        @property
        def start_index(self):
            return call(
                _character_view_get_start_index,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_Index"),
            )

        @property
        def end_index(self):
            return call(
                _character_view_get_end_index,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_Index"),
            )

        def index_before(self, index):
            return call(
                _character_view_index_before,
                args=[self._iota_ref, index],
                arg_conversions=[None, ValueType("AttributedString_Index")],
                return_conversion=ValueType("AttributedString_Index"),
            )

        def index_after(self, index):
            return call(
                _character_view_index_after,
                args=[self._iota_ref, index],
                arg_conversions=[None, ValueType("AttributedString_Index")],
                return_conversion=ValueType("AttributedString_Index"),
            )

        def element_at(self, index):
            return call(
                _character_viewelement_at,
                args=[self._iota_ref, index],
                arg_conversions=[None, ValueType("AttributedString_Index")],
                return_conversion=STRING,
            )

        def __getitem__(self, index):
            return self.element_at(index)

        def __iter__(self):
            return _AttributedStringViewIterator(self)


    class AttributedString_Runs(SwiftReference):
        @property
        def start_index(self):
            return call(
                _runs_get_start_index,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_Runs_Index"),
            )

        @property
        def end_index(self):
            return call(
                _runs_get_end_index,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_Runs_Index"),
            )

        def index_before(self, index):
            return call(
                _runs_index_before,
                args=[self._iota_ref, index],
                arg_conversions=[None, ValueType("AttributedString_Runs_Index")],
                return_conversion=ValueType("AttributedString_Runs_Index"),
            )

        def index_after(self, index):
            return call(
                _runs_index_after,
                args=[self._iota_ref, index],
                arg_conversions=[None, ValueType("AttributedString_Runs_Index")],
                return_conversion=ValueType("AttributedString_Runs_Index"),
            )

        def element_at(self, index):
            return call(
                _runselement_at,
                args=[self._iota_ref, index],
                arg_conversions=[None, ValueType("AttributedString_Runs_Index")],
                return_conversion=ValueType("AttributedString_Runs_Run"),
            )

        def element_at_position(self, index):
            return call(
                _runselement_at_position,
                args=[self._iota_ref, index],
                arg_conversions=[None, ValueType("AttributedString_Index")],
                return_conversion=ValueType("AttributedString_Runs_Run"),
            )

        def __getitem__(self, index):
            if isinstance(index, AttributedString_Index):
                return self.element_at_position(index)
            return self.element_at(index)

        def __iter__(self):
            return _AttributedStringViewIterator(self)

        def __eq__(self, other):
            return _runtime_reference_equals(AttributedString_Runs, _runs_equals, self, other)

        def __hash__(self):
            return _runtime_reference_hash(_runs_hash, self)


    class AttributedString_Runs_Index(SwiftReference):
        def _compare(self, other):
            if not isinstance(other, AttributedString_Runs_Index):
                return NotImplemented
            return check(lambda exn: _runs_index_compare(
                env,
                self._iota_ref,
                other._iota_ref,
                exn,
            ))

        def __eq__(self, other):
            return _runtime_reference_equals(AttributedString_Runs_Index, _runs_index_equals, self, other)

        def __lt__(self, other):
            result = self._compare(other)
            return NotImplemented if result is NotImplemented else result < 0

        def __le__(self, other):
            result = self._compare(other)
            return NotImplemented if result is NotImplemented else result <= 0

        def __gt__(self, other):
            result = self._compare(other)
            return NotImplemented if result is NotImplemented else result > 0

        def __ge__(self, other):
            result = self._compare(other)
            return NotImplemented if result is NotImplemented else result >= 0

        def __hash__(self):
            return _runtime_reference_hash(_runs_index_hash, self)


    class AttributedString_Runs_Run(SwiftReference):
        @property
        def range(self):
            return call(
                _runs_run_get_range,
                args=[self._iota_ref],
                return_conversion=_attributed_string_index_range(),
            )

        @property
        def attributes(self):
            return call(
                _runs_run_get_attributes,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributeContainer"),
            )

        def __eq__(self, other):
            return _runtime_reference_equals(AttributedString_Runs_Run, _runs_run_equals, self, other)

        def __hash__(self):
            return _runtime_reference_hash(_runs_run_hash, self)


    class _AttributedStringViewIterator:
        """Drives the Swift index-navigation protocol shared by every
        AttributedString view (Runs/CharacterView/UnicodeScalarView): start at
        ``start_index`` and advance with ``index_after`` until ``end_index``,
        yielding each element at its position. Mirrors the per-view iterators
        in the Dart/Kotlin runtimes."""

        def __init__(self, view):
            self._view = view
            self._index = view.start_index
            self._end_index = view.end_index

        def __iter__(self):
            return self

        def __next__(self):
            if self._index == self._end_index:
                raise StopIteration
            element = self._view.element_at(self._index)
            self._index = self._view.index_after(self._index)
            return element


    _opaque_runtime_references = {
        "AttributedString_Index": AttributedString_Index,
        "AttributedString_UnicodeScalarView": AttributedString_UnicodeScalarView,
        "AttributedString_CharacterView": AttributedString_CharacterView,
        "AttributedString_Runs": AttributedString_Runs,
        "AttributedString_Runs_Index": AttributedString_Runs_Index,
        "AttributedString_Runs_Run": AttributedString_Runs_Run,
    }
    _opaque_runtime_reference_names = list(_opaque_runtime_references)


    class AttributedSubstring(SwiftReference):
        def __init__(self):
            # Pythonic constructor for Swift's only exported AttributedSubstring
            # init — `init()` — a substring over an empty base AttributedString.
            # Build the native value, then adopt its reference (detaching the
            # temporary wrapper's finalizer so it does not double-release).
            built = AttributedSubstring._create_empty()
            built._iota_finalizer.detach()
            self._adopt_iota_ref(built._iota_ref)

        @property
        def base(self):
            return call(
                _attributed_substring_get_base,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString"),
            )

        @property
        def string(self):
            return call(
                _attributed_substring_get_string,
                args=[self._iota_ref],
                return_conversion=STRING,
            )

        @property
        def runs(self):
            return call(
                _attributed_substring_get_runs,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_Runs"),
            )

        @property
        def characters(self):
            return call(
                _attributed_substring_get_characters,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_CharacterView"),
            )

        @property
        def unicode_scalars(self):
            return call(
                _attributed_substring_get_unicode_scalars,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_UnicodeScalarView"),
            )

        @property
        def start_index(self):
            return call(
                _attributed_substring_get_start_index,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_Index"),
            )

        @property
        def end_index(self):
            return call(
                _attributed_substring_get_end_index,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString_Index"),
            )

        @property
        def substring(self):
            return call(
                _attributed_substring_get_substring,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedSubstring"),
            )

        def substring_for_range(self, range):
            # Private: bridges Swift's `subscript(range:)`. The sole public
            # accessor is `__getitem__` (`obj[range]`).
            return call(
                _attributed_substringsubstring_for_range,
                args=[self._iota_ref, range],
                arg_conversions=[None, _attributed_string_index_range()],
                return_conversion=ValueType("AttributedSubstring"),
            )

        @staticmethod
        def _create_empty():
            # Private helper for Swift's `init()`: a substring over an empty base
            # AttributedString. The cdecl returns a fresh owned reference. Reached
            # Pythonically via `AttributedSubstring()`.
            return call(
                _attributed_substring_create_empty,
                return_conversion=ValueType("AttributedSubstring"),
            )

        def __getitem__(self, range):
            return self.substring_for_range(range)

        def __eq__(self, other):
            return _runtime_reference_equals(AttributedSubstring, _attributed_substring_equals, self, other)

        def __hash__(self):
            return _runtime_reference_hash(_attributed_substring_hash, self)


    class AttributeContainer(SwiftReference):
        @property
        def foundation(self):
            return call(
                _foundation_attributes_create_from_container,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributeContainer_FoundationAttributes"),
            )

        def merge(self, other, keep_current=False):
            # Merges another container's attributes into this one in place; with
            # keep_current=False (the default) the other's values win on conflict.
            # Mirrors Dart/Kotlin `merge(other, keepCurrent)`.
            return call(
                _attribute_container_merge,
                args=[self._iota_ref, other, _bool_value(keep_current)],
                arg_conversions=[None, ValueType("AttributeContainer"), None],
                return_conversion=VOID,
            )

        def __init__(self):
            # Pythonic constructor for Swift's empty `init()`: an AttributeContainer
            # with no values. Build the native value via createEmpty, then adopt its
            # reference (detaching the temporary wrapper's finalizer so it does not
            # double-release). Mirrors how the rest of the family empty-constructs.
            built = call(
                _attribute_container_create_empty,
                return_conversion=ValueType("AttributeContainer"),
            )
            built._iota_finalizer.detach()
            self._adopt_iota_ref(built._iota_ref)

        def __eq__(self, other):
            return _runtime_reference_equals(AttributeContainer, _attribute_container_equals, self, other)

        def __hash__(self):
            return _runtime_reference_hash(_attribute_container_hash, self)


    class AttributeContainer_FoundationAttributes(SwiftReference):
        def __init__(self):
            # Pythonic constructor for Swift's empty `init()`: a FoundationAttributes
            # with no fields set. Build the native value via createEmpty, then adopt
            # its reference (detaching the temporary wrapper's finalizer so it does
            # not double-release). Mirrors how AttributedString() empty-constructs.
            built = call(
                _foundation_attributes_create_empty,
                return_conversion=ValueType("AttributeContainer_FoundationAttributes"),
            )
            built._iota_finalizer.detach()
            self._adopt_iota_ref(built._iota_ref)

        @property
        def link(self):
            return call(
                _foundation_attributes_get_link,
                args=[self._iota_ref],
                return_conversion=Optional(URL),
            )

        @link.setter
        def link(self, value):
            # Bridges Swift's `var link: URL?` setter. The optional URL marshals the
            # way the getter reads it: None -> NULL, a str -> a URL handle (Optional
            # wraps URL exactly as the family handles the other optionals).
            call(
                _foundation_attributes_set_link,
                args=[self._iota_ref, value],
                arg_conversions=[None, Optional(URL)],
                return_conversion=VOID,
            )

        @property
        def language_identifier(self):
            return call(
                _foundation_attributes_get_language_identifier,
                args=[self._iota_ref],
                return_conversion=Optional(STRING),
            )

        @language_identifier.setter
        def language_identifier(self, value):
            # Bridges Swift's `var languageIdentifier: String?` setter; None -> NULL,
            # a str -> a String handle, via the same Optional(STRING) the getter uses.
            call(
                _foundation_attributes_set_language_identifier,
                args=[self._iota_ref, value],
                arg_conversions=[None, Optional(STRING)],
                return_conversion=VOID,
            )

        def as_container(self):
            return call(
                _foundation_attributes_as_container,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributeContainer"),
            )

        def __eq__(self, other):
            return _runtime_reference_equals(
                AttributeContainer_FoundationAttributes,
                _foundation_attributes_equals,
                self,
                other,
            )

        def __hash__(self):
            return _runtime_reference_hash(_foundation_attributes_hash, self)


    setup_reference_type(runtime_lib.Foundation_AttributedString_setup, AttributedString)
    for type_name in _opaque_runtime_reference_names:
        setup_reference_type(getattr(runtime_lib, f"Foundation_{type_name}_setup"), _opaque_runtime_references[type_name])
    setup_reference_type(runtime_lib.Foundation_AttributedSubstring_setup, AttributedSubstring)
    setup_reference_type(runtime_lib.FishyJoesCommonRuntime_AttributeContainer_setup, AttributeContainer)
    setup_reference_type(
        runtime_lib.FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_setup,
        AttributeContainer_FoundationAttributes,
    )

    _runtime_type_exports = {
        "Runtime_AttributedString": AttributedString,
        "Runtime_AttributedSubstring": AttributedSubstring,
        "Runtime_AttributeContainer": AttributeContainer,
        "Runtime_AttributeContainer_FoundationAttributes": AttributeContainer_FoundationAttributes,
        **{f"Runtime_{name}": python_type for name, python_type in _opaque_runtime_references.items()},
    }


    return _runtime_type_exports
