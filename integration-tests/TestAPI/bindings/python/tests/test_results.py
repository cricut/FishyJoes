import importlib
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class ResultTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_result_values_and_arguments(self) -> None:
        testapi = self.testapi

        self.assertEqual(testapi.Results.a_success.get_or_none(), 42)
        self.assertIsNone(testapi.Results.a_success.exception_or_none())
        self.assertEqual(testapi.Results.a_failure.exception_or_none().message, "reboot needed")

        self.assertEqual(testapi.Results.process_result(testapi.ResultSuccess("yay")), "YAY")
        failure = testapi.ResultFailure(testapi.Results_Error(message="reasons"))
        self.assertEqual(testapi.Results.process_result(failure), "fail: reasons")


if __name__ == "__main__":
    unittest.main()
