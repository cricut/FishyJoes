import unittest

from fishyjoes_runtime import ResultSuccess, ResultFailure

from testapi import results
from typing import cast


class ResultTests(unittest.TestCase):
    def test_result_values_and_arguments(self) -> None:
        self.assertEqual(results.get_a_success().get_or_none(), 42)
        self.assertIsNone(results.get_a_success().exception_or_none())
        failure_or_none: results.Error | None = results.get_a_failure().exception_or_none()
        self.assertIsInstance(failure_or_none, results.Error)
        self.assertEqual(cast(results.Error, failure_or_none).message, "reboot needed")

        self.assertEqual(results.process_result(ResultSuccess("yay")), "YAY")
        failure = ResultFailure(results.Error(message="reasons"))
        self.assertEqual(results.process_result(failure), "fail: reasons")


if __name__ == "__main__":
    unittest.main()
