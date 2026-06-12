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


class StubDocumentationTests(unittest.TestCase):
    """Generated .pyi stubs carry the same documentation for IDE hover."""

    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")
        self.package_dir = Path(self.testapi.__file__).resolve().parent

    def read_stub(self, name: str) -> str:
        return (self.package_dir / name).read_text(encoding="utf-8")

    def test_class_docstring_in_stub(self) -> None:
        stub = self.read_stub("strings.pyi")

        self.assertIn(
            '"""Sample strings and string operations for Unicode round-trips."""',
            stub,
        )

    def test_method_docstring_in_stub(self) -> None:
        stub = self.read_stub("strings.pyi")

        self.assertIn('"""Returns the given string unchanged."""', stub)

    def test_class_attribute_docstring_in_stub(self) -> None:
        stub = self.read_stub("strings.pyi")

        self.assertIn("simple: ClassVar[str]", stub)
        self.assertIn('"""A simple ASCII greeting."""', stub)

    def test_property_docstring_in_stub(self) -> None:
        stub = self.read_stub("empty_class1.pyi")

        self.assertIn('"""A cheerful nonsense string."""', stub)

    def test_enum_case_docstring_in_stub(self) -> None:
        stub = self.read_stub("simple_enum.pyi")

        self.assertIn('"""red is a nice color"""', stub)

    def test_deprecated_method_marked_in_stub(self) -> None:
        stub = self.read_stub("deprecations.pyi")

        self.assertIn("from typing_extensions import deprecated", stub)
        self.assertIn('@deprecated("don\'t use this")', stub)

    def test_undeprecated_stub_has_no_typing_extensions_import(self) -> None:
        stub = self.read_stub("strings.pyi")

        self.assertNotIn("typing_extensions", stub)

    def test_undocumented_stub_symbols_stay_bare(self) -> None:
        stub = self.read_stub("empty_class1.pyi")

        self.assertIn("def gorpers(self) -> str: ...", stub)

    def test_annotations_do_not_leak_into_stubs(self) -> None:
        for name in ("strings.pyi", "empty_class1.pyi", "simple_enum.pyi"):
            stub = self.read_stub(name)

            self.assertNotIn("<!--", stub)
            self.assertNotIn("FishyJoes.export", stub)


if __name__ == "__main__":
    unittest.main()
