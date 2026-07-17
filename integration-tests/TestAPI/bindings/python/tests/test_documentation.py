import importlib
import inspect
import unittest
from pathlib import Path

import testapi


class DocumentationTests(unittest.TestCase):
    def test_class_docstring_from_swift_documentation(self) -> None:
        doc = inspect.getdoc(testapi.Strings)

        self.assertIsNotNone(doc)
        self.assertIn("Sample strings and string operations", doc)

    def test_reference_class_docstring(self) -> None:
        doc = inspect.getdoc(testapi.EmptyClass1)

        self.assertIsNotNone(doc)
        self.assertIn("reference type with playful members", doc)

    def test_value_type_docstring(self) -> None:
        doc = inspect.getdoc(testapi.Structs_MemberwiseStruct)

        self.assertIsNotNone(doc)
        self.assertIn("one immutable and one mutable field", doc)

    def test_enum_docstring(self) -> None:
        doc = inspect.getdoc(testapi.SimpleEnum)

        self.assertIsNotNone(doc)
        self.assertIn("enum with no associated values", doc)

    def test_static_method_docstring(self) -> None:
        doc = inspect.getdoc(testapi.Strings.echo)

        self.assertIsNotNone(doc)
        self.assertIn("Returns the given string unchanged.", doc)

    def test_multiline_method_docstring(self) -> None:
        doc = inspect.getdoc(testapi.Strings.split)

        self.assertIsNotNone(doc)
        self.assertIn("Splits the string on each occurrence", doc)
        self.assertIn("pieces in order without the separator", doc)

    def test_instance_method_docstring(self) -> None:
        doc = inspect.getdoc(testapi.EmptyClass1.shme)

        self.assertIsNotNone(doc)
        self.assertIn("short pirate greeting", doc)

    def test_property_docstring(self) -> None:
        doc = inspect.getdoc(testapi.EmptyClass1.blarg)

        self.assertIsNotNone(doc)
        self.assertIn("cheerful nonsense string", doc)

    def test_deprecated_method_docstring(self) -> None:
        doc = inspect.getdoc(testapi.Deprecations.deprecated_method)

        self.assertIsNotNone(doc)
        self.assertIn("deprecation coverage", doc)

    def test_export_annotations_do_not_leak_into_docstrings(self) -> None:
        for documented in (
            testapi.Strings,
            testapi.EmptyClass1,
            testapi.Structs_MemberwiseStruct,
            testapi.SimpleEnum,
            testapi.Strings.echo,
            testapi.Strings.split,
        ):
            doc = inspect.getdoc(documented) or ""

            self.assertNotIn("<!--", doc)
            self.assertNotIn("FishyJoes.export", doc)

    def test_undocumented_symbols_have_no_docstring(self) -> None:
        # Gorpers carries only the export annotation in Swift, so no
        # docstring should be fabricated for it.
        doc = inspect.getdoc(testapi.EmptyClass1.gorpers)

        self.assertIsNone(doc)


class RuntimeTypingStubTests(unittest.TestCase):
    """Runtime value types must be precisely typed, never Any (R32)."""

    def setUp(self) -> None:
        testapi = importlib.import_module("testapi")
        self.package_dir = Path(testapi.__file__).resolve().parent

    def read_stub(self, name: str) -> str:
        return (self.package_dir / name).read_text(encoding="utf-8")

    def test_init_stub_reexports_value_types_instead_of_any(self) -> None:
        stub = self.read_stub("__init__.pyi")

        self.assertNotIn("SwiftRange: Any", stub)
        self.assertNotIn("ResultSuccess: Any", stub)
        self.assertIn("from ._native import", stub)
        self.assertIn("SwiftRange as SwiftRange", stub)

    def test_native_stub_types_swift_ranges(self) -> None:
        stub = self.read_stub("_native.pyi")

        # The runtime range types are generic over their bound so call sites
        # surface precise parameters (e.g. SwiftRange[int]); the stub mirrors
        # that, never degrading the bound to Any/object.
        self.assertIn("class SwiftRange(Generic[_BoundT]):", stub)
        self.assertIn("class SwiftClosedRange(Generic[_BoundT]):", stub)
        self.assertIn("lower_bound: _BoundT", stub)
        self.assertIn("upper_bound: _BoundT", stub)
        self.assertIn("@dataclass(frozen=True)", stub)

    def test_native_stub_types_result_types(self) -> None:
        stub = self.read_stub("_native.pyi")

        # Result helpers are generic over their success/failure payloads so the
        # union surfaced at call sites stays precise.
        self.assertIn("class ResultSuccess(Generic[_SuccessT]):", stub)
        self.assertIn("value: _SuccessT", stub)
        self.assertIn("class ResultFailure(Generic[_FailureT]):", stub)
        self.assertIn("error: _FailureT", stub)
        self.assertIn("def get_or_none(self)", stub)
        self.assertIn("def exception_or_none(self)", stub)

    def test_runtime_value_types_have_docstrings(self) -> None:
        # The dynamic classes created by create_runtime carry docstrings so
        # help() works on the re-exported value types.
        for value_type in (
            testapi.SwiftRange,
            testapi.SwiftClosedRange,
            testapi.ResultSuccess,
            testapi.ResultFailure,
        ):
            self.assertIsNotNone(inspect.getdoc(value_type))


class RuntimePackageDocumentationTests(unittest.TestCase):
    """The shared fishyjoes_runtime package documents its own public API."""

    def setUp(self) -> None:
        self.runtime = importlib.import_module("fishyjoes_runtime")

    def test_module_docstring(self) -> None:
        self.assertIsNotNone(inspect.getdoc(self.runtime))

    def test_config_class_docstrings(self) -> None:
        self.assertIsNotNone(inspect.getdoc(self.runtime.RuntimeConfig))
        self.assertIsNotNone(inspect.getdoc(self.runtime.RuntimeDependency))

    def test_create_runtime_docstring(self) -> None:
        doc = inspect.getdoc(self.runtime.create_runtime)

        self.assertIsNotNone(doc)


class StubDocumentationTests(unittest.TestCase):
    """Generated .pyi stubs carry the same documentation for IDE hover."""

    def setUp(self) -> None:
        testapi = importlib.import_module("testapi")
        self.package_dir = Path(testapi.__file__).resolve().parent

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

    def test_deprecated_static_attribute_marked_via_metaclass(self) -> None:
        # Plain attributes cannot carry @deprecated; deprecated static
        # properties are modeled as deprecated metaclass properties, which
        # pyright and mypy both honor for class-level attribute access.
        stub = self.read_stub("deprecations.pyi")

        self.assertIn("class _DeprecationsMeta(type):", stub)
        self.assertIn("def deprecated_variable(cls) -> int", stub)
        self.assertIn("class Deprecations(metaclass=_DeprecationsMeta):", stub)
        self.assertNotIn("deprecated_variable: ClassVar", stub)

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
