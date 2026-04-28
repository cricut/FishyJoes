"""Parity with Kotlin's TestLeadingUnderscoredPropStruct.

Properties that begin with a leading underscore are a name-mangling
landmine in any binding generator: they collide with Python's
"name-mangled to private" convention inside classes (the double
underscore form), they are non-public by convention, and dataclass
field ordering treats them like any other attribute.

This test pins the runtime behaviour so a future refactor of the
PythonProductClass emitter or the runtime's setup_struct_type does not
silently drop or rename ``_leadingUnderscoreProp``.
"""

import os
import sys
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.TestLeadingUnderscoredPropStruct import (
    TestLeadingUnderscoredPropStruct,
)


class LeadingUnderscoredPropTests(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_field_is_present(self) -> None:
        instance = TestLeadingUnderscoredPropStruct(_leadingUnderscoreProp="hi")
        self.assertEqual(instance._leadingUnderscoreProp, "hi")

    def test_field_is_writable(self) -> None:
        instance = TestLeadingUnderscoredPropStruct(_leadingUnderscoreProp="hi")
        instance._leadingUnderscoreProp = "bye"
        self.assertEqual(instance._leadingUnderscoreProp, "bye")

    def test_dataclass_field_name_is_preserved(self) -> None:
        """The emitted dataclass must list the field under its original
        name with the leading underscore — not stripped, not renamed."""
        from dataclasses import fields
        names = [f.name for f in fields(TestLeadingUnderscoredPropStruct)]
        self.assertIn("_leadingUnderscoreProp", names)

    def test_equality_round_trip(self) -> None:
        a = TestLeadingUnderscoredPropStruct(_leadingUnderscoreProp="x")
        b = TestLeadingUnderscoredPropStruct(_leadingUnderscoreProp="x")
        c = TestLeadingUnderscoredPropStruct(_leadingUnderscoreProp="y")
        self.assertEqual(a, b)
        self.assertNotEqual(a, c)


if __name__ == "__main__":
    unittest.main()
