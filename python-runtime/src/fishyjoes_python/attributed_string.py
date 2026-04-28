"""Python wrappers for Swift's ``AttributedString`` and friends.

Opaque-handle port that mirrors the Kotlin runtime's shape (one
Python class per Swift type) but routes every property/method through
**IOTA**, never JNI — the Python target is an Iota consumer like C#
and Dart.  Each Kotlin ``external fun __jni_X(...)`` becomes a single
``runtime.iota_lib.X(...)`` call here.

Each wrapper holds a ``NativeReference``; equality and hashing route
back to Swift via ``call_symbol`` so they reflect Swift's
``Equatable``/``Hashable`` semantics, not Python identity.

⚠️ Tech debt (see python-followups-plan.md §5.1, §5.2): Swift's
``AttributedString`` and ``AttributedString.Index`` are value types
with copy-on-write storage; the Python wrappers treat them as
reference types to keep the FFI shape simple.  Mutation methods on
this side mutate every Python reference to the underlying Swift
object — Swift's COW would not.  ``clone()`` is the documented
escape hatch.
"""
from __future__ import annotations

import logging
from collections.abc import Iterator
from dataclasses import dataclass
from typing import TYPE_CHECKING, Any, Generic, TypeVar

from .iota import NativeReference

if TYPE_CHECKING:
    from .iota import IotaRuntime
_T_co = TypeVar('_T_co', covariant=True)
_TRef = TypeVar('_TRef', bound=NativeReference)
_log = logging.getLogger('fishyjoes')

def _call_ref(runtime: IotaRuntime, symbol: str, cls: type[_TRef], *args: tuple[str, object]) -> _TRef:
    value = runtime.call_runtime_symbol(symbol, 'object', *args)
    if not isinstance(value, cls):
        raise RuntimeError(f'{symbol} returned {type(value).__name__}, expected {cls.__name__}')
    if value._runtime is None:
        value._runtime = runtime
    return value

def _call_object(runtime: IotaRuntime, symbol: str, *args: tuple[str, object]) -> object | None:
    return runtime.call_runtime_symbol(symbol, 'object', *args)

def _call_void(runtime: IotaRuntime, symbol: str, *args: tuple[str, object]) -> None:
    runtime.call_runtime_symbol(symbol, 'void', *args)

def _call_bool(runtime: IotaRuntime, symbol: str, *args: tuple[str, object]) -> bool:
    return bool(runtime.call_runtime_symbol(symbol, 'bool', *args))

def _call_int(runtime: IotaRuntime, symbol: str, *args: tuple[str, object]) -> int:
    return int(runtime.call_runtime_symbol(symbol, 'int', *args))

def _range_tuple(range: SwiftRange[AttributedStringIndex]) -> tuple[AttributedStringIndex, AttributedStringIndex]:
    return (range.lower_bound, range.upper_bound)

class _SwiftBackedReference(NativeReference):
    """Common base for AttributedString / AttributeContainer wrappers.

    The Python side never constructs a Swift object directly; it
    always asks the runtime to materialise one and hands back a
    handle.  This base owns the handle and routes equality + hashing
    through Swift.
    """
    __slots__ = ()
    _equals_symbol: str = ''
    _hash_symbol: str = ''

    def __eq__(self, other: object) -> bool:
        if other is self:
            return True
        if not isinstance(other, type(self)):
            return False
        if self.native_ref is None or other.native_ref is None:
            return self.native_ref == other.native_ref
        if not self._equals_symbol or self._runtime is None:
            return self.native_ref == other.native_ref
        return _call_bool(self._runtime, self._equals_symbol, ('object', self), ('object', other))

    def __hash__(self) -> int:
        if self.native_ref is None or not self._hash_symbol or self._runtime is None:
            return hash((type(self), self.native_ref))
        return _call_int(self._runtime, self._hash_symbol, ('object', self))

