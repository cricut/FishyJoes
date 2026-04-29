"""Shared helpers used by generated Python runtime templates."""

from __future__ import annotations

import ctypes
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
TEMPLATE_RUNTIME = (
    ROOT
    / "Sources"
    / "FishyJoesExecute"
    / "Resources"
    / "bindings-template"
    / "python"
    / "__TEMPLATE__"
    / "src"
    / "cricut___LOWERCASE_MODULE_NAME__"
    / "runtime.py"
)


class GeneratedRuntimeHelperTests(unittest.TestCase):
    def test_generic_argument_helpers_are_shared(self) -> None:
        from fishyjoes_python.generated_runtime import (
            function_returns_future,
            generic_arguments,
        )

        self.assertEqual(
            generic_arguments(
                "Function2Converter<Swift.Int, ArrayConverter<Swift.String>, FutureConverter<Swift.Bool>>"
            ),
            [
                "Swift.Int",
                "ArrayConverter<Swift.String>",
                "FutureConverter<Swift.Bool>",
            ],
        )
        self.assertTrue(
            function_returns_future(
                "Function1Converter<Swift.Int, FutureConverter<Swift.Bool>>"
            )
        )
        self.assertFalse(function_returns_future("Function1Converter<Swift.Int, Swift.Bool>"))

    def test_ffi_type_helpers_are_shared(self) -> None:
        from fishyjoes_python.generated_runtime import (
            ffi_ctypes_type,
            ffi_default_value,
        )

        self.assertIs(ffi_ctypes_type("int"), ctypes.c_ssize_t)
        self.assertIs(ffi_ctypes_type("object"), ctypes.c_void_p)
        self.assertEqual(ffi_default_value("double"), 0.0)
        self.assertEqual(ffi_default_value("object"), 0)

    def test_generated_template_imports_shared_helpers(self) -> None:
        source = TEMPLATE_RUNTIME.read_text()
        self.assertIn("from fishyjoes_python.generated_runtime import", source)
        self.assertNotIn("def _generic_arguments(", source)
        self.assertNotIn("def _ffi_ctypes_type(", source)


if __name__ == "__main__":
    unittest.main()
