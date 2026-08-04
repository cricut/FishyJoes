import importlib
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class MethodTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_reference_instance_members(self) -> None:
        methods = self.testapi.Methods.create()

        self.assertEqual(methods.instance_get, 1234)
        self.assertEqual(methods.garply, 42901)
        self.assertTrue(callable(methods.instance_get_method))
        self.assertEqual(methods.instance_get_method(), 2345)
        self.assertEqual(methods.instance_modifiable, 3456)
        self.assertEqual(methods.instance_stored, 5678)
        self.assertEqual(methods.double_plus_good(21, 20.6), 84)

    def test_reference_static_export_as_method_is_callable(self) -> None:
        self.assertTrue(callable(self.testapi.Methods.static_get_method))
        self.assertEqual(self.testapi.Methods.static_get_method(), 234)

    def test_reference_instance_property_setters(self) -> None:
        methods = self.testapi.Methods.create()

        methods.instance_modifiable = 9001
        self.assertEqual(methods.instance_modifiable, 9001)

        methods.instance_stored = 6002
        self.assertEqual(methods.instance_stored, 6002)

    def test_reference_static_property_setters_reach_native(self) -> None:
        # Covers the metaclass-on-a-SwiftReference-subclass path (_MethodsMeta): the
        # highest-risk settable-static shape. A getter-only regression, or a setter that
        # silently rebinds the class attribute instead of calling native, fails here.
        methods = self.testapi.Methods
        original_modifiable = methods.static_modifiable
        original_stored = methods.static_stored
        try:
            methods.static_modifiable = 9001
            self.assertEqual(methods.static_modifiable, 9001)
            methods.static_stored = 6002
            self.assertEqual(methods.static_stored, 6002)
        finally:
            methods.static_modifiable = original_modifiable
            methods.static_stored = original_stored


if __name__ == "__main__":
    unittest.main()
