import importlib
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class StringTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_string_values(self) -> None:
        strings = self.testapi.Strings

        self.assertEqual(strings.simple, "Hello")
        self.assertEqual(strings.accent, "Olá")
        self.assertEqual(strings.script, "こんにちは")
        self.assertEqual(strings.chinese, "你好")
        self.assertEqual(strings.chinese_bmp, "豈更車賈滑")
        self.assertEqual(strings.chinese_sip, "\U00020001\U00020002\U00020003\U00020004")
        self.assertEqual(strings.emoji, "🤯🐶🍓")
        self.assertEqual(strings.emoji_multi, "👨‍👩‍👧‍👦👍🏿🇺🇸")

    def test_string_echo(self) -> None:
        strings = self.testapi.Strings

        self.assertEqual(strings.echo(strings.simple), strings.simple)
        self.assertEqual(strings.echo(strings.accent), strings.accent)
        self.assertEqual(strings.echo(strings.chinese), strings.chinese)
        self.assertEqual(strings.echo(strings.chinese_bmp), strings.chinese_bmp)
        self.assertEqual(strings.echo(strings.chinese_sip), strings.chinese_sip)
        self.assertEqual(strings.echo(strings.emoji), strings.emoji)
        self.assertEqual(strings.echo(strings.emoji_multi), strings.emoji_multi)

    def test_string_split_array_round_trip(self) -> None:
        strings = self.testapi.Strings

        self.assertEqual(strings.split("one,two,three", ","), ["one", "two", "three"])
        self.assertEqual(strings.split("Olá|こんにちは|你好", "|"), ["Olá", "こんにちは", "你好"])

    def test_invalid_utf8_raises(self) -> None:
        # A lone surrogate has no valid UTF-8 encoding; the boundary rejects it with a
        # clear ValueError rather than silently replacing or passing it through (ADR 0004).
        strings = self.testapi.Strings

        with self.assertRaises(ValueError):
            strings.echo("\ud800")


if __name__ == "__main__":
    unittest.main()
