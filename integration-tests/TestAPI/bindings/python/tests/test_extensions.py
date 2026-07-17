import unittest

import testapi


class ExtensionTests(unittest.TestCase):
    def test_extension_declared_exported_types(self) -> None:
        string_extension_type = testapi.String_PuttingTypesIntoQuestionablePlaces
        structs_extension_type = testapi.Structs_PuttingTypesIntoQuestionablePlaces
        scalar_extension_type = testapi.UnicodeScalar_PuttingTypesIntoQuestionablePlaces

        self.assertEqual(string_extension_type("hello").test_call(), 42)
        self.assertEqual(structs_extension_type.create().test_call(), 43)
        self.assertEqual(scalar_extension_type.thing.test_call(), 44)


if __name__ == "__main__":
    unittest.main()
