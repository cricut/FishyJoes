import importlib
import os
import sys
import unittest
import warnings
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class DeprecationTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_deprecated_static_method_warns(self) -> None:
        with warnings.catch_warnings(record=True) as caught:
            warnings.simplefilter("always")
            self.assertEqual(self.testapi.Deprecations.deprecated_method(), "Hello")

        self.assertEqual(len(caught), 1)
        self.assertTrue(issubclass(caught[0].category, DeprecationWarning))
        self.assertEqual(str(caught[0].message), "don't use this")

    def test_deprecated_static_property_warns(self) -> None:
        with warnings.catch_warnings(record=True) as caught:
            warnings.simplefilter("always")
            self.assertEqual(self.testapi.Deprecations.deprecated_variable, 42)

        self.assertEqual(len(caught), 1)
        self.assertTrue(issubclass(caught[0].category, DeprecationWarning))
        self.assertEqual(
            str(caught[0].message),
            "replace with `deprecatedMethod` (This is the swift name of the replacement function, due to technical limitations)",
        )


if __name__ == "__main__":
    unittest.main()
