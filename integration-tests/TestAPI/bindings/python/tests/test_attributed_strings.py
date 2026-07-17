import importlib
import unittest


class AttributedStringTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_static_values_and_echo(self) -> None:
        attributed_strings = self.testapi.AttributedStrings

        self.assertEqual(attributed_strings.simple.string, "Hello")
        self.assertEqual(attributed_strings.accent.string, "Olá")
        self.assertEqual(attributed_strings.script.string, "こんにちは")
        self.assertEqual(attributed_strings.chinese.string, "你好")
        self.assertEqual(attributed_strings.chinese_bmp.string, "豈更車賈滑")
        self.assertEqual(attributed_strings.chinese_sip.string, "\U00020001\U00020002\U00020003\U00020004")
        self.assertEqual(attributed_strings.emoji.string, "🤯🐶🍓")
        self.assertEqual(attributed_strings.emoji_multi.string, "👨‍👩‍👧‍👦👍🏿🇺🇸")
        self.assertEqual(attributed_strings.polyglot.string, "Hello Olá こんにちは")

        self.assertEqual(attributed_strings.echo(attributed_strings.simple), attributed_strings.simple)
        self.assertEqual(attributed_strings.echo(attributed_strings.accent), attributed_strings.accent)
        self.assertEqual(attributed_strings.echo(attributed_strings.emoji_multi), attributed_strings.emoji_multi)
        self.assertNotEqual(attributed_strings.accent, attributed_strings.simple)

    def test_construct_attributed_string_from_python_string(self) -> None:
        # The shared-runtime AttributedString had no Python constructor, so a str
        # could not be turned into an AttributedString and the entire shaping tier
        # (Font.shape_attributed_string, TextSegmentation, …) was unreachable. The
        # runtime class must expose a constructor wired to the native create symbol.
        attributed_string_type = self.testapi._native.Runtime_AttributedString
        attributed_strings = self.testapi.AttributedStrings

        constructed = attributed_string_type("Hello")
        self.assertEqual(constructed.string, "Hello")
        self.assertEqual(attributed_string_type("你好").string, "你好")
        self.assertEqual(attributed_string_type("🤯🐶🍓").string, "🤯🐶🍓")

        # The constructed value round-trips through a Swift API that takes an
        # AttributedString parameter (proves it marshals in, not just out).
        self.assertEqual(attributed_strings.echo(constructed), constructed)
        # No attributes by default, so it must NOT equal a Swift-built value that
        # carries a languageIdentifier attribute, even with identical text.
        self.assertEqual(attributed_strings.simple.string, "Hello")
        self.assertNotEqual(constructed, attributed_strings.simple)

    def test_substrings_and_attribute_containers(self) -> None:
        attributed_strings = self.testapi.AttributedStrings

        substrings = attributed_strings.attributed_characters(attributed_strings.accent)
        self.assertEqual([substring.string for substring in substrings], ["O", "l", "á"])
        self.assertEqual(substrings[0].base, attributed_strings.accent)
        self.assertEqual(substrings[2].substring, substrings[2])

        accent_attributes = attributed_strings.attributes_preferring_duplicates_nearer_start(
            attributed_strings.accent
        )
        self.assertEqual(accent_attributes.foundation.language_identifier, "pt")
        self.assertIsNone(accent_attributes.foundation.link)

        emoji_attributes = attributed_strings.attributes_preferring_duplicates_nearer_start(
            attributed_strings.emoji
        )
        self.assertEqual(emoji_attributes.foundation.link, "https://home.unicode.org/emoji")
        self.assertIsNone(emoji_attributes.foundation.language_identifier)


