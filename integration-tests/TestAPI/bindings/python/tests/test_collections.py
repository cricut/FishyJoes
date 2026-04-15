"""Collection integration tests."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.Collections import Collections
from cricut_testapi.CollectionHolder import CollectionHolder


class TestCollections(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_array_of_int(self) -> None:
        self.assertIsInstance(Collections.arrayOfInt(), list)

    def test_set_of_int(self) -> None:
        self.assertIsInstance(Collections.setOfInt(), set)

    def test_dictionary_of_int_to_int(self) -> None:
        self.assertIsInstance(Collections.dictionaryOfIntToInt(), dict)

    def test_maybe_array_of_int_not_none(self) -> None:
        self.assertIsInstance(Collections.maybeArrayOfInt(), list)

    def test_maybe_set_of_int_not_none(self) -> None:
        self.assertIsNotNone(Collections.maybeSetOfInt())

    def test_maybe_dict_not_none(self) -> None:
        self.assertIsNotNone(Collections.maybeDictionaryOfIntToInt())

    def test_maybe_array_of_maybe_int_not_none(self) -> None:
        self.assertIsNotNone(Collections.maybeArrayOfMaybeInt())

    def test_echo_array_of_int(self) -> None:
        arr = [1, 2, 3]
        self.assertEqual(Collections.echoArrayOfInt(arr), arr)

    def test_echo_set_of_int(self) -> None:
        s = {10, 20, 30}
        self.assertEqual(Collections.echoSetOfInt(s), s)

    def test_echo_dict(self) -> None:
        d = {1: 100, 2: 200}
        self.assertEqual(Collections.echoDictionaryOfIntToInt(d), d)

    def test_echo_maybe_array_of_maybe_int_some(self) -> None:
        inp = [1, None, 3]
        self.assertEqual(Collections.echoMaybeArrayOfMaybeInt(inp), inp)

    def test_echo_maybe_array_of_maybe_int_none(self) -> None:
        self.assertIsNone(Collections.echoMaybeArrayOfMaybeInt(None))

    def test_echo_maybe_set_of_maybe_int_none(self) -> None:
        self.assertIsNone(Collections.echoMaybeSetOfMaybeInt(None))

    def test_echo_maybe_dict_none(self) -> None:
        self.assertIsNone(Collections.echoMaybeDictionaryOfIntToMaybeInt(None))

    def test_collection_mapper_identity(self) -> None:
        self.assertEqual(Collections.collectionMapper([1, 2, 3], lambda x: x), [1, 2, 3])

    def test_collection_mapper_none_in(self) -> None:
        self.assertEqual(Collections.collectionMapper(None, lambda x: [42]), [42])


class TestCollectionHolder(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_default_collection_holder(self) -> None:
        self.assertIsInstance(Collections.defaultCollectionHolder(), CollectionHolder)

    def test_static_property(self) -> None:
        self.assertIsInstance(CollectionHolder.staticProperty(), list)

    def test_static_mutable_property_roundtrip(self) -> None:
        original = CollectionHolder.staticMutableProperty()
        new_val = [7, None, 9]
        CollectionHolder.set_staticMutableProperty(new_val)
        self.assertEqual(CollectionHolder.staticMutableProperty(), new_val)
        CollectionHolder.set_staticMutableProperty(original)


if __name__ == "__main__":
    unittest.main()
