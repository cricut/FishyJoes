import importlib
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class DiagnosticsTests(unittest.TestCase):
    def test_package_diagnostics_reports_runtime_and_native_libraries(self) -> None:
        testapi = importlib.import_module("testapi")

        info = testapi.diagnostics()

        self.assertEqual(info["package"], "testapi")
        self.assertEqual(info["package_version"], "0.0.1")
        self.assertTrue(info["supported"])
        self.assertEqual(info["iota_abi_version"], "1")
        self.assertIn("python", info)
        self.assertIn("platform", info)
        self.assertIn("platform_tag", info)
        self.assertEqual(info["runtime"]["package"], "fishyjoes-runtime")
        self.assertEqual(info["runtime"]["version"], "0.0.1")
        self.assertEqual(info["runtime"]["required"], ">=0.0.1")
        self.assertEqual(info["dependencies"], {})
        self.assertIn("libraries", info)
        self.assertIn("FishyJoesIotaRuntime", info["libraries"])
        self.assertIn("TestAPI", info["libraries"])
        self.assertIn("TestAPI-iota", info["libraries"])
        for path in info["libraries"].values():
            self.assertTrue(Path(path).is_file(), path)

    def test_generated_package_has_dedicated_diagnostics_module(self) -> None:
        diagnostics_source = GENERATED_SRC / "testapi" / "_diagnostics.py"
        init_source = GENERATED_SRC / "testapi" / "__init__.py"

        self.assertTrue(diagnostics_source.is_file(), "generated diagnostics module is missing")
        self.assertIn("def diagnostics", diagnostics_source.read_text(encoding="utf-8"))
        self.assertIn("from ._diagnostics import diagnostics", init_source.read_text(encoding="utf-8"))

    def test_generated_classes_include_swift_origin_metadata(self) -> None:
        testapi = importlib.import_module("testapi")

        self.assertEqual(testapi.Strings.__fishyjoes_origin__["__type__"], "TestAPI.Strings")
        self.assertEqual(testapi.Strings.__fishyjoes_origin__["simple"], "TestAPI.Strings.simple")
        self.assertEqual(testapi.Strings.__fishyjoes_origin__["echo"], "TestAPI.Strings.echo")


if __name__ == "__main__":
    unittest.main()
