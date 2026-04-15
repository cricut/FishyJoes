"""Protocol integration tests."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.AProtocolImplementation import AProtocolImplementation
from cricut_testapi.TestProtocolEnum import TestProtocolEnum
from cricut_testapi.TestProtocolStruct import TestProtocolStruct
from cricut_testapi.TestProtocolClass import TestProtocolClass
from cricut_testapi.AssociatedDataEnum import (
    AssociatedDataEnum,
    AssociatedDataEnum_Thing,
    AssociatedDataEnum_Other,
    AssociatedDataEnum_Bar,
    AssociatedDataEnum_NoValue,
    AssociatedDataEnum_SimpleEnum,
)
from cricut_testapi.SimpleEnum import SimpleEnum
from cricut_testapi.TestDefaultComputedPropertiesStruct import TestDefaultComputedPropertiesStruct
from cricut_testapi.TestDefaultComputedPropertiesClass import TestDefaultComputedPropertiesClass
from cricut_testapi.TestDefaultComputedPropertiesEnum import TestDefaultComputedPropertiesEnum
from cricut_testapi.TestNonExportedProtocolEnum import TestNonExportedProtocolEnum
from cricut_testapi.TestLeadingUnderscoredPropStruct import TestLeadingUnderscoredPropStruct


class TestProtocolImplementation(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_protocol_implementation(self) -> None:
        a = AProtocolImplementation(foo="Garply", baz=False)
        self.assertEqual(a.foo, "Garply")
        self.assertFalse(a.baz)

        b = a.bar(x=2, y=128)
        self.assertEqual(b.foo, "130")
        self.assertTrue(b.baz)

        self.assertEqual(a.hasADefaultImplementation(9, -102.1), "-312 notBazzed")
        self.assertEqual(a.hasADefaultImplementation(2, 0.345), "bazzy 3")

        self.assertEqual(a.hasADefaultImplementation2("923.2185", True, "0.0898714"), "3783846677.1424932")
        self.assertEqual(a.hasADefaultImplementation2("923.2185", False, "0.0898714"), "1.9556754407899822e-05")

        self.assertEqual(a.hasADefaultImplementation2("0.9870923", True, "1.123123"), "0.9589049888649063")
        self.assertEqual(a.hasADefaultImplementation2("0.9870923", False, "1.123123"), "1.686253813623996")


class TestProtocolEnumTests(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_protocol_enum(self) -> None:
        tpe = TestProtocolEnum.qux
        tpe.foo()
        self.assertTrue(tpe.bar())
        tpe.baz(True)
        self.assertEqual(tpe.garply("Navigate a nostril!"), "garply Navigate a nostril! garpity garp")
        self.assertEqual(
            tpe.xyzzy(42, [1.234, 45.235890198, 892.80]),
            "thud: 42; grault: [1.234, 45.235890198, 892.8]",
        )
        result = tpe.plugh((True, 3.14159265359, ["Take a left at your intestines", "Take the second right past Mars"]))
        self.assertEqual(result, (False, 3, "Take a left at your intestines -<*>- Take the second right past Mars"))


class TestProtocolStructTests(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_protocol_struct(self) -> None:
        tps = TestProtocolStruct(corge="Raft a river of lava-ah!")
        self.assertEqual(tps.corge, "Raft a river of lava-ah!")
        tps.corge = "Spank a plankton too! (take that)"
        self.assertEqual(tps.corge, "Spank a plankton too! (take that)")
        self.assertEqual(tps.frobby, [3, 42, -1])
        result = tps.plugh((True, 42.9, ["Ride on the magic school bus", "You might get baked into a pie"]))
        self.assertEqual(result, (True, 51, "Ride on the magic school bus *>-<* You might get baked into a pie"))

        tps.foo()
        self.assertFalse(tps.bar())
        tps.baz(True)
        self.assertEqual(tps.garply("An octopus in your neighborhood?"), "garp garpity An octopus in your neighborhood? garpee")
        self.assertEqual(
            tps.xyzzy(42, [1.234, 45.235890198, 892.80]),
            "thud: 42 | grault: [1.234, 45.235890198, 892.8]",
        )


class TestProtocolClassTests(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_protocol_class(self) -> None:
        tpc = TestProtocolClass.init("Step inside it's a wilder ride!")
        self.assertEqual(tpc.corge, "Step inside it's a wilder ride!")
        self.assertEqual(tpc.frobby, [42, -1, 3])

        self.assertIsNone(tpc.flarp)
        tpc.flarp = "Excellent observation Kiki!"
        self.assertEqual(tpc.flarp, "Excellent observation Kiki!")

        self.assertAlmostEqual(tpc.wombat(None), 42.909, places=3)
        self.assertIsNone(tpc.wombat(57))
        self.assertAlmostEqual(tpc.wombat(56), 7890.2, places=1)

        self.assertEqual(tpc.spqr(AssociatedDataEnum_Thing(value=23947889)), 23947889)
        self.assertEqual(tpc.spqr(AssociatedDataEnum_Other(unnamed="zxc", _1=89708973)), 89708973)
        self.assertEqual(tpc.spqr(AssociatedDataEnum_Bar(named="shme", _1=AssociatedDataEnum_NoValue(), toggled=False)), 45)
        self.assertEqual(tpc.spqr(AssociatedDataEnum_NoValue()), 42)
        self.assertEqual(tpc.spqr(AssociatedDataEnum_SimpleEnum(value=SimpleEnum.blue)), 1)

        tpc.foo()
        self.assertTrue(tpc.bar())
        tpc.baz(True)
        self.assertEqual(tpc.garply("Surfin' on a sine wave"), "garplify Surfin' on a sine wave parguino")
        self.assertEqual(
            tpc.xyzzy(42, [1.234, 45.235890198, 892.80]),
            r"thud: 42 \|/ grault: [1.234, 45.235890198, 892.8]",
        )
        result = tpc.plugh((True, 92.47, ["Please let this be a normal field trip", "I knew I should've stayed home today"]))
        self.assertEqual(result, (True, 83, "Please let this be a normal field trip _-^= I knew I should've stayed home today"))

    def test_equals_hashcode_tostring(self) -> None:
        a = TestProtocolClass.init("Zoobilee Zoo; Zoobilee Zoo!", "Magic and wonder are waiting for you.")
        b = TestProtocolClass.init("Zoobilee Zoo; Zoobilee Zoo!", "Magic and wonder are waiting for you.")
        c = TestProtocolClass.init("It's as close as a dream", "And as bright as the brightest blue-oo!")
        self.assertEqual(a, b)
        self.assertNotEqual(b, c)


class TestDefaultComputedPropertiesTests(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_struct(self) -> None:
        a = TestDefaultComputedPropertiesStruct(spam=True, noot=98172)
        self.assertEqual(a.plutonic, "Newton Gimmick")
        self.assertTrue(a.spam)
        self.assertEqual(a.noot, 98172)

    def test_reference(self) -> None:
        a = TestDefaultComputedPropertiesClass.init(False, 123346)
        self.assertEqual(a.plutonic, "Newton Gimmick")
        self.assertFalse(a.spam)
        self.assertEqual(a.noot, 123346)

    def test_enum(self) -> None:
        a = TestDefaultComputedPropertiesEnum.qux
        self.assertEqual(a.plutonic, "Newton Gimmick")
        self.assertTrue(a.spam)
        self.assertEqual(a.noot, 72930)


class TestNonExportedProtocolEnumTests(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_non_exported_protocol_enum(self) -> None:
        a = TestNonExportedProtocolEnum.hogehoge
        self.assertAlmostEqual(a.fuga, 987890.23, places=2)
        self.assertAlmostEqual(a.hoge(), 23723.11, places=2)


class TestLeadingUnderscoredPropTests(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_leading_underscore_in_names(self) -> None:
        lups = TestLeadingUnderscoredPropStruct(_leadingUnderscoreProp="With great power comes great responsibility.")
        self.assertEqual(lups._leadingUnderscoreProp, "With great power comes great responsibility.")


if __name__ == "__main__":
    unittest.main()
