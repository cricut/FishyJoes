"""Default arguments integration tests."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.DefaultArguments import DefaultArguments


class TestDefaultArguments(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_all_defaults(self) -> None:
        self.assertEqual(DefaultArguments.echoDefaults(x=None), "42 52 3.14")

    def test_all_defaults_explicit_y_none(self) -> None:
        self.assertEqual(DefaultArguments.echoDefaults(x=None, y=None), "42 52 3.14")

    def test_override_x(self) -> None:
        self.assertEqual(DefaultArguments.echoDefaults(x=1), "1 52 3.14")

    def test_override_x_and_z(self) -> None:
        self.assertEqual(DefaultArguments.echoDefaults(x=1, z=42.0), "1 52 42.0")

    def test_override_y(self) -> None:
        self.assertEqual(DefaultArguments.echoDefaults(x=None, y=8), "42 8 3.14")

    def test_override_all(self) -> None:
        self.assertEqual(DefaultArguments.echoDefaults(x=1, z=4.8, y=2), "1 2 4.8")


if __name__ == "__main__":
    unittest.main()
