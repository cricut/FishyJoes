import importlib
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"


class ImportSetupTests(unittest.TestCase):
    def test_generated_testapi_package_imports_after_python_build(self) -> None:
        if not GENERATED_SRC.exists():
            self.fail(
                "Python generated package is missing. Run "
                "`FISHYJOES=1 ../../.build/debug/fishy-joes --python build` "
                "from integration-tests/TestAPI first."
            )

        sys.path.insert(0, str(GENERATED_SRC))
        try:
            module = importlib.import_module("testapi")
        except ModuleNotFoundError as error:
            self.fail(
                "Could not import generated Python package `testapi`. Run "
                "`FISHYJOES=1 ../../.build/debug/fishy-joes --python build` "
                f"from integration-tests/TestAPI first. Import error: {error}"
            )

        self.assertTrue(
            getattr(module, "SUPPORTED", False),
            "Generated Python package imported but did not confirm real runtime support.",
        )


if __name__ == "__main__":
    unittest.main()
