import unittest

import testapi
from testapi import reference_only_types, structs


class StructTests(unittest.TestCase):
    def test_empty_struct_instance_members(self) -> None:
        a1 = testapi.EmptyStruct.create()
        self.assertEqual(a1.tutu, 35671)
        self.assertEqual(a1.tatiana, "Toodles! ta ta for now...")
        self.assertEqual(a1.aap(), "The Netherlands")
        self.assertEqual(a1.zxccxz(), "Cambridge University (England)")

        a2 = testapi.EmptyStruct.create()
        self.assertEqual(a2.tutu, 35671)
        self.assertEqual(a2.tatiana, "Toodles! ta ta for now...")
        self.assertEqual(a2.aap(), "The Netherlands")

        b1 = testapi.EmptyStruct2.create()
        self.assertEqual(b1.tutu, 12897)
        self.assertEqual(b1.tatiana, "Arrivederci")
        self.assertEqual(b1.aap(), "The Netherlands2")
        self.assertEqual(b1.zxccxz(), "Cambridge University (England)2")

    def test_reference_only_type_is_generated_when_used_by_api(self) -> None:
        marker = reference_only_types.marker()

        self.assertIsInstance(marker, reference_only_types.Marker)
        self.assertEqual(marker, marker)
        self.assertIsInstance(hash(marker), int)

    def test_reference_only_marker_compares_by_value(self) -> None:
        # ReferenceOnlyTypes.Marker is a Swift `Hashable` reference type with no
        # members. Two factory calls return distinct handles to equal Swift values,
        # so they must compare equal by value (matching Swift and the C#/Dart/Kotlin
        # targets) — not by Python object identity. A member-less Equatable reference
        # type whose __eq__/__hash__ wiring is skipped would fail here.
        first = reference_only_types.marker()
        second = reference_only_types.marker()

        self.assertIsNot(first, second)
        self.assertEqual(first, second)
        self.assertEqual(hash(first), hash(second))
        self.assertNotEqual(first, object())

    def test_hashable_value_structs_are_hashable_in_python(self) -> None:
        first = structs.MemberwiseStruct("Eternal", "Fickle")
        second = structs.MemberwiseStruct("Eternal", "Fickle")
        different = structs.MemberwiseStruct("Eternal", "Changed")

        self.assertEqual(first, second)
        self.assertEqual(hash(first), hash(second))
        self.assertNotEqual(first, different)
        self.assertNotEqual(hash(first), hash(different))


if __name__ == "__main__":
    unittest.main()
