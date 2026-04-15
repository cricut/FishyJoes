"""String integration tests."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.Strings import Strings


class TestStrings(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_simple(self) -> None:
        self.assertEqual(Strings.simple(), "Hello")

    def test_accent(self) -> None:
        self.assertEqual(Strings.accent(), "Olá")

    def test_script(self) -> None:
        self.assertEqual(Strings.script(), "こんにちは")

    def test_chinese(self) -> None:
        self.assertEqual(Strings.chinese(), "你好")

    def test_chinese_bmp(self) -> None:
        self.assertEqual(Strings.chineseBMP(), "\uF900\uF901\uF902\uF903\uF904")

    def test_chinese_sip(self) -> None:
        val = Strings.chineseSIP()
        self.assertIsInstance(val, str)
        self.assertEqual(len(val), 4)

    def test_emoji(self) -> None:
        self.assertEqual(Strings.emoji(), "🤯🐶🍓")

    def test_emoji_multi(self) -> None:
        self.assertEqual(Strings.emojiMulti(), "👨‍👩‍👧‍👦👍🏿🇺🇸")

    def test_echo_simple(self) -> None:
        self.assertEqual(Strings.echo("Hello"), "Hello")

    def test_echo_accent(self) -> None:
        val = Strings.accent()
        self.assertEqual(Strings.echo(val), val)

    def test_echo_script(self) -> None:
        val = Strings.script()
        self.assertEqual(Strings.echo(val), val)

    def test_echo_chinese(self) -> None:
        val = Strings.chinese()
        self.assertEqual(Strings.echo(val), val)

    def test_echo_chinese_bmp(self) -> None:
        val = Strings.chineseBMP()
        self.assertEqual(Strings.echo(val), val)

    def test_echo_chinese_sip(self) -> None:
        val = Strings.chineseSIP()
        self.assertEqual(Strings.echo(val), val)

    def test_echo_emoji(self) -> None:
        val = Strings.emoji()
        self.assertEqual(Strings.echo(val), val)

    def test_echo_emoji_multi(self) -> None:
        val = Strings.emojiMulti()
        self.assertEqual(Strings.echo(val), val)

    def test_echo_empty(self) -> None:
        self.assertEqual(Strings.echo(""), "")


if __name__ == "__main__":
    unittest.main()