class AttributedStringRichSurfaceTests(unittest.TestCase):
    """Exercises the full typed surface the Python runtime now mirrors from the
    Dart/Kotlin runtimes: views as iterables, index navigation, substringForRange,
    runs, append/insert round-trips, and Comparable indices. All real dylibs."""

    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")
        self.attributed_strings = self.testapi.AttributedStrings
        self.AttributedString = self.testapi._native.Runtime_AttributedString

    def test_character_view_is_iterable_and_navigable(self) -> None:
        value = self.AttributedString("Olá")
        characters = value.characters

        # Iterable[str] yields one grapheme per element, in order.
        self.assertEqual(list(characters), ["O", "l", "á"])
        # Re-iterating yields a fresh, equivalent sequence (views are stateless).
        self.assertEqual(list(characters), ["O", "l", "á"])

        start = characters.start_index
        end = characters.end_index
        self.assertEqual(value.start_index, start)
        self.assertEqual(value.end_index, end)

        # [] is the sole element accessor.
        self.assertEqual(characters[start], "O")

        # Forward/backward index navigation round-trips.
        second = characters.index_after(start)
        self.assertEqual(characters[second], "l")
        self.assertEqual(characters.index_before(second), start)

    def test_unicode_scalar_view_yields_code_points(self) -> None:
        value = self.AttributedString("Aé")
        scalars = value.unicode_scalars

        self.assertEqual(list(scalars), [ord("A"), ord("é")])
        start = scalars.start_index
        self.assertEqual(scalars[start], ord("A"))
        self.assertEqual(scalars[scalars.index_after(start)], ord("é"))

    def test_runs_iterate_with_attributes_and_range(self) -> None:
        # accent carries a single languageIdentifier run over the whole string.
        accent = self.attributed_strings.accent
        runs = accent.runs

        run_list = list(runs)
        self.assertEqual(len(run_list), 1)
        run = run_list[0]
        self.assertEqual(run.attributes.foundation.language_identifier, "pt")

        # The run's range spans the whole string and round-trips to its substring.
        self.assertEqual(run.range.lower_bound, accent.start_index)
        self.assertEqual(run.range.upper_bound, accent.end_index)
        self.assertEqual(accent[run.range].string, "Olá")

        # The [] operator (indexed by a runs index or an attributed-string
        # position) agrees with iteration.
        self.assertEqual(runs[runs.start_index], run)
        self.assertEqual(runs[accent.start_index], run)

    def test_getitem_slices_by_range(self) -> None:
        value = self.attributed_strings.polyglot  # "Hello Olá こんにちは"
        characters = value.characters
        indices = [characters.start_index]
        cursor = characters.start_index
        while cursor != characters.end_index:
            cursor = characters.index_after(cursor)
            indices.append(cursor)

        first_five = self.testapi.SwiftRange(indices[0], indices[5])
        # __getitem__ (obj[range]) is the sole public range accessor, bridging
        # Swift's subscript(range:).
        self.assertEqual(value[first_five].string, "Hello")

        # full_range comes from a Swift API and must drive the same slice path.
        full = self.attributed_strings.full_range(value)
        self.assertEqual(value[full].string, value.string)

    def test_append_and_insert_round_trips(self) -> None:
        # append mutates in place and concatenates text + attributes.
        target = self.AttributedString("Hello")
        target.append(self.AttributedString(" World"))
        self.assertEqual(target.string, "Hello World")

        # appendSubstring appends from an AttributedSubstring.
        donor = self.AttributedString("!!!")
        target.append_substring(donor.substring)
        self.assertEqual(target.string, "Hello World!!!")

        # insert places content at an index; startIndex inserts before all.
        greeting = self.AttributedString("World")
        greeting.insert(self.AttributedString("Hello "), greeting.start_index)
        self.assertEqual(greeting.string, "Hello World")

        # insertSubstring inserts substring content at an index (here endIndex).
        suffix = self.AttributedString("!")
        greeting.insert_substring(suffix.substring, greeting.end_index)
        self.assertEqual(greeting.string, "Hello World!")

    def test_substring_rich_surface(self) -> None:
        value = self.attributed_strings.accent
        substring = value.substring

        self.assertEqual(substring.string, "Olá")
        self.assertEqual(substring.base, value)
        self.assertEqual(list(substring.characters), ["O", "l", "á"])
        self.assertEqual(list(substring.unicode_scalars), [ord("O"), ord("l"), ord("á")])
        self.assertEqual(substring.start_index, value.start_index)
        self.assertEqual(substring.end_index, value.end_index)

        run = list(substring.runs)[0]
        self.assertEqual(run.attributes.foundation.language_identifier, "pt")

        full = self.testapi.SwiftRange(substring.start_index, substring.end_index)
        self.assertEqual(substring[full].string, "Olá")

    def test_indices_are_comparable(self) -> None:
        value = self.attributed_strings.polyglot
        first = self.attributed_strings.first_index(value)
        last = self.attributed_strings.last_index(value)

        self.assertTrue(first < last)
        self.assertTrue(last > first)
        self.assertTrue(first <= first)
        self.assertTrue(last >= last)
        self.assertEqual(first, value.start_index)
        self.assertNotEqual(first, last)
        self.assertEqual(hash(first), hash(value.start_index))

        # Runs indices are likewise Comparable.
        runs = value.runs
        self.assertTrue(runs.start_index <= runs.end_index)
        self.assertEqual(runs.start_index, runs.start_index)

    def test_empty_attribute_runs_from_swift(self) -> None:
        # A Swift API returns [AttributedString.Runs.Run]; iterating each run's
        # attributes must work end-to-end through the typed Run surface.
        plain = self.AttributedString("plain")
        empty_runs = self.attributed_strings.empty_attribute_runs(plain)
        self.assertEqual(len(empty_runs), 1)
        self.assertEqual(empty_runs[0].attributes, empty_runs[0].attributes)


