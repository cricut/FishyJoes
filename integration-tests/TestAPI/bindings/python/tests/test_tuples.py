"""Tuple integration tests."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.Tuples import Tuples


class TestTuples(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()
        self.tuple2 = (1, "two")
        self.tuple3 = ("one", 2.1, "three")
        self.tuple4 = (self.tuple2, self.tuple3, "IV", True)
        self.tuple5 = ("I", 2, self.tuple4, self.tuple3, self.tuple2)
        self.tuple6 = ("one", 2, 3.14, self.tuple4, self.tuple5, False)

    def test_swift_tuples_to_python(self) -> None:
        self.assertEqual(Tuples.tuple2(), self.tuple2)
        self.assertEqual(Tuples.tuple3(), self.tuple3)
        self.assertEqual(Tuples.tuple4(), self.tuple4)
        self.assertEqual(Tuples.tuple5(), self.tuple5)
        self.assertEqual(Tuples.tuple6(), self.tuple6)

    def test_python_tuples_to_swift(self) -> None:
        self.assertTrue(
            Tuples.checkTuples(
                self.tuple2,
                self.tuple3,
                self.tuple4,
                self.tuple5,
                self.tuple6,
            )
        )


if __name__ == "__main__":
    unittest.main()