class AttributeContainer(_SwiftBackedReference):
    """A bag of typed Swift attributes (language identifier, link, etc.).

    Use ``AttributeContainerFoundationAttributes`` to construct a
    container with statically-typed Foundation attributes set on it.

    <!-- FishyJoes.exportReference(AttributeContainer) -->
    """
    __slots__ = ()
    _equals_symbol = '__iota_FishyJoesCommonRuntime_AttributeContainer_equals'
    _hash_symbol = '__iota_get_FishyJoesCommonRuntime_AttributeContainer_hash'

    @classmethod
    def create_empty(cls, runtime: IotaRuntime) -> AttributeContainer:
        """Equivalent to Kotlin ``AttributeContainer.createEmpty()``.

        <!-- FishyJoes.export(createEmpty) -->
        """
        runtime.ensure_loaded()
        return _call_ref(runtime, '__iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty', cls)

    def merge_attributes(self, other: AttributeContainer) -> None:
        """Merge ``other``'s attributes into ``self`` in place.  Mutating
        per §3.J.1; returns ``None``.

        <!-- FishyJoes.export(merge) -->
        """
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributeContainer is detached')
        _call_void(
            self._runtime,
            '__iota_FishyJoesCommonRuntime_AttributeContainer_merge',
            ('object', self),
            ('object', other),
            ('bool', False),
        )

class AttributeContainerFoundationAttributes(_SwiftBackedReference):
    """Statically-typed accessors for Foundation attributes (link, languageIdentifier).

    Mirrors the Kotlin class of the same name: one Swift backing object
    per instance; ``language_identifier`` and ``link`` are read/write
    properties; ``as_container()`` lifts to an ``AttributeContainer``.

    <!-- FishyJoes.exportReference(AttributeContainer.FoundationAttributes) -->
    """
    __slots__ = ()
    _equals_symbol = '__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals'
    _hash_symbol = '__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash'

    @classmethod
    def create_empty(cls, runtime: IotaRuntime) -> AttributeContainerFoundationAttributes:
        """<!-- FishyJoes.export(createEmpty) -->"""
        runtime.ensure_loaded()
        return _call_ref(runtime, '__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty', cls)

    @classmethod
    def from_container(cls, runtime: IotaRuntime, container: AttributeContainer) -> AttributeContainerFoundationAttributes:
        """<!-- FishyJoes.export(createFromContainer) -->"""
        runtime.ensure_loaded()
        return _call_ref(
            runtime,
            '__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer',
            cls,
            ('object', container),
        )

    @property
    def language_identifier(self) -> str | None:
        """<!-- FishyJoes.export(languageIdentifier) -->"""
        if self._runtime is None or self.native_ref is None:
            return None
        value = _call_object(
            self._runtime,
            '__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier',
            ('object', self),
        )
        return None if value is None else str(value)

    @language_identifier.setter
    def language_identifier(self, value: str | None) -> None:
        if self._runtime is None or self.native_ref is None:
            return
        _call_void(
            self._runtime,
            '__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier',
            ('object', self),
            ('object', value),
        )

    @property
    def link(self) -> str | None:
        """<!-- FishyJoes.export(link) -->"""
        if self._runtime is None or self.native_ref is None:
            return None
        value = _call_object(
            self._runtime,
            '__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link',
            ('object', self),
        )
        return None if value is None else str(value)

    @link.setter
    def link(self, value: str | None) -> None:
        if self._runtime is None or self.native_ref is None:
            return
        _call_void(
            self._runtime,
            '__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link',
            ('object', self),
            ('object', value),
        )

    def as_container(self) -> AttributeContainer:
        """<!-- FishyJoes.export(asContainer) -->"""
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributeContainerFoundationAttributes is detached')
        return _call_ref(
            self._runtime,
            '__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_asContainer',
            AttributeContainer,
            ('object', self),
        )