class AttributedStringParitySurfaceTests(unittest.TestCase):
    """Exercises the full parity surface now mirrored Pythonically: the
    value-edit mutators (replace/remove subrange, set/merge/replace attributes),
    the Pythonic constructors that bridge Swift's inits (AttributedString() /
    AttributedString(substring), AttributedSubstring()), the `+`/`[]=`/copy
    idioms, and the AttributeContainer factory. All observed against real dylibs
    via .string/.attributes."""

    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")
        self.attributed_strings = self.testapi.AttributedStrings
        self.AttributedString = self.testapi._native.Runtime_AttributedString
        self.AttributedSubstring = self.testapi._native.Runtime_AttributedSubstring
        self.AttributeContainer = self.testapi._native.Runtime_AttributeContainer
        self.FoundationAttributes = (
            self.testapi._native.Runtime_AttributeContainer_FoundationAttributes
        )
        self.SwiftRange = self.testapi.SwiftRange

    def _full_range(self, value):
        return self.SwiftRange(value.start_index, value.end_index)

    def _language(self, value):
        # The single (or first) run's languageIdentifier attribute, or None.
        runs = list(value.runs)
        if not runs:
            return None
        return runs[0].attributes.foundation.language_identifier

    def test_construct_empty_and_from_substring(self) -> None:
        # AttributedString() reaches Swift's init() -> empty value.
        empty = self.AttributedString()
        self.assertEqual(empty.string, "")

        # AttributedString(substring) reaches Swift's init(_ substring:), which
        # materialises a substring's text + attributes into a standalone
        # AttributedString. accent carries a 'pt' run over "Olá".
        accent = self.attributed_strings.accent
        materialised = self.AttributedString(accent.substring)
        self.assertEqual(materialised.string, "Olá")
        self.assertEqual(materialised, accent)
        self.assertEqual(self._language(materialised), "pt")

        # Passing attributes alongside a substring is rejected (the substring
        # already carries its attributes).
        with self.assertRaises(TypeError):
            en_container = list(self.attributed_strings.simple.runs)[0].attributes
            self.AttributedString(accent.substring, en_container)

    def test_copy_is_an_independent_value(self) -> None:
        original = self.AttributedString("Hello")
        clone = original.copy()
        self.assertEqual(clone.string, "Hello")
        self.assertEqual(clone, original)

        # Mutating the clone must not affect the original (value semantics).
        clone.append(self.AttributedString(" World"))
        self.assertEqual(clone.string, "Hello World")
        self.assertEqual(original.string, "Hello")

        # copy.copy() routes through __copy__ and is likewise independent.
        import copy as _copy

        dunder_clone = _copy.copy(original)
        dunder_clone.append(self.AttributedString("!"))
        self.assertEqual(dunder_clone.string, "Hello!")
        self.assertEqual(original.string, "Hello")

    def test_add_concatenates_into_a_new_value(self) -> None:
        left = self.AttributedString("Hello")

        # + an AttributedString.
        combined = left + self.AttributedString(" World")
        self.assertEqual(combined.string, "Hello World")
        # left is unchanged (operator returns a fresh value).
        self.assertEqual(left.string, "Hello")

        # + an AttributedSubstring.
        donor = self.AttributedString("!!!")
        with_substring = left + donor.substring
        self.assertEqual(with_substring.string, "Hello!!!")

        # + a plain str (promoted to an AttributedString).
        with_str = left + " there"
        self.assertEqual(with_str.string, "Hello there")

        # Unsupported operands return NotImplemented -> TypeError.
        with self.assertRaises(TypeError):
            left + 123

    def test_replace_and_remove_subrange(self) -> None:
        value = self.AttributedString("Hello World")
        characters = value.characters
        # Indices for the slice covering "World" (positions 6..11).
        indices = [characters.start_index]
        cursor = characters.start_index
        while cursor != characters.end_index:
            cursor = characters.index_after(cursor)
            indices.append(cursor)
        world = self.SwiftRange(indices[6], indices[11])

        value.replace_subrange(world, self.AttributedString("there"))
        self.assertEqual(value.string, "Hello there")

        # __setitem__ with a str replaces a slice in place.
        value2 = self.AttributedString("Hello World")
        chars2 = value2.characters
        idx2 = [chars2.start_index]
        cur = chars2.start_index
        while cur != chars2.end_index:
            cur = chars2.index_after(cur)
            idx2.append(cur)
        value2[self.SwiftRange(idx2[6], idx2[11])] = "Folks"
        self.assertEqual(value2.string, "Hello Folks")

        # __setitem__ with an AttributedSubstring.
        value3 = self.AttributedString("Hello World")
        chars3 = value3.characters
        idx3 = [chars3.start_index]
        cur = chars3.start_index
        while cur != chars3.end_index:
            cur = chars3.index_after(cur)
            idx3.append(cur)
        donor = self.AttributedString("Everyone")
        value3[self.SwiftRange(idx3[6], idx3[11])] = donor.substring
        self.assertEqual(value3.string, "Hello Everyone")

        # replace_subrange_with_substring directly.
        value4 = self.AttributedString("Hello World")
        chars4 = value4.characters
        idx4 = [chars4.start_index]
        cur = chars4.start_index
        while cur != chars4.end_index:
            cur = chars4.index_after(cur)
            idx4.append(cur)
        value4.replace_subrange_with_substring(
            self.SwiftRange(idx4[6], idx4[11]), self.AttributedString("All").substring
        )
        self.assertEqual(value4.string, "Hello All")

        # remove_subrange drops the slice (and its trailing space).
        value5 = self.AttributedString("Hello World")
        chars5 = value5.characters
        idx5 = [chars5.start_index]
        cur = chars5.start_index
        while cur != chars5.end_index:
            cur = chars5.index_after(cur)
            idx5.append(cur)
        value5.remove_subrange(self.SwiftRange(idx5[5], idx5[11]))
        self.assertEqual(value5.string, "Hello")

    def test_set_and_merge_and_replace_attributes(self) -> None:
        # Borrow real containers from Swift-built fixtures: pt over "Olá",
        # en over "Hello".
        pt_container = list(self.attributed_strings.accent.runs)[0].attributes
        en_container = list(self.attributed_strings.simple.runs)[0].attributes
        self.assertEqual(pt_container.foundation.language_identifier, "pt")
        self.assertEqual(en_container.foundation.language_identifier, "en")

        # set_attributes replaces all attributes over the whole string.
        target = self.AttributedString("plain")
        self.assertIsNone(self._language(target))
        target.set_attributes(pt_container)
        self.assertEqual(self._language(target), "pt")

        # set_attributes_for_range applies to a slice; observe via the run there.
        ranged = self.AttributedString("plain")
        ranged.set_attributes_for_range(self._full_range(ranged), en_container)
        self.assertEqual(self._language(ranged), "en")

        # merge_attributes (default keep_current=False) lets the new value win.
        merged = self.AttributedString("plain")
        merged.set_attributes(pt_container)
        merged.merge_attributes(en_container)
        self.assertEqual(self._language(merged), "en")

        # merge_attributes(keep_current=True) retains the existing value.
        kept = self.AttributedString("plain")
        kept.set_attributes(pt_container)
        kept.merge_attributes(en_container, keep_current=True)
        self.assertEqual(self._language(kept), "pt")

        # merge_attributes_for_range over the full range, new value wins.
        ranged_merge = self.AttributedString("plain")
        ranged_merge.set_attributes(pt_container)
        ranged_merge.merge_attributes_for_range(self._full_range(ranged_merge), en_container)
        self.assertEqual(self._language(ranged_merge), "en")

        # replace_attributes swaps an exact existing container for another.
        replaced = self.AttributedString("plain")
        replaced.set_attributes(pt_container)
        replaced.replace_attributes(pt_container, en_container)
        self.assertEqual(self._language(replaced), "en")

        # replace_attributes_for_range over the full range.
        ranged_replace = self.AttributedString("plain")
        ranged_replace.set_attributes(pt_container)
        ranged_replace.replace_attributes_for_range(
            self._full_range(ranged_replace), pt_container, en_container
        )
        self.assertEqual(self._language(ranged_replace), "en")

        # keep_current rejects non-bool flags (parity with the Bool marshaller).
        with self.assertRaises(ValueError):
            self.AttributedString("plain").merge_attributes(en_container, keep_current=1)

    def test_attribute_container_merge_and_create_empty(self) -> None:
        empty = self.AttributeContainer()
        self.assertIsNone(empty.foundation.language_identifier)
        self.assertIsNone(empty.foundation.link)

        pt_container = list(self.attributed_strings.accent.runs)[0].attributes
        en_container = list(self.attributed_strings.simple.runs)[0].attributes

        # merge mutates in place; default keep_current=False -> other wins.
        merged = self.AttributeContainer()
        merged.merge(pt_container)
        self.assertEqual(merged.foundation.language_identifier, "pt")
        merged.merge(en_container)
        self.assertEqual(merged.foundation.language_identifier, "en")

        # keep_current=True retains the current value on conflict.
        kept = self.AttributeContainer()
        kept.merge(pt_container)
        kept.merge(en_container, keep_current=True)
        self.assertEqual(kept.foundation.language_identifier, "pt")

    def test_foundation_attributes_typed_surface(self) -> None:
        # The typed FoundationAttributes view: link / language_identifier (both
        # str | None) and as_container round-tripping back to an AttributeContainer.
        link_container = list(self.attributed_strings.emoji.runs)[0].attributes
        foundation = link_container.foundation
        self.assertEqual(foundation.link, "https://home.unicode.org/emoji")
        self.assertIsNone(foundation.language_identifier)

        round_tripped = foundation.as_container()
        self.assertEqual(round_tripped, link_container)
        self.assertEqual(round_tripped.foundation.link, "https://home.unicode.org/emoji")

    def test_foundation_attributes_mutable_surface(self) -> None:
        # Build attributes from scratch: an empty FoundationAttributes (Swift's
        # init()) starts with no fields set, then the link / language_identifier
        # setters (Swift's `var link: URL?` / `var languageIdentifier: String?`)
        # populate them. Proves the mutable surface end to end against real dylibs.
        attributes = self.FoundationAttributes()
        self.assertIsNone(attributes.link)
        self.assertIsNone(attributes.language_identifier)

        attributes.link = "https://example.com/built"
        attributes.language_identifier = "fr"
        # Read back through the getters on the same value.
        self.assertEqual(attributes.link, "https://example.com/built")
        self.assertEqual(attributes.language_identifier, "fr")

        # Round-trip through as_container() and apply to a real AttributedString:
        # the built attributes must survive marshalling into a container and back.
        built_container = attributes.as_container()
        self.assertEqual(built_container.foundation.link, "https://example.com/built")
        self.assertEqual(built_container.foundation.language_identifier, "fr")

        target = self.AttributedString("hello")
        target.set_attributes(built_container)
        applied = list(target.runs)[0].attributes.foundation
        self.assertEqual(applied.link, "https://example.com/built")
        self.assertEqual(applied.language_identifier, "fr")

        # Setting a field back to None clears it (the URL?/String? optionals).
        attributes.link = None
        self.assertIsNone(attributes.link)
        self.assertEqual(attributes.language_identifier, "fr")
        self.assertIsNone(attributes.as_container().foundation.link)

    def test_attributed_substring_construct_empty(self) -> None:
        # AttributedSubstring() reaches Swift's only exported init() -> a substring
        # over an empty base AttributedString.
        empty = self.AttributedSubstring()
        self.assertEqual(empty.string, "")


