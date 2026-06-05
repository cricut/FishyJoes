import importlib
import re
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class ClassTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_empty_class_reference_equality_and_hash(self) -> None:
        a1 = self.testapi.EmptyClass1.create()
        a2 = self.testapi.EmptyClass1.create()

        self.assertEqual(a1.blarg, "Blarg!")
        self.assertEqual(a1.wibbledy_wobbledy_timey_whimey, "<wibble>*Wobble*")
        self.assertEqual(a1.shme(), "Shme! Hand me my hook.")
        self.assertEqual(a1.gorpers(), "Go Gorp!")
        self.assertEqual(a1, a2)
        self.assertEqual(hash(a1), hash(a2))

        b1 = self.testapi.EmptyClass2.make()
        self.assertEqual(b1.blorg, "Gralb!")
        self.assertEqual(b1.wibble, "<timey>*Whimey*")
        self.assertEqual(b1.shmee(), "Shme? What's that ticking sound?")
        self.assertEqual(b1.gorp(), "Stop Sreprog!")
        self.assertNotEqual(a1, b1)
        self.assertNotEqual(hash(a1), hash(b1))

    def test_swift_reference_repr_identifies_type_and_pointer(self) -> None:
        value = self.testapi.EmptyClass1.create()

        self.assertRegex(repr(value), r"^EmptyClass1\(swift_ref=0x[0-9a-f]+\)$")


if __name__ == "__main__":
    unittest.main()
