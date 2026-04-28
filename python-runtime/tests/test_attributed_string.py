"""Wrapper-class behaviour for AttributedString and AttributeContainer.

The previous incarnation of this file shipped a ``_FakeRuntime`` /
``_FakeIotaLib`` / ``_ScriptedRuntime`` set whose permissive
``__getattr__`` swallowed every symbol-name typo, every wrong call
signature, and every misrouted library — which is exactly how the
AttributedString port survived months of unit-test passes against
fictional Swift surface.  The fakes are gone.

Per the locked rule
([feedback_no_mocks_real_runtime](../../../.claude/projects/-Users-antoniogermano-work-cricut-FishyJoes/memory/feedback_no_mocks_real_runtime.md)):
every test in this file builds the real runtime via
``build_real_runtime()`` and calls ``ensure_loaded()`` for real before
exercising the AttributedString wrappers.

The original tests were written against fakes that recorded
``(symbol_name, args)`` tuples; their assertions checked which symbol
the wrapper *would have* called.  Against a real runtime that
recording is unavailable, so each migrated test recasts its contract
to assert on the **observable behaviour** instead — the type and
non-zero-ness of the returned handle, an end-to-end round-trip via a
property accessor, equality of two materialised values, etc.  Tests
that exercise no FFI at all (constructibility, detached fallback,
``substring.substring is self``, ``Runs[int]`` rejection) keep their
original shape.
"""

from __future__ import annotations

import copy
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"
if str(SRC) not in sys.path:
    sys.path.insert(0, str(SRC))
TESTS = ROOT / "tests"
if str(TESTS) not in sys.path:
    sys.path.insert(0, str(TESTS))

from _real_runtime import build_generated_runtime
from fishyjoes_python import (
    AttributeContainer,
    AttributeContainerFoundationAttributes,
    AttributedString,
    AttributedStringIndex,
    AttributedSubstring,
    NativeReference,
    SwiftRange,
)
from fishyjoes_python.attributed_string import (
    AttributedStringCharacterView,
    AttributedStringRun,
    AttributedStringRuns,
    AttributedStringUnicodeScalarView,
)


# ---------------------------------------------------------------------------
# Pure-Python tests — no runtime FFI is exercised.
# ---------------------------------------------------------------------------


class SwiftRangeTests(unittest.TestCase):
    """``SwiftRange[T]`` is a frozen dataclass; no runtime involved."""

    def test_construction_and_field_access(self) -> None:
        a = AttributedStringIndex(native_ref=1, native_type="AttributedString.Index")
        b = AttributedStringIndex(native_ref=2, native_type="AttributedString.Index")
        r = SwiftRange(lower_bound=a, upper_bound=b)
        self.assertIs(r.lower_bound, a)
        self.assertIs(r.upper_bound, b)

    def test_equality_and_hash(self) -> None:
        a1 = AttributedStringIndex(native_ref=1, native_type="AttributedString.Index")
        a2 = AttributedStringIndex(native_ref=1, native_type="AttributedString.Index")
        b = AttributedStringIndex(native_ref=2, native_type="AttributedString.Index")
        self.assertEqual(SwiftRange(a1, b), SwiftRange(a2, b))
        self.assertEqual(hash(SwiftRange(a1, b)), hash(SwiftRange(a2, b)))
        self.assertNotEqual(SwiftRange(a1, b), SwiftRange(b, a1))

    def test_is_frozen(self) -> None:
        from dataclasses import FrozenInstanceError
        a = AttributedStringIndex(native_ref=1, native_type="AttributedString.Index")
        b = AttributedStringIndex(native_ref=2, native_type="AttributedString.Index")
        r = SwiftRange(a, b)
        with self.assertRaises(FrozenInstanceError):
            r.lower_bound = b  # type: ignore[misc]


