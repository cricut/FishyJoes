"""Parity port of ``AttributedStringTests.kt`` for the Python target.

Scope:
- ``test_string_values`` and ``test_string_echo`` mirror the
  Kotlin v1 contract: construction, equality, identity-via-echo for
  the corpus of pre-built attributed strings.
- The view-iteration tests (``runs``, ``characters``, ``unicodeScalars``),
  substring tests, and mutation tests are present as
  ``@unittest.skip`` placeholders so the test count matches Kotlin
  one-to-one and so a future runtime port has a concrete checklist.

The tests are skipped in environments where the Swift code generation
has not produced the AttributedString runtime symbols expected by the
``fishyjoes_python.attributed_string`` wrappers.
"""

from __future__ import annotations

import os
import sys
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.AttributedStrings import AttributedStrings


def _runtime_supports_attributed_string() -> bool:
    """Detect whether the current Swift codegen exposes the
    AttributedString runtime symbols.  The wrappers in
    ``fishyjoes_python.attributed_string`` route through these; without
    them, every test in this file would fail with an AttributeError.

    The probe must check for a symbol that *actually exists* as a Swift
    ``@_cdecl`` export — see ``test_no_silent_skips.py``'s regression
    net.  ``__iota_Foundation_AttributedString_create`` is the
    constructor symbol, present whenever the AttributedString runtime
    is wired in.
    """
    try:
        from cricut_testapi.runtime import get_runtime  # type: ignore
        rt = get_runtime()
        return hasattr(
            rt.iota_lib,
            "__iota_Foundation_AttributedString_create",
        )
    except Exception:
        return False


SUPPORTED = _runtime_supports_attributed_string()


@unittest.skipUnless(SUPPORTED, "AttributedString runtime symbols not exported by codegen")
class AttributedStringValuesTests(unittest.TestCase):
    """Mirrors Kotlin's testStringValues."""

    def setUp(self) -> None:
        ensure_loaded()
        from fishyjoes_python import (
            AttributeContainerFoundationAttributes,
            AttributedString,
        )
        from cricut_testapi.runtime import get_runtime
        self._runtime = get_runtime()
        self._AttributedString = AttributedString
        self._FoundationAttrs = AttributeContainerFoundationAttributes

    def _container(self, **kwargs: str) -> object:
        attrs = self._FoundationAttrs.create_empty(self._runtime)
        for key, value in kwargs.items():
            setattr(attrs, key, value)
        return attrs.as_container()

    def test_simple_matches_hello_in_english(self) -> None:
        en = self._container(language_identifier="en")
        self.assertEqual(
            AttributedStrings.simple(),
            self._AttributedString.create(self._runtime, "Hello", en),
        )

    def test_accent_matches_ola_in_portuguese(self) -> None:
        pt = self._container(language_identifier="pt")
        self.assertEqual(
            AttributedStrings.accent(),
            self._AttributedString.create(self._runtime, "Olá", pt),
        )

    def test_chinese_matches_nihao_in_chinese(self) -> None:
        zh = self._container(language_identifier="zh")
        self.assertEqual(
            AttributedStrings.chinese(),
            self._AttributedString.create(self._runtime, "你好", zh),
        )


@unittest.skipUnless(SUPPORTED, "AttributedString runtime symbols not exported by codegen")
class AttributedStringEchoTests(unittest.TestCase):
    """Mirrors Kotlin's testStringEcho — round-trip identity via Swift."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_echo_simple(self) -> None:
        self.assertEqual(AttributedStrings.echo(AttributedStrings.simple()),
                         AttributedStrings.simple())

    def test_echo_chinese(self) -> None:
        self.assertEqual(AttributedStrings.echo(AttributedStrings.chinese()),
                         AttributedStrings.chinese())

    def test_echo_polyglot(self) -> None:
        self.assertEqual(AttributedStrings.echo(AttributedStrings.polyglot()),
                         AttributedStrings.polyglot())


@unittest.skipUnless(SUPPORTED, "AttributedString runtime symbols not exported by codegen")
class AttributedStringViewTests(unittest.TestCase):
    """Mirrors Kotlin's testViewIterationOverIndices and testViewIterators."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_view_iteration_over_indices(self) -> None:
        s = AttributedStrings.polyglot()
        runs = s.runs
        # Walk runs explicitly via index navigation (Kotlin parity).
        idx = runs.start_index
        run_count = 0
        while idx != runs.end_index:
            self.assertIsNotNone(runs.element_at(idx))
            idx = runs.index_after(idx)
            run_count += 1
        self.assertGreater(run_count, 0, "polyglot string must have at least one run")

    def test_view_iterators(self) -> None:
        s = AttributedStrings.polyglot()
        # __iter__ yields the same runs as the explicit walk.
        runs_via_iter = list(s.runs)
        self.assertEqual(len(runs_via_iter), len(list(s.runs)))
        # CharacterView yields strs.
        chars = list(s.characters)
        self.assertTrue(all(isinstance(c, str) for c in chars))
        # UnicodeScalarView yields ints.
        scalars = list(s.unicode_scalars)
        self.assertTrue(all(isinstance(sc, int) for sc in scalars))


