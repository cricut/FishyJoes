import importlib
import shutil
import platform
import re
import subprocess
import os
import sys
import unittest
from pathlib import Path


GENERATED = Path(__file__).resolve().parents[1] / "generated"
GENERATED_SRC = GENERATED / "src"
GENERATED_PACKAGE = GENERATED_SRC / "testapi"
RUNTIME_SOURCE = Path(__file__).resolve().parents[5] / "python-runtime" / "src" / "fishyjoes_runtime" / "iota.py"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


def exported_symbols(library: Path) -> set[str]:
    if platform.system() == "Darwin":
        command = ["nm", "-gU", str(library)]
    elif platform.system() == "Windows":
        return exported_windows_symbols(library)
    else:
        command = ["nm", "-D", "--defined-only", str(library)]
    output = subprocess.check_output(command, text=True)
    strip_prefix = platform.system() == "Darwin"
    return {
        line.split()[-1].removeprefix("_") if strip_prefix else line.split()[-1]
        for line in output.splitlines()
        if line.split()
    }


def exported_windows_symbols(library: Path) -> set[str]:
    dumpbin = shutil.which("dumpbin")
    if dumpbin is not None:
        return exported_windows_symbols_from_dumpbin(dumpbin, library)

    llvm_readobj = shutil.which("llvm-readobj")
    if llvm_readobj is not None:
        return exported_windows_symbols_from_llvm_readobj(llvm_readobj, library)

    raise unittest.SkipTest("No Windows PE export reader found; expected dumpbin or llvm-readobj")


def exported_windows_symbols_from_dumpbin(dumpbin: str, library: Path) -> set[str]:
    output = subprocess.check_output([dumpbin, "/EXPORTS", str(library)], text=True, errors="replace")
    symbols: set[str] = set()
    in_exports = False
    for line in output.splitlines():
        if "ordinal" in line and "hint" in line and "RVA" in line and "name" in line:
            in_exports = True
            continue
        if not in_exports:
            continue
        fields = line.split()
        if len(fields) >= 4 and fields[0].isdigit():
            symbols.add(fields[3])
    return symbols


def exported_windows_symbols_from_llvm_readobj(llvm_readobj: str, library: Path) -> set[str]:
    output = subprocess.check_output(
        [llvm_readobj, "--coff-exports", str(library)],
        text=True,
        errors="replace",
    )
    return {
        line.split(":", 1)[1].strip()
        for line in output.splitlines()
        if line.strip().startswith("Name:")
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

    def test_utf8_string_callbacks_use_pointer_width_lengths(self) -> None:
        declarations = (GENERATED_PACKAGE / "_declarations.h").read_text(encoding="utf-8")
        runtime_source = RUNTIME_SOURCE.read_text(encoding="utf-8")

        self.assertIn("typedef intptr_t (*FishyJoes_StringUtf8LengthFn)", declarations)
        self.assertIn(
            "typedef foreignObject (*FishyJoes_StringUtf8ConstructorFn)(const char *bytes, intptr_t length",
            declarations,
        )
        self.assertIn('@ffi.callback("intptr_t(foreignObject, foreignOutExn)")', runtime_source)
        self.assertIn('@ffi.callback("foreignObject(const char *, intptr_t, foreignOutExn)")', runtime_source)
        self.assertNotIn("typedef int (*FishyJoes_StringUtf8LengthFn)", declarations)
        self.assertNotIn("const char *bytes, int length", declarations)

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
