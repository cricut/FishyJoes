"""Class integration tests."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.EmptyClass import EmptyClass
from cricut_testapi.EmptyClass2 import EmptyClass2


class TestEmptyClass(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_create(self) -> None:
        self.assertIsInstance(EmptyClass.create(), EmptyClass)

    def test_blarg(self) -> None:
        self.assertEqual(EmptyClass.create().blarg, "Blarg!")

    def test_wibble(self) -> None:
        self.assertEqual(EmptyClass.create().wibbledyWobbledyTimeyWhimey, "<wibble>*Wobble*")

    def test_shme(self) -> None:
        self.assertEqual(EmptyClass.create().shme(), "Shme! Hand me my hook.")

    def test_gorpers(self) -> None:
        self.assertEqual(EmptyClass.create().Gorpers(), "Go Gorp!")


class TestEmptyClass2(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_make(self) -> None:
        self.assertIsInstance(EmptyClass2.make(), EmptyClass2)

    def test_blorg(self) -> None:
        self.assertIsInstance(EmptyClass2.make().blorg, str)

    def test_wibble(self) -> None:
        self.assertIsInstance(EmptyClass2.make().wibble, str)

    def test_shmee(self) -> None:
        self.assertIsInstance(EmptyClass2.make().shmee(), str)

    def test_gorp(self) -> None:
        self.assertIsInstance(EmptyClass2.make().gorp(), str)


if __name__ == "__main__":
    unittest.main()
