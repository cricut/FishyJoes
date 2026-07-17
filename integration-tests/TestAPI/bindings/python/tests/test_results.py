import unittest

import testapi


class ResultTests(unittest.TestCase):
    def test_result_values_and_arguments(self) -> None:
        self.assertEqual(testapi.Results.a_success.get_or_none(), 42)
        self.assertIsNone(testapi.Results.a_success.exception_or_none())
        self.assertEqual(testapi.Results.a_failure.exception_or_none().message, "reboot needed")

        self.assertEqual(testapi.Results.process_result(testapi.ResultSuccess("yay")), "YAY")
        failure = testapi.ResultFailure(testapi.Results_Error(message="reasons"))
        self.assertEqual(testapi.Results.process_result(failure), "fail: reasons")


if __name__ == "__main__":
    unittest.main()
