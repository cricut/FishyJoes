"""Example / sanity tests."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded


class TestExample(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_two_plus_two(self) -> None:
        self.assertEqual(2 + 2, 4)


if __name__ == "__main__":
    unittest.main()