class AttributedString(_SwiftBackedReference):
    """Wrapper around Swift's ``AttributedString``.

    v1 surface: construction from (string, container), the ``string``
    property, equality/hashing.  Iteration views (``runs``, ``characters``,
    ``unicode_scalars``), substring views, and mutation methods are
    deferred to a follow-up — see this module's docstring.

    <!-- FishyJoes.exportReference(AttributedString) -->
    """
    __slots__ = ()
    _equals_symbol = '__iota_Foundation_AttributedString_equals'
    _hash_symbol = '__iota_get_Foundation_AttributedString_hash'

    @classmethod
    def create(cls, runtime: IotaRuntime, text: str, container: AttributeContainer | None=None) -> AttributedString:
        """Mirror of Swift ``AttributedString(text, container)`` /
        Kotlin ``AttributedString(text, container)``.

        <!-- FishyJoes.export(create) -->
        """
        runtime.ensure_loaded()
        return _call_ref(
            runtime,
            '__iota_Foundation_AttributedString_create',
            cls,
            ('object', text),
            ('object', container),
        )

    @property
    def string(self) -> str:
        """<!-- FishyJoes.export(string) -->"""
        if self._runtime is None or self.native_ref is None:
            return ''
        value = _call_object(self._runtime, '__iota_get_Foundation_AttributedString_string', ('object', self))
        return '' if value is None else str(value)

    @property
    def start_index(self) -> AttributedStringIndex:
        """``self.startIndex`` — the position of the first character.

        <!-- FishyJoes.export(startIndex) -->
        """
        return _materialise_index(self, '__iota_get_Foundation_AttributedString_startIndex')

    @property
    def end_index(self) -> AttributedStringIndex:
        """``self.endIndex`` — the past-the-end position.

        <!-- FishyJoes.export(endIndex) -->
        """
        return _materialise_index(self, '__iota_get_Foundation_AttributedString_endIndex')

    @property
    def substring(self) -> AttributedSubstring:
        """The whole string viewed as an ``AttributedSubstring`` (for
        Swift API parity).  Per §3 decisions this is a plain ``@property``
        — every access yields a fresh wrapper backed by Swift's current
        state, never cached.

        <!-- FishyJoes.export(substring) -->
        """
        return _materialise_substring(self, '__iota_get_Foundation_AttributedString_substring', base=self)

    @property
    def runs(self) -> AttributedStringRuns:
        """View of the attribute runs in this string.  Plain ``@property``
        per §3.G.1 — Swift returns a fresh view per access; we mirror
        that semantic to avoid serving stale views after mutation.

        <!-- FishyJoes.export(runs) -->
        """
        return _materialise_view(self, '__iota_get_Foundation_AttributedString_runs', kind=AttributedStringRuns, type_name='AttributedString.Runs')

    @property
    def characters(self) -> AttributedStringCharacterView:
        """View of the characters in this string.

        <!-- FishyJoes.export(characters) -->
        """
        return _materialise_view(self, '__iota_get_Foundation_AttributedString_characters', kind=AttributedStringCharacterView, type_name='AttributedString.CharacterView')

    @property
    def unicode_scalars(self) -> AttributedStringUnicodeScalarView:
        """View of the unicode scalars in this string.

        <!-- FishyJoes.export(unicodeScalars) -->
        """
        return _materialise_view(self, '__iota_get_Foundation_AttributedString_unicodeScalars', kind=AttributedStringUnicodeScalarView, type_name='AttributedString.UnicodeScalarView')

    def substring_for_range(self, range: SwiftRange[AttributedStringIndex]) -> AttributedSubstring:
        """Equivalent to Swift ``self[range]``.

        <!-- FishyJoes.export(substringForRange) -->
        """
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributedString is detached')
        sub = _call_ref(
            self._runtime,
            '__iota_Foundation_AttributedString_substringForRange',
            AttributedSubstring,
            ('object', self),
            ('object', _range_tuple(range)),
        )
        sub._base = self
        return sub

    def clone(self) -> AttributedString:
        """Returns an independent copy of this attributed string.

        ⚠️ Documented escape hatch for Swift's COW semantics (see
        ADR-0005).  Without ``clone``, ``b = a; b.append(x)`` mutates
        ``a`` too because both names refer to the same Swift object via
        the same Python wrapper.  Use ``b = a.clone(); b.append(x)`` —
        or ``b = copy.copy(a)`` via the standard Python protocol — to
        get the Swift-equivalent ``var b = a; b.append(x)``
        independence.

        Implementation matches the Dart runtime: the IOTA layer exposes
        no dedicated ``_clone`` symbol, so we round-trip through
        ``createFromSubstring(self.substring)``.  Kotlin and C# do the
        same thing via an iterate-and-rebuild fallback (with a TODO
        comment about a faster Swift-side ``cloneBox``); the substring
        round-trip is the cheapest cross-target-portable approach.

        <!-- FishyJoes.export(createFromSubstring) -->
        """
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributedString is detached')
        substring = self.substring
        return _call_ref(
            self._runtime,
            '__iota_Foundation_AttributedString_createFromSubstring',
            AttributedString,
            ('object', substring),
        )

    def __copy__(self) -> AttributedString:
        """Standard Python copy-protocol integration: ``copy.copy(s)``
        returns an independent ``AttributedString`` via ``clone()``.

        Ships alongside ``clone()`` so users reaching for the stdlib
        idiom (``copy.copy``) get the right semantic without having to
        learn the per-type ``clone()`` method.  Kotlin and C# integrate
        with their host's ``Cloneable`` / ``ICloneable`` for the same
        reason; this is the Python-idiomatic equivalent.
        """
        return self.clone()

    def __deepcopy__(self, memo: dict[int, Any]) -> AttributedString:
        """``copy.deepcopy(s)`` is identical to ``copy.copy(s)`` here:
        the AttributedString's contents are owned by Swift; there is no
        deeper Python state to copy."""
        return self.clone()

    def replace_subrange(self, range: SwiftRange[AttributedStringIndex], replacement: AttributedString) -> None:
        """Replace the contents of ``range`` with ``replacement`` in
        place.  Mirrors Swift's ``mutating func replaceSubrange(_:with:)``;
        returns ``None`` per §3.J.1.

        Note: mutates every Python reference to this Swift object —
        Swift's COW would not (see §5.1 tech debt).  Call ``clone()``
        first to get a private copy if other Python references exist.

        <!-- FishyJoes.export(replaceSubrange) -->
        """
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributedString is detached')
        _call_void(
            self._runtime,
            '__iota_Foundation_AttributedString_replaceSubrange',
            ('object', self),
            ('object', _range_tuple(range)),
            ('object', replacement),
        )

    def replace_subrange_with_substring(self, range: SwiftRange[AttributedStringIndex], replacement: AttributedSubstring) -> None:
        """Substring-typed variant of ``replace_subrange``.

        <!-- FishyJoes.export(replaceSubrangeWithSubstring) -->
        """
        self._mutate('replaceSubrangeWithSubstring', ('object', _range_tuple(range)), ('object', replacement))

    def append(self, other: AttributedString) -> None:
        """Append ``other`` to ``self`` in place (Swift mutating func).

        <!-- FishyJoes.export(append) -->
        """
        self._mutate('append', ('object', other))

    def append_substring(self, other: AttributedSubstring) -> None:
        """Substring-typed variant of ``append``.

        <!-- FishyJoes.export(appendSubstring) -->
        """
        self._mutate('appendSubstring', ('object', other))

    def insert(self, other: AttributedString, *, at: AttributedStringIndex) -> None:
        """Insert ``other`` at the given index (Swift mutating func).

        <!-- FishyJoes.export(insert) -->
        """
        self._mutate('insert', ('object', other), ('object', at))

    def insert_substring(self, other: AttributedSubstring, *, at: AttributedStringIndex) -> None:
        """Substring-typed variant of ``insert``.

        <!-- FishyJoes.export(insertSubstring) -->
        """
        self._mutate('insertSubstring', ('object', other), ('object', at))

    def remove_subrange(self, range: SwiftRange[AttributedStringIndex]) -> None:
        """Remove the contents of ``range`` in place.

        <!-- FishyJoes.export(removeSubrange) -->
        """
        self._mutate('removeSubrange', ('object', _range_tuple(range)))

    def set_attributes_for_range(self, range: SwiftRange[AttributedStringIndex], attributes: AttributeContainer) -> None:
        """Set the attributes on the given range, replacing any
        existing attributes there.  Mutates ``self`` in place.

        <!-- FishyJoes.export(setAttributesForRange) -->
        """
        self._mutate('setAttributesForRange', ('object', _range_tuple(range)), ('object', attributes))

    def merge_attributes_for_range(self, range: SwiftRange[AttributedStringIndex], attributes: AttributeContainer) -> None:
        """Merge the given attributes into the existing attributes on
        the range.  Mutates ``self`` in place.

        <!-- FishyJoes.export(mergeAttributesForRange) -->
        """
        self._mutate('mergeAttributesForRange', ('object', _range_tuple(range)), ('object', attributes), ('bool', False))

    def replace_attributes_for_range(self, range: SwiftRange[AttributedStringIndex], old_attributes: AttributeContainer, new_attributes: AttributeContainer) -> None:
        """Replace ``old_attributes`` with ``new_attributes`` everywhere
        within ``range`` where ``old_attributes`` occur.  Mutates
        ``self`` in place.

        <!-- FishyJoes.export(replaceAttributesForRange) -->
        """
        self._mutate(
            'replaceAttributesForRange',
            ('object', _range_tuple(range)),
            ('object', old_attributes),
            ('object', new_attributes),
        )

    def set_attributes(self, attributes: AttributeContainer) -> None:
        """Set the attributes on every run of the whole string.
        Whole-string variant of ``set_attributes_for_range``.

        <!-- FishyJoes.export(setAttributes) -->
        """
        self._mutate('setAttributes', ('object', attributes))

    def merge_attributes(self, attributes: AttributeContainer) -> None:
        """Merge ``attributes`` into every run of the whole string.
        Whole-string variant of ``merge_attributes_for_range``.

        <!-- FishyJoes.export(mergeAttributes) -->
        """
        self._mutate('mergeAttributes', ('object', attributes), ('bool', False))

    def replace_attributes(self, old_attributes: AttributeContainer, new_attributes: AttributeContainer) -> None:
        """Replace ``old_attributes`` with ``new_attributes`` everywhere
        in the string.  Whole-string variant of
        ``replace_attributes_for_range``.

        <!-- FishyJoes.export(replaceAttributes) -->
        """
        self._mutate('replaceAttributes', ('object', old_attributes), ('object', new_attributes))

    def _mutate(self, suffix: str, *args: tuple[str, object]) -> None:
        """Shared single-symbol mutating-call shim.

        Every mutator on AttributedString routes through one IOTA
        symbol that takes ``self.native_ref`` and zero or more
        positional handle/value arguments.  Centralising the dispatch
        keeps the per-method body to a single line and makes adding
        new mutators (steps J–L) a one-line edit.
        """
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributedString is detached')
        symbol = f'__iota_Foundation_AttributedString_{suffix}'
        _call_void(self._runtime, symbol, ('object', self), *args)

