import unittest
from pathlib import Path


GENERATED_PACKAGE = Path(__file__).resolve().parents[1] / "generated" / "src" / "testapi"


class BindingStrategyTests(unittest.TestCase):
    def test_generated_wrappers_use_bound_callables_not_symbol_strings(self) -> None:
        self.assertTrue(
            GENERATED_PACKAGE.exists(),
            "Python generated package is missing. Run "
            "`FISHYJOES=1 ../../.build/debug/fishy-joes --python build` "
            "from integration-tests/TestAPI first.",
        )

        offenders: list[str] = []
        for path in sorted(GENERATED_PACKAGE.glob("*.py")):
            if path.name.startswith("_"):
                continue
            contents = path.read_text(encoding="utf-8")
            if "_native.symbol(" in contents or "_native.invoke(" in contents:
                offenders.append(path.name)

        self.assertEqual([], offenders)


if __name__ == "__main__":
    unittest.main()