class AttributedStringNamedFactoryExportTests(unittest.TestCase):
    """The Swift `FishyJoes.export(<name>)`-annotated factory members
    (createEmpty / create / createFromSubstring / createFromContainer) must each
    be exposed as a PUBLIC named Python member, not just folded into the Pythonic
    constructor/property. These tests call each public factory directly and assert
    it behaves identically to its Pythonic alias (`__init__` / property / copy),
    all against the real dylibs."""

    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")
        self.attributed_strings = self.testapi.AttributedStrings
        self.AttributedString = self.testapi._native.Runtime_AttributedString
        self.AttributedSubstring = self.testapi._native.Runtime_AttributedSubstring
        self.AttributeContainer = self.testapi._native.Runtime_AttributeContainer
        self.FoundationAttributes = (
            self.testapi._native.Runtime_AttributeContainer_FoundationAttributes
        )

    def _language(self, value):
        runs = list(value.runs)
        if not runs:
            return None
        return runs[0].attributes.foundation.language_identifier

    def test_attributed_string_create_empty_named_export(self) -> None:
        # createEmpty is a public classmethod returning a new AttributedString and
        # behaves like the empty-construct alias AttributedString().
        created = self.AttributedString.create_empty()
        self.assertIsInstance(created, self.AttributedString)
        self.assertEqual(created.string, "")
        self.assertEqual(created, self.AttributedString())

    def test_attributed_string_create_named_export(self) -> None:
        # create(value, attributes=None) is a public classmethod and behaves like
        # AttributedString(value, attributes).
        created = self.AttributedString.create("Hello")
        self.assertIsInstance(created, self.AttributedString)
        self.assertEqual(created.string, "Hello")
        self.assertEqual(created, self.AttributedString("Hello"))
        # Round-trips through a Swift API that takes an AttributedString parameter.
        self.assertEqual(self.attributed_strings.echo(created), created)

        # The optional attributes argument flows through (pt over the text).
        pt_container = list(self.attributed_strings.accent.runs)[0].attributes
        with_attrs = self.AttributedString.create("Olá", pt_container)
        self.assertEqual(with_attrs.string, "Olá")
        self.assertEqual(self._language(with_attrs), "pt")

    def test_attributed_string_create_from_substring_named_export(self) -> None:
        # createFromSubstring(substring) is a public classmethod and behaves like
        # AttributedString(substring) and the copy()/__copy__ path.
        accent = self.attributed_strings.accent
        materialised = self.AttributedString.create_from_substring(accent.substring)
        self.assertIsInstance(materialised, self.AttributedString)
        self.assertEqual(materialised.string, "Olá")
        self.assertEqual(materialised, accent)
        self.assertEqual(materialised, self.AttributedString(accent.substring))
        self.assertEqual(self._language(materialised), "pt")

    def test_attributed_substring_create_empty_named_export(self) -> None:
        # createEmpty is a public classmethod returning a new AttributedSubstring
        # and behaves like the empty-construct alias AttributedSubstring().
        created = self.AttributedSubstring.create_empty()
        self.assertIsInstance(created, self.AttributedSubstring)
        self.assertEqual(created.string, "")
        self.assertEqual(created, self.AttributedSubstring())

    def test_attribute_container_create_empty_named_export(self) -> None:
        # createEmpty is a public classmethod returning a new AttributeContainer and
        # behaves like the empty-construct alias AttributeContainer().
        created = self.AttributeContainer.create_empty()
        self.assertIsInstance(created, self.AttributeContainer)
        self.assertIsNone(created.foundation.language_identifier)
        self.assertIsNone(created.foundation.link)
        self.assertEqual(created, self.AttributeContainer())

    def test_foundation_attributes_create_empty_named_export(self) -> None:
        # createEmpty is a public classmethod returning a new FoundationAttributes
        # and behaves like the empty-construct alias FoundationAttributes().
        created = self.FoundationAttributes.create_empty()
        self.assertIsInstance(created, self.FoundationAttributes)
        self.assertIsNone(created.link)
        self.assertIsNone(created.language_identifier)
        self.assertEqual(created, self.FoundationAttributes())

    def test_foundation_attributes_create_from_container_named_export(self) -> None:
        # createFromContainer(container) is a public classmethod and behaves like
        # the AttributeContainer.foundation property alias.
        link_container = list(self.attributed_strings.emoji.runs)[0].attributes
        from_factory = self.FoundationAttributes.create_from_container(link_container)
        self.assertIsInstance(from_factory, self.FoundationAttributes)
        self.assertEqual(from_factory.link, "https://home.unicode.org/emoji")
        self.assertIsNone(from_factory.language_identifier)
        # Identical to the Pythonic property alias.
        self.assertEqual(from_factory, link_container.foundation)


if __name__ == "__main__":
    unittest.main()
