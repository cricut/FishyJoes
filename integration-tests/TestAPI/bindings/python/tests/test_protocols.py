import importlib
import math
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class ProtocolTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_python_protocol_witness_passed_to_swift(self) -> None:
        testapi = self.testapi

        class PythonAProtocol(testapi.AProtocol):
            @property
            def foo(self) -> str:
                return "python foo"

            @property
            def baz(self) -> bool:
                return True

            def bar(self, x: int, y: int):
                return testapi.AProtocolImplementation(foo=f"python bar {x + y}", baz=False)

            def has_a_default_implementation(self, x: int, y: float) -> str:
                returned = self.bar(x=x, y=round(y * math.pi))
                return f"{returned.foo} {'bazzy' if returned.baz else 'notBazzed'}"

            def has_a_default_implementation2(self, a: str, b: bool, c: str) -> str:
                return str(float(a) ** 3.23 if b else float(c) ** 4.5)

        value = PythonAProtocol()

        self.assertEqual(
            testapi.ProtocolWitnesses.describe_a_protocol(value, x=4, y=9),
            "python foo|true|python bar 13|false|python bar 32 notBazzed",
        )

        returned = testapi.ProtocolWitnesses.return_a_protocol(value)
        self.assertEqual(returned.foo, "python foo")
        self.assertTrue(returned.baz)
        self.assertEqual(returned.bar(x=7, y=8).foo, "python bar 15")

    def test_a_protocol_swift_implementation_and_returned_existential(self) -> None:
        testapi = self.testapi
        value = testapi.AProtocolImplementation(foo="Garply", baz=False)

        self.assertEqual(value.foo, "Garply")
        self.assertFalse(value.baz)
        returned = value.bar(x=2, y=128)

        self.assertEqual(returned.foo, "130")
        self.assertTrue(returned.baz)
        self.assertEqual(value.has_a_default_implementation(x=9, y=-102.1), "-312 notBazzed")
        self.assertEqual(value.has_a_default_implementation(x=2, y=0.345), "bazzy 3")
        self.assertEqual(
            value.has_a_default_implementation2("923.2185", b=True, c="0.0898714"),
            "3783846677.1424932",
        )

    def test_protocol_enum_struct_and_class_members(self) -> None:
        testapi = self.testapi

        enum_value = testapi.TestProtocolEnum.qux
        self.assertTrue(enum_value.bar())
        enum_value.baz(True)
        self.assertEqual(enum_value.garply("Navigate a nostril!"), "garply Navigate a nostril! garpity garp")
        self.assertEqual(
            enum_value.xyzzy(42, [1.234, 45.234890198, 892.8]),
            "thud: 42; grault: [1.234, 45.234890198, 892.8]",
        )
        self.assertEqual(
            enum_value.plugh((True, 3.14159265359, ["Take a left at your intestines", "Take the second right past Mars"])),
            (False, 3, "Take a left at your intestines -<*>- Take the second right past Mars"),
        )

        struct_value = testapi.TestProtocolStruct(corge="Raft a river of lava-ah!")
        self.assertEqual(struct_value.corge, "Raft a river of lava-ah!")
        self.assertEqual(struct_value.frobby, [3, 42, -1])
        self.assertFalse(struct_value.bar())
        self.assertEqual(struct_value.garply("An octopus in your neighborhood?"), "garp garpity An octopus in your neighborhood? garpee")

        class_value = testapi.TestProtocolClass.init(corge="Step inside it's a wilder ride!")
        self.assertEqual(class_value.corge, "Step inside it's a wilder ride!")
        self.assertEqual(class_value.frobby, [42, -1, 3])
        self.assertIsNone(class_value.flarp)
        class_value.flarp = "Excellent observation Kiki!"
        self.assertEqual(class_value.flarp, "Excellent observation Kiki!")
        self.assertEqual(class_value.wombat(None), 42.909)
        self.assertIsNone(class_value.wombat(57))
        self.assertEqual(class_value.wombat(56), 7890.2)


if __name__ == "__main__":
    unittest.main()
