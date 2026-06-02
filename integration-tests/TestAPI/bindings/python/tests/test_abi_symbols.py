import importlib
import platform
import re
import subprocess
import sys
import unittest
from pathlib import Path


GENERATED = Path(__file__).resolve().parents[1] / "generated"
GENERATED_SRC = GENERATED / "src"
GENERATED_PACKAGE = GENERATED_SRC / "testapi"
RUNTIME_SOURCE = Path(__file__).resolve().parents[5] / "python-runtime" / "src" / "fishyjoes_runtime" / "iota.py"
sys.path.insert(0, str(GENERATED_SRC))


def exported_symbols(library: Path) -> set[str]:
    if platform.system() == "Darwin":
        command = ["nm", "-gU", str(library)]
    else:
        command = ["nm", "-D", "--defined-only", str(library)]
    output = subprocess.check_output(command, text=True)
    return {
        line.split()[-1].removeprefix("_")
        for line in output.splitlines()
        if line.split()
    }


class AbiSymbolTests(unittest.TestCase):
    def test_declarations_document_pointer_ownership_nullability_and_calling_convention(self) -> None:
        for header in ["_declarations.h", "_generated_declarations.h"]:
            declarations = (GENERATED_PACKAGE / header).read_text(encoding="utf-8")

            self.assertIn("calling-convention: cdecl", declarations)
            self.assertIn("nullability:", declarations)
            self.assertIn("ownership:", declarations)

            self.assertIn("foreignObject return values are created unless explicitly documented", declarations)
            self.assertIn("foreignObject parameters are borrowed unless explicitly documented", declarations)
            self.assertIn("foreignOutExn is nonnull and receives an optional created error object", declarations)

    def test_generated_bindings_reference_declared_exported_symbols(self) -> None:
        testapi = importlib.import_module("testapi")
        native = importlib.import_module("testapi._native")

        declarations = (
            (GENERATED_PACKAGE / "_declarations.h").read_text(encoding="utf-8")
            + "\n"
            + (GENERATED_PACKAGE / "_generated_declarations.h").read_text(encoding="utf-8")
        )
        iota_exports = exported_symbols(Path(native.diagnostics("testapi")["libraries"]["TestAPI-iota"]))

        bound_symbols: set[str] = set()
        for path in GENERATED_PACKAGE.glob("*.py"):
            if path.name == "_native.py":
                continue
            bound_symbols.update(re.findall(r'_native\.bind\("([^"]+)"\)', path.read_text(encoding="utf-8")))

        self.assertGreater(len(bound_symbols), 0)
        for symbol in sorted(bound_symbols):
            self.assertIn(symbol, declarations)
            self.assertIn(symbol, iota_exports)

        runtime_exports = exported_symbols(Path(native.diagnostics("testapi")["libraries"]["FishyJoesIotaRuntime"]))
        runtime_symbols = set(re.findall(r'_runtime_symbol\("([^"]+)"\)', RUNTIME_SOURCE.read_text(encoding="utf-8")))
        for symbol in sorted(runtime_symbols):
            self.assertIn(symbol, declarations)
            self.assertIn(symbol, runtime_exports)


if __name__ == "__main__":
    unittest.main()