@dataclass(frozen=True, slots=True)
class SwiftRange(Generic[_T_co]):
    """Pure-Python value-type port of Swift's ``Range<T>``.

    Swift's ``Range`` is itself a value type and the bounds *are* the
    data; no Swift round-trip is required.  Hashable (free from frozen
    dataclass) so callers can use ``SwiftRange`` instances as dict keys
    or in sets.

    Per python-followups-plan.md §3.F.1 (locked).
    """
    lower_bound: _T_co
    upper_bound: _T_co

class AttributedStringIndex(_SwiftBackedReference):
    """Opaque wrapper around Swift's ``AttributedString.Index``.

    Swift's ``Index`` is a value type, but reconstructing one from raw
    Python data is impossible without poking at internals; the v1 port
    keeps it as a reference-type opaque handle (§5.2 tech debt).
    Equality and hashing route through Swift via ``_equals_symbol`` /
    ``_hash_symbol`` per the ``_SwiftBackedReference`` base.

    <!-- FishyJoes.exportReference(AttributedString.Index) -->
    """
    __slots__ = ()
    _equals_symbol = '__iota_Foundation_AttributedString_Index_equals'
    _hash_symbol = '__iota_get_Foundation_AttributedString_Index_hash'

class AttributedStringRunsIndex(AttributedStringIndex):
    """Opaque wrapper around Swift's ``AttributedString.Runs.Index``.

    It subclasses ``AttributedStringIndex`` so the public type guard for
    ``runs[index]`` remains source-compatible while equality/hash route
    to the distinct Swift ``Runs.Index`` symbols.
    """
    __slots__ = ()
    _equals_symbol = '__iota_Foundation_AttributedString_Runs_Index_equals'
    _hash_symbol = '__iota_get_Foundation_AttributedString_Runs_Index_hash'

