import importlib
import os
import sys
from pathlib import Path
import unittest


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class GeneratorRobustnessTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_generated_type_descriptors_use_swift_origin_keys(self) -> None:
        reference_case_enum = GENERATED_SRC / "testapi" / "reference_case_enum.py"
        source = reference_case_enum.read_text()

        self.assertIn('_native.ValueType("TestAPI.ReferenceCaseEnum")', source)
        self.assertNotIn('_native.ValueType("ReferenceCaseEnum")', source)


if __name__ == "__main__":
    unittest.main()
