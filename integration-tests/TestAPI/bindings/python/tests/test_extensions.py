import unittest

from testapi import String_PuttingTypesIntoQuestionablePlaces, Structs_PuttingTypesIntoQuestionablePlaces, \
    unicode_scalar__putting_types_into_questionable_places


class ExtensionTests(unittest.TestCase):
    def test_extension_declared_exported_types(self) -> None:
        self.assertEqual(String_PuttingTypesIntoQuestionablePlaces("hello").test_call(), 42)
        self.assertEqual(Structs_PuttingTypesIntoQuestionablePlaces.create().test_call(), 43)
        self.assertEqual(unicode_scalar__putting_types_into_questionable_places.Thing().test_call(), 44)


if __name__ == "__main__":
    unittest.main()
