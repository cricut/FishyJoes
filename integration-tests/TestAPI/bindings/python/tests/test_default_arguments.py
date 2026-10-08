import inspect
import math
import sys
import unittest

from testapi import default_arguments as defaults
from testapi import simple_enum


class DefaultArgumentTests(unittest.TestCase):
    def test_default_arguments(self) -> None:
        self.assertEqual(defaults.echo_defaults(None), "42 52 3.14")
        self.assertEqual(defaults.echo_defaults(1), "1 52 3.14")
        self.assertEqual(defaults.echo_defaults(1, z=42.0), "1 52 42.0")
        self.assertEqual(defaults.echo_defaults(None, y=8), "42 8 3.14")
        self.assertEqual(defaults.echo_defaults(1, y=2, z=4.8), "1 2 4.8")

    def test_double_ulp_square_root_default_argument(self) -> None:
        signature = inspect.signature(defaults.echo_default_tolerance)
        self.assertEqual(
            signature.parameters["tolerance"].default,
            math.sqrt(sys.float_info.epsilon),
        )

        self.assertEqual(
            defaults.echo_default_tolerance(),
            math.sqrt(sys.float_info.epsilon),
        )
        self.assertEqual(defaults.echo_default_tolerance(tolerance=0.25), 0.25)

    def test_int_limit_default_arguments(self) -> None:
        signature = inspect.signature(defaults.echo_default_int_limits)
        self.assertEqual(signature.parameters["min_value"].default, -sys.maxsize - 1)
        self.assertEqual(signature.parameters["max_value"].default, sys.maxsize)

        self.assertEqual(defaults.echo_default_int_limits(), f"{-sys.maxsize - 1} {sys.maxsize}")
        self.assertEqual(defaults.echo_default_int_limits(min_value=-7, max_value=8), "-7 8")

if __name__ == "__main__":
    unittest.main()
