"""Result integration tests."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.Results import Results
from cricut_testapi.Error import Error


class TestResults(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_a_success(self) -> None:
        result = Results.aSuccess()
        # Success is represented as (True, value)
        self.assertTrue(result[0])
        self.assertEqual(result[1], 42)

    def test_a_failure(self) -> None:
        result = Results.aFailure()
        # Failure is represented as (False, error)
        self.assertFalse(result[0])
        self.assertEqual(result[1].message, "reboot needed")

    def test_process_result_success(self) -> None:
        success = Results.aSuccess()
        # Build a success result with a string value
        # The success tuple has (True, 42) from aSuccess(), but processResult takes a string result
        # Pass a success tuple with a string payload
        result = Results.processResult((True, "yay"))
        self.assertEqual(result, "YAY")

    def test_process_result_failure(self) -> None:
        result = Results.processResult((False, Error(message="reasons")))
        self.assertEqual(result, "fail: reasons")


if __name__ == "__main__":
    unittest.main()
