import importlib
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
sys.path.insert(0, str(GENERATED_SRC))


class MethodTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_reference_instance_members(self) -> None:
        methods = self.testapi.Methods.create()

        self.assertEqual(methods.instance_get, 1234)
        self.assertEqual(methods.garply, 42901)
        self.assertEqual(methods.instance_get_method, 2345)
        self.assertEqual(methods.instance_modifiable, 3456)
        self.assertEqual(methods.instance_stored, 5678)
        self.assertEqual(methods.double_plus_good(21, 20.6), 84)

    def test_reference_instance_property_setters(self) -> None:
        methods = self.testapi.Methods.create()

        methods.instance_modifiable = 9001
        self.assertEqual(methods.instance_modifiable, 9001)

        methods.instance_stored = 6002
        self.assertEqual(methods.instance_stored, 6002)


if __name__ == "__main__":
    unittest.main()
