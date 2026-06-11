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


if __name__ == "__main__":
    unittest.main()