@dataclass(slots=True)
class AttributedSubstring(_SwiftBackedReference):
    """Wrapper around Swift's ``AttributedSubstring``.

    Carries an optional ``_base`` strong reference back to the parent
    ``AttributedString`` so the parent stays alive at least as long as
    any substring derived from it.

    <!-- FishyJoes.exportReference(AttributedSubstring) -->
    """
    _base: AttributedString | None = None
    _equals_symbol = '__iota_Foundation_AttributedSubstring_equals'
    _hash_symbol = '__iota_get_Foundation_AttributedSubstring_hash'

    @property
    def string(self) -> str:
        """<!-- FishyJoes.export(string) -->"""
        if self._runtime is None or self.native_ref is None:
            return ''
        value = _call_object(self._runtime, '__iota_get_Foundation_AttributedSubstring_string', ('object', self))
        return '' if value is None else str(value)

    @property
    def base(self) -> AttributedString:
        """The parent ``AttributedString`` this substring views into.

        <!-- FishyJoes.export(base) -->
        """
        if self._base is not None:
            return self._base
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributedSubstring is detached')
        return _call_ref(self._runtime, '__iota_get_Foundation_AttributedSubstring_base', AttributedString, ('object', self))

    @property
    def substring(self) -> AttributedSubstring:
        """Per Swift: ``substring.substring`` is the substring itself.

        <!-- FishyJoes.export(substring) -->
        """
        return self

    def __getitem__(self, range: SwiftRange[AttributedStringIndex]) -> AttributedSubstring:
        """<!-- FishyJoes.export(substringForRange) -->"""
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributedSubstring is detached')
        sub = _call_ref(
            self._runtime,
            '__iota_Foundation_AttributedSubstring_substringForRange',
            AttributedSubstring,
            ('object', self),
            ('object', _range_tuple(range)),
        )
        sub._base = self._base
        return sub
