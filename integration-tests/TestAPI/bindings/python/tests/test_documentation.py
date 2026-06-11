import importlib
import inspect
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class DocumentationTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_class_docstring_from_swift_documentation(self) -> None:
        doc = inspect.getdoc(self.testapi.Strings)

        self.assertIsNotNone(doc)
        self.assertIn("Sample strings and string operations", doc)

    def test_reference_class_docstring(self) -> None:
        doc = inspect.getdoc(self.testapi.EmptyClass1)

        self.assertIsNotNone(doc)
        self.assertIn("reference type with playful members", doc)

    def test_value_type_docstring(self) -> None:
        doc = inspect.getdoc(self.testapi.Structs_MemberwiseStruct)

        self.assertIsNotNone(doc)
        self.assertIn("one immutable and one mutable field", doc)

    def test_enum_docstring(self) -> None:
        doc = inspect.getdoc(self.testapi.SimpleEnum)

        self.assertIsNotNone(doc)
        self.assertIn("enum with no associated values", doc)

    def test_static_method_docstring(self) -> None:
        doc = inspect.getdoc(self.testapi.Strings.echo)

        self.assertIsNotNone(doc)
        self.assertIn("Returns the given string unchanged.", doc)

    def test_multiline_method_docstring(self) -> None:
        doc = inspect.getdoc(self.testapi.Strings.split)

        self.assertIsNotNone(doc)
        self.assertIn("Splits the string on each occurrence", doc)
        self.assertIn("pieces in order without the separator", doc)

    def test_instance_method_docstring(self) -> None:
        doc = inspect.getdoc(self.testapi.EmptyClass1.shme)

        self.assertIsNotNone(doc)
        self.assertIn("short pirate greeting", doc)

    def test_property_docstring(self) -> None:
        doc = inspect.getdoc(self.testapi.EmptyClass1.blarg)

        self.assertIsNotNone(doc)
        self.assertIn("cheerful nonsense string", doc)

    def test_deprecated_method_docstring(self) -> None:
        doc = inspect.getdoc(self.testapi.Deprecations.deprecated_method)

        self.assertIsNotNone(doc)
        self.assertIn("deprecation coverage", doc)

    def test_export_annotations_do_not_leak_into_docstrings(self) -> None:
        for documented in (
            self.testapi.Strings,
            self.testapi.EmptyClass1,
            self.testapi.Structs_MemberwiseStruct,
            self.testapi.SimpleEnum,
            self.testapi.Strings.echo,
            self.testapi.Strings.split,
        ):
            doc = inspect.getdoc(documented) or ""

            self.assertNotIn("<!--", doc)
            self.assertNotIn("FishyJoes.export", doc)

    def test_undocumented_symbols_have_no_docstring(self) -> None:
        # Gorpers carries only the export annotation in Swift, so no
        # docstring should be fabricated for it.
        doc = inspect.getdoc(self.testapi.EmptyClass1.gorpers)

        self.assertIsNone(doc)


if __name__ == "__main__":
    unittest.main()
