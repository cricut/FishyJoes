"""Struct integration tests."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.EmptyStruct import EmptyStruct
from cricut_testapi.EmptyStruct2 import EmptyStruct2
from cricut_testapi.MutableStruct import MutableStruct
from cricut_testapi.MemberwiseStruct import MemberwiseStruct
from cricut_testapi.ReferenceStruct import ReferenceStruct


class TestEmptyStruct(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_create(self) -> None:
        self.assertIsInstance(EmptyStruct.create(), EmptyStruct)

    def test_tutu(self) -> None:
        self.assertIsInstance(EmptyStruct.create().tutu, int)

    def test_tatiana(self) -> None:
        self.assertIsInstance(EmptyStruct.create().tatiana, str)

    def test_aap(self) -> None:
        self.assertIsInstance(EmptyStruct.create().aap(), str)

    def test_zxccxz(self) -> None:
        self.assertIsInstance(EmptyStruct.create().zxccxz(), str)

    def test_empty_struct2_create(self) -> None:
        self.assertIsInstance(EmptyStruct2.create(), EmptyStruct2)

    def test_empty_struct2_tutu(self) -> None:
        self.assertIsInstance(EmptyStruct2.create().tutu, int)

    def test_empty_struct2_tatiana(self) -> None:
        self.assertIsInstance(EmptyStruct2.create().tatiana, str)

    def test_empty_struct2_aap(self) -> None:
        self.assertIsInstance(EmptyStruct2.create().aap(), str)

    def test_empty_struct2_zxccxz(self) -> None:
        self.assertIsInstance(EmptyStruct2.create().zxccxz(), str)


class TestMutableStruct(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_create_i_is_zero(self) -> None:
        self.assertEqual(MutableStruct.create().i, 0)

    def test_increment(self) -> None:
        s = MutableStruct.create()
        s.increment()
        self.assertEqual(s.i, 1)

    def test_increment_twice(self) -> None:
        s = MutableStruct.create()
        s.increment()
        s.increment()
        self.assertEqual(s.i, 2)


class TestMemberwiseStruct(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_create(self) -> None:
        self.assertIsInstance(MemberwiseStruct.create(), MemberwiseStruct)

    def test_immutable(self) -> None:
        self.assertEqual(MemberwiseStruct.create().immutable, "Eternal")

    def test_mutable(self) -> None:
        self.assertEqual(MemberwiseStruct.create().mutable, "Fickle")


class TestReferenceStruct(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_create(self) -> None:
        self.assertIsInstance(ReferenceStruct.create(), ReferenceStruct)

    def test_immutable_property(self) -> None:
        self.assertIsInstance(ReferenceStruct.create().immutable, str)

    def test_mutable_property_roundtrip(self) -> None:
        s = ReferenceStruct.create()
        s.mutable = "changed"
        self.assertEqual(s.mutable, "changed")


if __name__ == "__main__":
    unittest.main()