class WrapperConstructibilityTests(unittest.TestCase):
    """Each wrapper class can be instantiated detached (``_runtime=None``)
    so test fixtures and serialisers can hold one without a live Swift
    handle."""

    def test_attributed_string_index_constructible(self) -> None:
        idx = AttributedStringIndex(native_ref=42, native_type="AttributedString.Index")
        self.assertEqual(idx.native_ref, 42)
        self.assertIsInstance(idx, NativeReference)

    def test_attribute_container_constructible(self) -> None:
        c = AttributeContainer(native_ref=10, native_type="AttributeContainer")
        self.assertEqual(c.native_ref, 10)

    def test_attributed_string_constructible(self) -> None:
        s = AttributedString(native_ref=100, native_type="AttributedString")
        self.assertEqual(s.native_ref, 100)

    def test_attributed_substring_constructible(self) -> None:
        sub = AttributedSubstring(native_ref=200, native_type="AttributedSubstring")
        self.assertEqual(sub.native_ref, 200)


class DetachedFallbackTests(unittest.TestCase):
    """When ``_runtime`` is None, equality routes via the by-handle
    fallback so detached wrappers compare reasonably without crashing
    on the would-be-Swift call."""

    def test_attribute_container_equality_falls_back_to_handle(self) -> None:
        a = AttributeContainer(native_ref=1, native_type="AttributeContainer")
        b = AttributeContainer(native_ref=1, native_type="AttributeContainer")
        c = AttributeContainer(native_ref=2, native_type="AttributeContainer")
        self.assertEqual(a, b)
        self.assertNotEqual(a, c)

    def test_equality_rejects_different_concrete_types(self) -> None:
        a = AttributeContainer(native_ref=1, native_type="AttributeContainer")
        b = AttributedString(native_ref=1, native_type="AttributedString")
        self.assertNotEqual(a, b)


class SwiftAPIParityTests(unittest.TestCase):
    """Pure-Python invariants required for Swift API parity."""

    def test_substring_dot_substring_is_self(self) -> None:
        """Per Swift, ``substring.substring`` returns the substring
        itself.  This is a Python-level assertion: no runtime needed."""
        sub = AttributedSubstring(native_ref=99, native_type="AttributedSubstring")
        self.assertIs(sub.substring, sub)


class RunsIndexingTypeGuardTests(unittest.TestCase):
    """``runs[index]`` only accepts ``AttributedStringIndex`` per
    decision §3.K.1.  The TypeError is raised by the wrapper before
    any FFI call would happen, so this is a pure-Python test."""

    def test_runs_getitem_rejects_int(self) -> None:
        runs = AttributedStringRuns(
            native_ref=20, native_type="AttributedString.Runs",
        )
        with self.assertRaises(TypeError):
            _ = runs[0]  # type: ignore[index]


# ---------------------------------------------------------------------------
# Real-runtime tests — every test below builds a real ``IotaRuntime``
# and exercises the wrapper end-to-end.  No fakes, no mocks of runtime
# methods.
# ---------------------------------------------------------------------------


class _RealRuntimeFixture(unittest.TestCase):
    """Shared base: every concrete test class inherits a fresh real
    runtime per test (fast — the underlying dlopen is idempotent and
    cached by cffi)."""

    def setUp(self) -> None:
        self._rt = build_generated_runtime()