_TView = TypeVar('_TView', bound='_SwiftBackedReference')

def _materialise_index(
    owner: _SwiftBackedReference,
    symbol: str,
    *,
    kind: type[AttributedStringIndex] = AttributedStringIndex,
) -> AttributedStringIndex:
    if owner._runtime is None or owner.native_ref is None:
        raise RuntimeError(f'{type(owner).__name__} is detached')
    return _call_ref(owner._runtime, symbol, kind, ('object', owner))

def _materialise_substring(owner: AttributedString, symbol: str, *, base: AttributedString) -> AttributedSubstring:
    if owner._runtime is None or owner.native_ref is None:
        raise RuntimeError('AttributedString is detached')
    sub = _call_ref(owner._runtime, symbol, AttributedSubstring, ('object', owner))
    sub._base = base
    return sub

def _materialise_view(owner: _SwiftBackedReference, symbol: str, *, kind: type[_TView], type_name: str) -> _TView:
    if owner._runtime is None or owner.native_ref is None:
        raise RuntimeError(f'{type(owner).__name__} is detached')
    return _call_ref(owner._runtime, symbol, kind, ('object', owner))

class _IndexedViewBase(_SwiftBackedReference):
    """Common surface of ``Runs`` / ``CharacterView`` / ``UnicodeScalarView``.

    Each view is a Swift-backed bidirectional collection; the navigation
    methods (``startIndex``/``endIndex``/``indexAfter``/``indexBefore``)
    have identical IOTA shapes — only the symbol prefix differs.  The
    ``_iota_prefix`` class attribute names that prefix; subclasses
    override it.
    """
    __slots__ = ()
    # Bare type prefix, e.g. ``Foundation_AttributedString_Runs``.  IOTA
    # decorates with ``__iota_get_`` for property getters and ``__iota_``
    # for method-form symbols; the prefix here is the part *between* those
    # decorations and the operation name.
    _iota_prefix: str = ''
    _index_type: type[AttributedStringIndex] = AttributedStringIndex

    @property
    def start_index(self) -> AttributedStringIndex:
        """<!-- FishyJoes.export(startIndex) -->"""
        return _materialise_index(self, f'__iota_get_{self._iota_prefix}_startIndex', kind=self._index_type)

    @property
    def end_index(self) -> AttributedStringIndex:
        """<!-- FishyJoes.export(endIndex) -->"""
        return _materialise_index(self, f'__iota_get_{self._iota_prefix}_endIndex', kind=self._index_type)

    def index_after(self, index: AttributedStringIndex) -> AttributedStringIndex:
        """<!-- FishyJoes.export(indexAfter) -->"""
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError(f'{type(self).__name__} is detached')
        return _call_ref(self._runtime, f'__iota_{self._iota_prefix}_indexAfter', self._index_type, ('object', self), ('object', index))

    def index_before(self, index: AttributedStringIndex) -> AttributedStringIndex:
        """<!-- FishyJoes.export(indexBefore) -->"""
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError(f'{type(self).__name__} is detached')
        return _call_ref(self._runtime, f'__iota_{self._iota_prefix}_indexBefore', self._index_type, ('object', self), ('object', index))