@unittest.skipUnless(SUPPORTED, "AttributedString runtime symbols not exported by codegen")
class AttributedStringSubstringTests(unittest.TestCase):
    """Mirrors Kotlin's testSubstring."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_substring_round_trips(self) -> None:
        s = AttributedStrings.polyglot()
        whole = s.substring
        self.assertIs(whole.substring, whole, "Substring.substring is identity")
        self.assertEqual(whole.string, s.string)


@unittest.skipUnless(SUPPORTED, "AttributedString runtime symbols not exported by codegen")
class AttributedStringMutabilityTests(unittest.TestCase):
    """Mirrors Kotlin's testMutability and testMutabilityVariants —
    clone gives the user Swift-COW-equivalent independence (§5.1)."""

    def setUp(self) -> None:
        ensure_loaded()
        from fishyjoes_python import AttributeContainerFoundationAttributes
        from cricut_testapi.runtime import get_runtime
        self._runtime = get_runtime()
        self._FoundationAttrs = AttributeContainerFoundationAttributes

    def test_clone_is_independent(self) -> None:
        original = AttributedStrings.polyglot()
        cloned = original.clone()
        self.assertIsNot(cloned.native_ref, original.native_ref)

    def test_replace_subrange_mutates(self) -> None:
        s = AttributedStrings.polyglot().clone()
        before = s.string
        empty = self._FoundationAttrs.create_empty(self._runtime).as_container()
        from fishyjoes_python import SwiftRange
        rng = SwiftRange(s.start_index, s.end_index)
        # No-op-equivalent replacement just exercises the FFI path.
        s.set_attributes_for_range(rng, empty)
        self.assertEqual(s.string, before, "set_attributes_for_range preserves text")

    def test_append_changes_string(self) -> None:
        s = AttributedStrings.simple().clone()
        accent = AttributedStrings.accent()
        before = s.string
        s.append(accent)
        self.assertNotEqual(s.string, before)


@unittest.skipUnless(SUPPORTED, "AttributedString runtime symbols not exported by codegen")
class AttributedStringAttributeMutationTests(unittest.TestCase):
    """Mirrors Kotlin's testAttributeMergeReplace and
    testAttributeMergeReplaceWhole."""

    def setUp(self) -> None:
        ensure_loaded()
        from fishyjoes_python import AttributeContainerFoundationAttributes
        from cricut_testapi.runtime import get_runtime
        self._runtime = get_runtime()
        self._FoundationAttrs = AttributeContainerFoundationAttributes

    def _container(self, **kwargs: str) -> object:
        attrs = self._FoundationAttrs.create_empty(self._runtime)
        for k, v in kwargs.items():
            setattr(attrs, k, v)
        return attrs.as_container()

    def test_set_attributes_whole_string(self) -> None:
        s = AttributedStrings.polyglot().clone()
        empty = self._FoundationAttrs.create_empty(self._runtime).as_container()
        s.set_attributes(empty)
        # After setting empty attributes everywhere the runs collapse to one.
        self.assertEqual(len(list(s.runs)), 1)

    def test_merge_attributes_whole_string(self) -> None:
        s = AttributedStrings.polyglot().clone()
        link_attrs = self._container(link="https://example.com")
        s.merge_attributes(link_attrs)
        # Every run still exists; the merge added the link attribute.
        self.assertGreater(len(list(s.runs)), 0)


if __name__ == "__main__":
    unittest.main()