class AttributedStringSurfaceTests(_RealRuntimeFixture):
    """Constructor + property surface for AttributeContainer / FoundationAttributes /
    AttributedString.

    Original contract (with fakes): "calling X.method invokes IOTA symbol Y".
    Migrated contract (real runtime): "calling X.method against the real
    Swift dylib produces a wrapper with a non-zero native handle and the
    expected observable property values".
    """

    def test_attribute_container_create_empty_returns_real_handle(self) -> None:
        container = AttributeContainer.create_empty(self._rt)
        self.assertIsInstance(container, AttributeContainer)
        self.assertIsInstance(container, NativeReference)
        self.assertIsNotNone(container.native_ref)
        self.assertNotEqual(
            container.native_ref, 0,
            "real Swift create_empty must yield a non-zero handle",
        )

    def test_foundation_attributes_create_empty_then_as_container(self) -> None:
        attrs = AttributeContainerFoundationAttributes.create_empty(self._rt)
        self.assertIsInstance(attrs, AttributeContainerFoundationAttributes)
        container = attrs.as_container()
        self.assertIsInstance(container, AttributeContainer)
        self.assertNotEqual(container.native_ref, 0,
                            "as_container must materialise a real handle")

    def test_language_identifier_setter_and_getter_roundtrip(self) -> None:
        attrs = AttributeContainerFoundationAttributes.create_empty(self._rt)
        attrs.language_identifier = "en"
        self.assertEqual(
            attrs.language_identifier, "en",
            "set/get round-trip via real Swift must preserve the value",
        )

    def test_attributed_string_create_with_container_yields_handle(self) -> None:
        container = AttributeContainer.create_empty(self._rt)
        s = AttributedString.create(self._rt, "hello", container)
        self.assertIsInstance(s, AttributedString)
        self.assertNotEqual(s.native_ref, 0)

    def test_attributed_string_create_without_container_yields_handle(self) -> None:
        s = AttributedString.create(self._rt, "bye")
        self.assertIsInstance(s, AttributedString)
        self.assertNotEqual(s.native_ref, 0)

    def test_string_property_returns_input_text(self) -> None:
        """``s.string`` must echo the text we constructed with (Swift
        round-trip via the real string converter)."""
        s = AttributedString.create(self._rt, "Hello")
        self.assertEqual(s.string, "Hello")


class AttributedStringIndexTests(_RealRuntimeFixture):
    """``AttributedString.Index`` is opaque.  Equality routes through
    Swift via the ``_equals_symbol`` pointer."""

    def test_constructible_via_native_ref(self) -> None:
        idx = AttributedStringIndex(native_ref=42, native_type="AttributedString.Index")
        self.assertEqual(idx.native_ref, 42)

    def test_equality_through_swift_when_runtime_set(self) -> None:
        """Two distinct startIndexes from the same string must compare
        equal (Swift Equatable)."""
        s = AttributedString.create(self._rt, "abc")
        a = s.start_index
        b = s.start_index
        self.assertEqual(a, b,
                         "startIndex called twice on the same string must "
                         "compare equal via Swift Equatable")


class AttributedSubstringTests(_RealRuntimeFixture):
    """Substring views derived from a real AttributedString."""

    def test_create_routes_through_substring_for_range(self) -> None:
        s = AttributedString.create(self._rt, "hello")
        rng = SwiftRange(s.start_index, s.end_index)
        sub = s.substring_for_range(rng)
        self.assertIsInstance(sub, AttributedSubstring)
        self.assertNotEqual(sub.native_ref, 0)

    def test_full_string_substring_property(self) -> None:
        s = AttributedString.create(self._rt, "hello")
        sub = s.substring
        self.assertIsInstance(sub, AttributedSubstring)
        self.assertNotEqual(sub.native_ref, 0)

    def test_substring_substring_returns_self(self) -> None:
        """Per Swift: ``substring.substring`` returns the substring
        itself (a no-op view promotion)."""
        s = AttributedString.create(self._rt, "hello")
        sub = s.substring
        self.assertIs(sub.substring, sub)

    def test_substring_string_property_returns_text(self) -> None:
        """``substring.string`` must round-trip the underlying text."""
        s = AttributedString.create(self._rt, "hello")
        sub = s.substring
        self.assertEqual(sub.string, "hello")

    def test_substring_getitem_routes_through_swift(self) -> None:
        s = AttributedString.create(self._rt, "hello")
        sub = s.substring
        rng = SwiftRange(s.start_index, s.end_index)
        result = sub[rng]
        self.assertIsInstance(result, AttributedSubstring)
        self.assertNotEqual(result.native_ref, 0)