class AttributedStringRuns(_IndexedViewBase):
    """Iterable view of the attribute runs in an ``AttributedString``.

    Live iteration per §3.H.1: walks from ``start_index`` to
    ``end_index`` via ``index_after``, yielding ``element_at(idx)``.
    Mutating the underlying string during iteration is undefined —
    same contract as iterating a Python ``list``.

    <!-- FishyJoes.exportReference(AttributedString.Runs) -->
    """
    __slots__ = ()
    _iota_prefix = 'Foundation_AttributedString_Runs'
    _index_type = AttributedStringRunsIndex
    _equals_symbol = '__iota_Foundation_AttributedString_Runs_equals'
    _hash_symbol = '__iota_get_Foundation_AttributedString_Runs_hash'

    def element_at(self, index: AttributedStringIndex) -> AttributedStringRun:
        """<!-- FishyJoes.export(elementAt) -->"""
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributedStringRuns is detached')
        return _call_ref(
            self._runtime,
            '__iota_Foundation_AttributedString_Runs_elementAt',
            AttributedStringRun,
            ('object', self),
            ('object', index),
        )

    def __iter__(self) -> Iterator[AttributedStringRun]:
        return _walk_view(self, lambda idx: self.element_at(idx))

    def __getitem__(self, index: AttributedStringIndex) -> AttributedStringRun:
        """Per §3.K.1: only ``Index`` is accepted, never ``int``.
        Swift's ``Runs`` collection is keyed by ``Index`` only."""
        if not isinstance(index, AttributedStringIndex):
            raise TypeError(f'AttributedStringRuns is keyed by AttributedStringIndex, got {type(index).__name__}')
        return self.element_at(index)

    def range_iterator(self) -> Iterator[SwiftRange[AttributedStringIndex]]:
        """Yield each run's range as a ``SwiftRange[Index]``.
        Mirrors Kotlin ``runs.rangeIterator().asSequence()``."""
        for run in self:
            yield run.range

class AttributedStringRun(_SwiftBackedReference):
    """A single attribute run: a contiguous range of the string with a
    single attribute container.

    <!-- FishyJoes.exportReference(AttributedString.Runs.Run) -->
    """
    __slots__ = ()
    _equals_symbol = '__iota_Foundation_AttributedString_Runs_Run_equals'
    _hash_symbol = '__iota_get_Foundation_AttributedString_Runs_Run_hash'

    @property
    def range(self) -> SwiftRange[AttributedStringIndex]:
        """The range of the parent string this run covers.

        IOTA exposes ``__iota_get_Foundation_AttributedString_Runs_Run_range``
        as a single getter returning ``Range<AttributedString.Index>`` —
        not split into ``lowerBound`` / ``upperBound`` symbols.  The
        runtime's range converter materialises the value as a Python
        ``(lower_bound, upper_bound)`` tuple via
        ``consume_foreign_object``; we wrap that in our pure-Python
        ``SwiftRange`` for API parity with the rest of this module.

        <!-- FishyJoes.export(range) -->
        """
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributedStringRun is detached')
        value = _call_object(
            self._runtime,
            '__iota_get_Foundation_AttributedString_Runs_Run_range',
            ('object', self),
        )
        # The runtime range converter is registered to produce
        # ``(lower, upper)`` tuples.  Adopt either shape — strict typing
        # would fail loudly via ``TypeMismatchError`` further upstream.
        if isinstance(value, tuple) and len(value) == 2:
            lower_raw, upper_raw = value
        elif isinstance(value, SwiftRange):
            return value  # already the right shape
        else:
            raise RuntimeError(
                f'Unexpected return shape for Run.range: {type(value).__name__}',
            )
        def _as_index(v: object) -> AttributedStringIndex:
            if isinstance(v, AttributedStringIndex):
                return v
            return AttributedStringIndex(
                native_ref=int(v) if v is not None else 0,  # type: ignore[call-overload]
                native_type='AttributedString.Index',
                _runtime=self._runtime,
            )
        return SwiftRange(lower_bound=_as_index(lower_raw), upper_bound=_as_index(upper_raw))

    @property
    def attributes(self) -> AttributeContainer:
        """<!-- FishyJoes.export(attributes) -->"""
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributedStringRun is detached')
        return _call_ref(
            self._runtime,
            '__iota_get_Foundation_AttributedString_Runs_Run_attributes',
            AttributeContainer,
            ('object', self),
        )

