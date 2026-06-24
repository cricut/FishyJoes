import importlib
import os
import sys
from pathlib import Path
import unittest


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class GeneratorRobustnessTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_member_referencing_unexported_type_is_skipped_not_crashed(self) -> None:
        # A member whose signature references a non-exported type must be skipped
        # (with a build warning), while sibling members still generate. Previously
        # such a member aborted the whole generation with a fatalError in resolve.
        host = self.testapi.SkippedMemberHost

        # Sibling member referencing only exported types is present and works.
        self.assertEqual(host.echo_int(7), 7)

        # Members referencing the non-exported type were dropped, not emitted.
        self.assertFalse(hasattr(host, "make_unexported"))
        self.assertFalse(hasattr(host, "consume_unexported"))
        self.assertFalse(hasattr(host, "unexported_property"))

        # The unexported type itself is not part of the public package surface.
        self.assertFalse(hasattr(self.testapi, "UnexportedReferencedType"))

    def test_generated_type_descriptors_use_swift_origin_keys(self) -> None:
        reference_case_enum = GENERATED_SRC / "testapi" / "reference_case_enum.py"
        source = reference_case_enum.read_text()

        self.assertIn('_native.ValueType("TestAPI.ReferenceCaseEnum")', source)
        self.assertNotIn('_native.ValueType("ReferenceCaseEnum")', source)


if __name__ == "__main__":
    unittest.main()