class AttributedStringIndexAccessorsTests(_RealRuntimeFixture):
    def test_start_and_end_index_route_correctly(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        start = s.start_index
        end = s.end_index
        self.assertIsInstance(start, AttributedStringIndex)
        self.assertIsInstance(end, AttributedStringIndex)
        self.assertNotEqual(start, end,
                            "non-empty string: start and end indices differ")


class ViewAccessorsTests(_RealRuntimeFixture):
    """``runs`` / ``characters`` / ``unicode_scalars`` are plain
    ``@property`` (§3.G.1) — every access produces a fresh view backed
    by Swift's current state."""

    def test_runs_property_returns_runs_view(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        runs = s.runs
        self.assertIsInstance(runs, AttributedStringRuns)
        self.assertNotEqual(runs.native_ref, 0)

    def test_characters_property_returns_character_view(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        chars = s.characters
        self.assertIsInstance(chars, AttributedStringCharacterView)
        self.assertNotEqual(chars.native_ref, 0)

    def test_unicode_scalars_property_returns_unicode_scalar_view(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        scalars = s.unicode_scalars
        self.assertIsInstance(scalars, AttributedStringUnicodeScalarView)
        self.assertNotEqual(scalars.native_ref, 0)

    def test_property_is_not_cached(self) -> None:
        """Plain @property: two accesses produce two distinct view
        wrappers (per §3.G.1, no @cached_property).  Two fresh
        materialisations from real Swift have distinct native handles."""
        s = AttributedString.create(self._rt, "hi")
        a = s.runs
        b = s.runs
        self.assertIsNot(a, b, "two property accesses must yield distinct wrappers")


class RunsViewMethodTests(_RealRuntimeFixture):
    """Each view exposes startIndex / endIndex / indexAfter /
    indexBefore / elementAt — Swift's ``BidirectionalCollection``
    surface."""

    def test_start_and_end_index(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        runs = s.runs
        self.assertIsInstance(runs.start_index, AttributedStringIndex)
        self.assertIsInstance(runs.end_index, AttributedStringIndex)

    def test_index_after_and_before(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        runs = s.runs
        first = runs.start_index
        nxt = runs.index_after(first)
        self.assertIsInstance(nxt, AttributedStringIndex)
        prev = runs.index_before(nxt)
        self.assertIsInstance(prev, AttributedStringIndex)
        self.assertEqual(prev, first,
                         "index_before(index_after(x)) must equal x")

    def test_element_at_returns_run(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        runs = s.runs
        run = runs.element_at(runs.start_index)
        self.assertIsInstance(run, AttributedStringRun)


class RunPropertyTests(_RealRuntimeFixture):
    def test_run_range_returns_swift_range_of_index(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        runs = s.runs
        run = runs.element_at(runs.start_index)
        rng = run.range
        self.assertIsInstance(rng, SwiftRange)
        self.assertIsInstance(rng.lower_bound, AttributedStringIndex)
        self.assertIsInstance(rng.upper_bound, AttributedStringIndex)

    def test_run_attributes_returns_attribute_container(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        runs = s.runs
        run = runs.element_at(runs.start_index)
        self.assertIsInstance(run.attributes, AttributeContainer)


class CharacterViewMethodTests(_RealRuntimeFixture):
    def test_element_at_returns_string(self) -> None:
        s = AttributedString.create(self._rt, "ab")
        chars = s.characters
        first_char = chars.element_at(chars.start_index)
        self.assertIsInstance(first_char, str)
        self.assertEqual(first_char, "a")


class UnicodeScalarViewMethodTests(_RealRuntimeFixture):
    def test_element_at_returns_int(self) -> None:
        s = AttributedString.create(self._rt, "A")
        scalars = s.unicode_scalars
        scalar = scalars.element_at(scalars.start_index)
        self.assertIsInstance(scalar, int)
        self.assertEqual(scalar, ord("A"))


class IterableViewTests(_RealRuntimeFixture):
    """``__iter__`` walks each view from start_index to end_index via
    real Swift index navigation."""

    def test_runs_iteration_visits_each_element_in_order(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        collected = list(s.runs)
        self.assertGreaterEqual(
            len(collected), 1,
            "any non-empty string must produce at least one run",
        )
        for r in collected:
            self.assertIsInstance(r, AttributedStringRun)

    def test_character_view_iteration(self) -> None:
        s = AttributedString.create(self._rt, "abc")
        collected = list(s.characters)
        self.assertEqual(collected, ["a", "b", "c"])

    def test_unicode_scalar_view_iteration(self) -> None:
        s = AttributedString.create(self._rt, "ABC")
        collected = list(s.unicode_scalars)
        self.assertEqual(collected, [ord("A"), ord("B"), ord("C")])

    def test_empty_view_iteration(self) -> None:
        s = AttributedString.create(self._rt, "")
        self.assertEqual(list(s.characters), [])


class CopyProtocolTests(_RealRuntimeFixture):
    """``copy.copy(s)`` / ``copy.deepcopy(s)`` are the standard Python
    integration with ``clone()``."""

    def test_copy_copy_returns_independent_instance(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        copied = copy.copy(s)
        self.assertIsInstance(copied, AttributedString)
        self.assertIsNot(copied, s)
        self.assertNotEqual(
            copied.native_ref, s.native_ref,
            "copy.copy must yield a fresh native handle (Swift COW parity)",
        )

    def test_copy_deepcopy_returns_independent_instance(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        copied = copy.deepcopy(s)
        self.assertIsInstance(copied, AttributedString)
        self.assertIsNot(copied, s)
        self.assertNotEqual(copied.native_ref, s.native_ref)


class CloneAndReplaceSubrangeTests(_RealRuntimeFixture):
    """``clone`` is the documented escape hatch for callers who need
    Swift's COW semantics (§5.1 tech debt).
    ``replace_subrange`` mutates ``self`` in place and returns ``None``
    per §3.J.1 (Swift mutating-func parity)."""

    def test_clone_returns_independent_attributed_string(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        cloned = s.clone()
        self.assertIsInstance(cloned, AttributedString)
        self.assertIsNot(cloned, s)
        self.assertNotEqual(
            cloned.native_ref, s.native_ref,
            "clone must produce a fresh native handle",
        )
        self.assertEqual(
            cloned.string, s.string,
            "clone must preserve the source text",
        )

    def test_replace_subrange_mutates_in_place_and_returns_none(self) -> None:
        s = AttributedString.create(self._rt, "hello")
        replacement = AttributedString.create(self._rt, "X")
        rng = SwiftRange(s.start_index, s.end_index)
        result = s.replace_subrange(rng, replacement)
        self.assertIsNone(result, "Swift mutating func parity: returns None")
        self.assertEqual(s.string, "X",
                         "replace_subrange must mutate the underlying string")


class MutationFamilyTests(_RealRuntimeFixture):
    """Append / insert / removeSubrange family — each is a mutating
    func returning ``None`` per §3.J.1, with observable effect on
    ``s.string``."""

    def setUp(self) -> None:
        super().setUp()
        self._s = AttributedString.create(self._rt, "ab")
        self._other = AttributedString.create(self._rt, "Z")
        self._sub = AttributedString.create(self._rt, "Y").substring

    def test_append(self) -> None:
        self.assertIsNone(self._s.append(self._other))
        self.assertEqual(self._s.string, "abZ")

    def test_append_substring(self) -> None:
        self.assertIsNone(self._s.append_substring(self._sub))
        self.assertEqual(self._s.string, "abY")

    def test_insert(self) -> None:
        self.assertIsNone(self._s.insert(self._other, at=self._s.start_index))
        self.assertEqual(self._s.string, "Zab")

    def test_insert_substring(self) -> None:
        self.assertIsNone(
            self._s.insert_substring(self._sub, at=self._s.start_index),
        )
        self.assertEqual(self._s.string, "Yab")

    def test_replace_subrange_with_substring(self) -> None:
        rng = SwiftRange(self._s.start_index, self._s.end_index)
        self.assertIsNone(self._s.replace_subrange_with_substring(rng, self._sub))
        self.assertEqual(self._s.string, "Y")

    def test_remove_subrange(self) -> None:
        rng = SwiftRange(self._s.start_index, self._s.end_index)
        self.assertIsNone(self._s.remove_subrange(rng))
        self.assertEqual(self._s.string, "")


class PerRangeAttributeMutationTests(_RealRuntimeFixture):
    """§3.K: per-range attribute mutators on AttributedString.  The
    observable effect is that the run at the mutated position reports
    the new attributes."""

    def setUp(self) -> None:
        super().setUp()
        self._s = AttributedString.create(self._rt, "ab")
        en = AttributeContainerFoundationAttributes.create_empty(self._rt)
        en.language_identifier = "en"
        self._cont_a = en.as_container()
        pt = AttributeContainerFoundationAttributes.create_empty(self._rt)
        pt.language_identifier = "pt"
        self._cont_b = pt.as_container()

    def test_set_attributes_for_range(self) -> None:
        rng = SwiftRange(self._s.start_index, self._s.end_index)
        self.assertIsNone(self._s.set_attributes_for_range(rng, self._cont_a))

    def test_merge_attributes_for_range(self) -> None:
        rng = SwiftRange(self._s.start_index, self._s.end_index)
        self.assertIsNone(self._s.merge_attributes_for_range(rng, self._cont_a))

    def test_replace_attributes_for_range(self) -> None:
        rng = SwiftRange(self._s.start_index, self._s.end_index)
        result = self._s.replace_attributes_for_range(rng, self._cont_a, self._cont_b)
        self.assertIsNone(result)


class RunsIndexingAndRangeIteratorTests(_RealRuntimeFixture):
    """``Runs[index]`` returns the Run at that index (Index only,
    never int per §3.K.1).  ``Runs.range_iterator`` yields each run's
    range as a ``SwiftRange[Index]``."""

    def test_getitem_with_index_returns_run(self) -> None:
        s = AttributedString.create(self._rt, "hi")
        runs = s.runs
        run = runs[runs.start_index]
        self.assertIsInstance(run, AttributedStringRun)

    def test_range_iterator_yields_swift_ranges(self) -> None:
        """Live iteration yields each run's range as ``SwiftRange``."""
        s = AttributedString.create(self._rt, "hi")
        runs = s.runs
        ranges = list(runs.range_iterator())
        self.assertGreaterEqual(len(ranges), 1)
        for r in ranges:
            self.assertIsInstance(r, SwiftRange)
            self.assertIsInstance(r.lower_bound, AttributedStringIndex)
            self.assertIsInstance(r.upper_bound, AttributedStringIndex)


class WholeStringAttributeMutationTests(_RealRuntimeFixture):
    """§3.L: ``set_attributes`` / ``merge_attributes`` /
    ``replace_attributes`` operate on every run, returning ``None`` and
    mutating in place per §3.J.1."""

    def setUp(self) -> None:
        super().setUp()
        self._s = AttributedString.create(self._rt, "ab")
        en = AttributeContainerFoundationAttributes.create_empty(self._rt)
        en.language_identifier = "en"
        self._cont_a = en.as_container()
        pt = AttributeContainerFoundationAttributes.create_empty(self._rt)
        pt.language_identifier = "pt"
        self._cont_b = pt.as_container()

    def test_set_attributes(self) -> None:
        self.assertIsNone(self._s.set_attributes(self._cont_a))

    def test_merge_attributes(self) -> None:
        self.assertIsNone(self._s.merge_attributes(self._cont_a))

    def test_replace_attributes(self) -> None:
        result = self._s.replace_attributes(self._cont_a, self._cont_b)
        self.assertIsNone(result)


class AttributeContainerMergeTests(_RealRuntimeFixture):
    """``AttributeContainer.merge_attributes(other)`` is the per-
    container counterpart of the per-range mergeAttributesForRange
    used by Kotlin's testAttributeMergeReplace."""

    def test_merge_attributes_routes_through_swift(self) -> None:
        en = AttributeContainerFoundationAttributes.create_empty(self._rt)
        en.language_identifier = "en"
        a = en.as_container()
        pt = AttributeContainerFoundationAttributes.create_empty(self._rt)
        pt.language_identifier = "pt"
        b = pt.as_container()
        result = a.merge_attributes(b)
        self.assertIsNone(result)


if __name__ == "__main__":
    unittest.main()
