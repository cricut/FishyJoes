import importlib
import unittest


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

    def test_generated_classes_include_swift_origin_metadata(self) -> None:
        testapi = importlib.import_module("testapi")

        self.assertEqual(testapi.Strings.__fishyjoes_origin__["__type__"], "TestAPI.Strings")
        self.assertEqual(testapi.Strings.__fishyjoes_origin__["simple"], "TestAPI.Strings.simple")
        self.assertEqual(testapi.Strings.__fishyjoes_origin__["echo"], "TestAPI.Strings.echo")


if __name__ == "__main__":
    unittest.main()