class AttributedStringCharacterView(_IndexedViewBase):
    """View of the characters in an ``AttributedString``.  Each element
    is a single-character ``str``.

    <!-- FishyJoes.exportReference(AttributedString.CharacterView) -->
    """
    __slots__ = ()
    _iota_prefix = 'Foundation_AttributedString_CharacterView'
    _equals_symbol = 'FishyJoesCommonRuntime_AttributedString_CharacterView_equals'
    _hash_symbol = 'FishyJoesCommonRuntime_AttributedString_CharacterView_hash'

    def element_at(self, index: AttributedStringIndex) -> str:
        """<!-- FishyJoes.export(elementAt) -->"""
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributedStringCharacterView is detached')
        value = _call_object(
            self._runtime,
            '__iota_Foundation_AttributedString_CharacterView_elementAt',
            ('object', self),
            ('object', index),
        )
        return '' if value is None else str(value)

    def __iter__(self) -> Iterator[str]:
        return _walk_view(self, lambda idx: self.element_at(idx))

class AttributedStringUnicodeScalarView(_IndexedViewBase):
    """View of the unicode scalars in an ``AttributedString``.  Each
    element is a Swift ``UnicodeScalar``, surfaced to Python as ``int``
    (the scalar's codepoint).

    <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
    """
    __slots__ = ()
    _iota_prefix = 'Foundation_AttributedString_UnicodeScalarView'
    _equals_symbol = 'FishyJoesCommonRuntime_AttributedString_UnicodeScalarView_equals'
    _hash_symbol = 'FishyJoesCommonRuntime_AttributedString_UnicodeScalarView_hash'

    def element_at(self, index: AttributedStringIndex) -> int:
        """<!-- FishyJoes.export(elementAt) -->"""
        if self._runtime is None or self.native_ref is None:
            raise RuntimeError('AttributedStringUnicodeScalarView is detached')
        return int(self._runtime.call_runtime_symbol(
            '__iota_Foundation_AttributedString_UnicodeScalarView_elementAt',
            'uint32',
            ('object', self),
            ('object', index),
        ))

    def __iter__(self) -> Iterator[int]:
        return _walk_view(self, lambda idx: self.element_at(idx))
_TElement = TypeVar('_TElement')

def _walk_view(view: _IndexedViewBase, extract: Any) -> Iterator[Any]:
    """Walk a Swift bidirectional collection view from ``start_index``
    to ``end_index`` via ``index_after``, yielding ``extract(idx)`` at
    each position.

    Live iteration: rebinds ``end_index`` once at start (matching
    Swift) — mutation during iteration is undefined.  Termination
    compares the current index against the captured end via the
    Swift-routed ``Index.__eq__`` so ``startIndex == endIndex`` empty
    views terminate immediately.
    """
    idx = view.start_index
    end = view.end_index
    while idx != end:
        yield extract(idx)
        idx = view.index_after(idx)

def _coerce_handle(value: Any) -> int:
    """Best-effort cffi-cdata or int -> Python int."""
    if isinstance(value, int):
        return value
    return int(value)
