import importlib
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class EmojiExplorerTests(unittest.TestCase):
    def setUp(self) -> None:
        self.emojifun = importlib.import_module("emojifun")

    def test_hello(self) -> None:
        self.assertEqual(self.emojifun.EmojiExplorer.hello, "👋🌎")

    def test_construction(self) -> None:
        explorer = self.emojifun.EmojiExplorer

        self.assertEqual(len(explorer.create(128).known), 128)
        self.assertEqual(len(explorer.create(0).known), 0)
        self.assertEqual(len(explorer.create(-1).known), 0)
        self.assertGreater(len(explorer.create(1212 + 50).known), 1212)

    def test_random(self) -> None:
        explorer = self.emojifun.EmojiExplorer.create(128)

        for _ in range(100):
            self.assertGreater(len(explorer.random()), 0)

        self.assertEqual(
            self.emojifun.EmojiExplorer.create(0).random(),
            self.emojifun.EmojiExplorer.hello,
        )

    def test_random_unique(self) -> None:
        count = 128
        explorer = self.emojifun.EmojiExplorer.create(count)

        reported = []
        for _ in range(len(explorer.known)):
            emoji = explorer.random_unique()
            if emoji is not None:
                reported.append(emoji)

        self.assertEqual(len(reported), count)
        self.assertEqual(set(reported), explorer.known)

    def test_enumerate_known(self) -> None:
        count = 128
        explorer = self.emojifun.EmojiExplorer.create(count)

        reported: list[str] = []

        def collect(value: str) -> bool:
            reported.append(value)
            return True

        explorer.enumerate_known(collect)
        self.assertEqual(len(reported), count)
        self.assertEqual(set(reported), explorer.known)

        early_exit_count = 0

        def collect_early(value: str) -> bool:
            nonlocal early_exit_count
            early_exit_count += 1
            return early_exit_count < 50

        explorer.enumerate_known(collect_early)
        self.assertEqual(early_exit_count, 50)

    def test_construction_known_set_contents(self) -> None:
        # The C#/Dart/Kotlin/TS binding tests all assert the EXACT 128-emoji known
        # set for create(128); the Python test only checked its length.
        explorer = self.emojifun.EmojiExplorer.create(128)
        expected = {
            "⌚", "⌛", "⏩", "⏪", "⏫", "⏬", "⏰", "⏳",
            "◽", "◾", "☔", "☕", "♈", "♉", "♊", "♋",
            "♌", "♍", "♎", "♏", "♐", "♑", "♒", "♓",
            "♿", "⚓", "⚡", "⚪", "⚫", "⚽", "⚾", "⛄",
            "⛅", "⛎", "⛔", "⛪", "⛲", "⛳", "⛵", "⛺",
            "⛽", "✅", "✊", "✋", "✨", "❌", "❎", "❓",
            "❔", "❕", "❗", "➕", "➖", "➗", "➰", "➿",
            "⬛", "⬜", "⭐", "⭕", "\U0001f004", "\U0001f0cf", "\U0001f18e", "\U0001f191",
            "\U0001f192", "\U0001f193", "\U0001f194", "\U0001f195", "\U0001f196", "\U0001f197", "\U0001f198", "\U0001f199",
            "\U0001f19a", "\U0001f1e6", "\U0001f1e7", "\U0001f1e8", "\U0001f1e9", "\U0001f1ea", "\U0001f1eb", "\U0001f1ec",
            "\U0001f1ed", "\U0001f1ee", "\U0001f1ef", "\U0001f1f0", "\U0001f1f1", "\U0001f1f2", "\U0001f1f3", "\U0001f1f4",
            "\U0001f1f5", "\U0001f1f6", "\U0001f1f7", "\U0001f1f8", "\U0001f1f9", "\U0001f1fa", "\U0001f1fb", "\U0001f1fc",
            "\U0001f1fd", "\U0001f1fe", "\U0001f1ff", "\U0001f201", "\U0001f21a", "\U0001f22f", "\U0001f232", "\U0001f233",
            "\U0001f234", "\U0001f235", "\U0001f236", "\U0001f238", "\U0001f239", "\U0001f23a", "\U0001f250", "\U0001f251",
            "\U0001f300", "\U0001f301", "\U0001f302", "\U0001f303", "\U0001f304", "\U0001f305", "\U0001f306", "\U0001f307",
            "\U0001f308", "\U0001f309", "\U0001f30a", "\U0001f30b", "\U0001f30c", "\U0001f30d", "\U0001f30e", "\U0001f30f",
        }
        self.assertEqual(len(expected), 128)
        self.assertEqual(explorer.known, expected)


if __name__ == "__main__":
    unittest.main()
