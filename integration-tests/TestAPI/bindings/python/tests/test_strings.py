import unittest

from testapi import strings


class StringTests(unittest.TestCase):
    def test_string_values(self) -> None:
        self.assertEqual(strings.get_simple(), "Hello")
        self.assertEqual(strings.get_accent, "Olá")
        self.assertEqual(strings.get_script, "こんにちは")
        self.assertEqual(strings.get_chinese, "你好")
        self.assertEqual(strings.get_chinese_bmp, "豈更車賈滑")
        self.assertEqual(strings.get_chinese_sip, "\U00020001\U00020002\U00020003\U00020004")
        self.assertEqual(strings.get_emoji, "🤯🐶🍓")
        self.assertEqual(strings.get_emoji_multi, "👨‍👩‍👧‍👦👍🏿🇺🇸")

    def test_string_echo(self) -> None:
        self.assertEqual(strings.echo(strings.get_simple()), strings.get_simple())
        self.assertEqual(strings.echo(strings.get_accent()), strings.get_accent())
        self.assertEqual(strings.echo(strings.get_chinese()), strings.get_chinese())
        self.assertEqual(strings.echo(strings.get_chinese_bmp()), strings.get_chinese_bmp())
        self.assertEqual(strings.echo(strings.get_chinese_sip()), strings.get_chinese_sip())
        self.assertEqual(strings.echo(strings.get_emoji()), strings.get_emoji())
        self.assertEqual(strings.echo(strings.get_emoji_multi()), strings.get_emoji_multi())

    def test_string_split_array_round_trip(self) -> None:
        self.assertEqual(strings.split("one,two,three", ","), ["one", "two", "three"])
        self.assertEqual(strings.split("Olá|こんにちは|你好", "|"), ["Olá", "こんにちは", "你好"])

    def test_invalid_utf8_raises(self) -> None:
        # A lone surrogate has no valid UTF-8 encoding; the boundary rejects it with a
        # clear ValueError rather than silently replacing or passing it through (ADR 0004).
        with self.assertRaises(ValueError):
            strings.echo("\ud800")


if __name__ == "__main__":
    unittest.main()
