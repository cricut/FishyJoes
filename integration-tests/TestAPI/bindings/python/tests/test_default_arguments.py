import importlib
import inspect
import math
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class DefaultArgumentTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_default_arguments(self) -> None:
        defaults = self.testapi.DefaultArguments

        self.assertEqual(defaults.echo_defaults(None), "42 52 3.14")
        self.assertEqual(defaults.echo_defaults(1), "1 52 3.14")
        self.assertEqual(defaults.echo_defaults(1, z=42.0), "1 52 42.0")
        self.assertEqual(defaults.echo_defaults(None, y=8), "42 8 3.14")
        self.assertEqual(defaults.echo_defaults(1, y=2, z=4.8), "1 2 4.8")

    def test_enum_default_argument(self) -> None:
        defaults = self.testapi.DefaultArguments

        signature = inspect.signature(defaults.describe_enum_default)
        self.assertIs(signature.parameters["color"].default, self.testapi.SimpleEnum.blue)

        self.assertEqual(defaults.describe_enum_default(7), "7 255")
        self.assertEqual(
            defaults.describe_enum_default(7, color=self.testapi.SimpleEnum.red),
            "7 16711680",
        )

    def test_double_ulp_square_root_default_argument(self) -> None:
        defaults = self.testapi.DefaultArguments

        signature = inspect.signature(defaults.echo_default_tolerance)
        self.assertEqual(
            signature.parameters["tolerance"].default,
            math.sqrt(sys.float_info.epsilon),
        )

        self.assertEqual(
            defaults.echo_default_tolerance(),
            math.sqrt(sys.float_info.epsilon),
        )
        self.assertEqual(defaults.echo_default_tolerance(0.25), 0.25)

    def test_double_ulp_square_root_default_argument_is_generated_as_expression(self) -> None:
        package_src = GENERATED_SRC / "testapi"
        implementation = (package_src / "default_arguments.py").read_text()
        stubs = (package_src / "default_arguments.pyi").read_text()

        self.assertIn("import sys", implementation)
        self.assertIn("sys.float_info.epsilon ** 0.5", implementation)
        self.assertNotIn("1.4901161193847656", implementation)
        self.assertIn("import sys", stubs)
        self.assertIn("sys.float_info.epsilon ** 0.5", stubs)
        self.assertNotIn("1.4901161193847656", stubs)

    def test_int_limit_default_arguments(self) -> None:
        defaults = self.testapi.DefaultArguments

        signature = inspect.signature(defaults.echo_default_int_limits)
        self.assertEqual(signature.parameters["min_value"].default, -sys.maxsize - 1)
        self.assertEqual(signature.parameters["max_value"].default, sys.maxsize)

        self.assertEqual(defaults.echo_default_int_limits(), f"{-sys.maxsize - 1} {sys.maxsize}")
        self.assertEqual(defaults.echo_default_int_limits(-7, max_value=8), "-7 8")

    def test_int_limit_default_arguments_are_generated_as_expressions(self) -> None:
        package_src = GENERATED_SRC / "testapi"
        implementation = (package_src / "default_arguments.py").read_text()
        stubs = (package_src / "default_arguments.pyi").read_text()

        self.assertIn("import sys", implementation)
        self.assertIn("min_value=-sys.maxsize - 1", implementation)
        self.assertIn("max_value=sys.maxsize", implementation)
        self.assertIn("import sys", stubs)
        self.assertIn("min_value: int = -sys.maxsize - 1", stubs)
        self.assertIn("max_value: int = sys.maxsize", stubs)


if __name__ == "__main__":
    unittest.main()
