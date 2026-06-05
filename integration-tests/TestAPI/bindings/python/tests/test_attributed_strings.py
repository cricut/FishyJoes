import importlib
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


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


if __name__ == "__main__":
    unittest.main()
