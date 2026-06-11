import importlib
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class CollectionTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_int_array_values_and_echo(self) -> None:
        collections = self.testapi.Collections

        self.assertEqual(collections.array_of_int, [2, 7, 3, 5, 8])
        payload = [2, 4, 6, 30, 32]
        self.assertEqual(collections.echo_array_of_int(payload), payload)

    def test_int_set_values_and_echo(self) -> None:
        collections = self.testapi.Collections

        self.assertEqual(collections.set_of_int, {5, 9, 2, 4, 3})
        payload = {2, 4, 6, 30, 32}
        self.assertEqual(collections.echo_set_of_int(payload), payload)

    def test_int_dictionary_values_and_echo(self) -> None:
        collections = self.testapi.Collections

        expected = {1: 10, 2: 20, 3: 30, 4: 40, 5: 50}
        self.assertEqual(collections.dictionary_of_int_to_int, expected)
        payload = {1: 12, 123: 21}
        self.assertEqual(collections.echo_dictionary_of_int_to_int(payload), payload)

    def test_optional_int_array_value(self) -> None:
        collections = self.testapi.Collections

        self.assertEqual(collections.maybe_array_of_int, [2, 7, 3, 5, 8])

    def test_nested_optional_collections_and_echo(self) -> None:
        collections = self.testapi.Collections

        self.assertEqual(collections.maybe_array_of_maybe_int, [None, 2, 7, 3, 5, 8])
        self.assertEqual(collections.echo_maybe_array_of_maybe_int([None, 3, 5]), [None, 3, 5])
        self.assertIsNone(collections.echo_maybe_array_of_maybe_int(None))

        self.assertEqual(collections.maybe_set_of_maybe_int, {None, 5, 9, 2, 4, 3})
        self.assertEqual(collections.echo_maybe_set_of_maybe_int({None, 7, 11}), {None, 7, 11})
        self.assertIsNone(collections.echo_maybe_set_of_maybe_int(None))

        expected = {100: None, 1: 10, 2: 20, 3: 30, 4: 40, 5: 50}
        self.assertEqual(collections.maybe_dictionary_of_int_to_maybe_int, expected)
        payload = {1: None, 2: 7}
        self.assertEqual(collections.echo_maybe_dictionary_of_int_to_maybe_int(payload), payload)
        self.assertIsNone(collections.echo_maybe_dictionary_of_int_to_maybe_int(None))


if __name__ == "__main__":
    unittest.main()
