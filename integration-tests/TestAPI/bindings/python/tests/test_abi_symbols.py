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
GENERATED_DECLARATIONS = GENERATED_PACKAGE / "_generated_declarations.h"
RUNTIME_PACKAGE = Path(__file__).resolve().parents[5] / "python-runtime" / "src" / "fishyjoes_runtime"
RUNTIME_SOURCE = RUNTIME_PACKAGE / "iota.py"
RUNTIME_DECLARATIONS = RUNTIME_PACKAGE / "_declarations.h"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


def runtime_declared_symbols() -> set[str]:
    """C runtime functions the Python runtime package actually calls.

    Three usage patterns reach the shared FishyJoesIotaRuntime library: the
    ``_runtime_symbol("X")`` string literals used by the attributed-string
    marshalling, direct cffi attribute access ``runtime_lib.X`` in the
    marshalling core, and dynamic ``getattr(runtime_lib, f"...")`` templates
    expanded over the opaque reference-type table. All three name the C symbol
    directly, so all three must be declared in the cffi headers and present in
    the runtime's export table. Collecting them from every module keeps the
    check honest as the runtime grows. (``getattr(runtime_lib, name)`` inside
    the ``_runtime_symbol`` helper is dispatch plumbing, not a usage site; the
    literals it forwards are already captured by the first pattern.)
    """
    symbols: set[str] = set()
    for module in sorted(RUNTIME_PACKAGE.glob("*.py")):
        source = module.read_text(encoding="utf-8")
        symbols.update(re.findall(r'_runtime_symbol\("([^"]+)"\)', source))
        symbols.update(re.findall(r"\bruntime_lib\.([A-Za-z_][A-Za-z0-9_]*)", source))
        symbols.update(expanded_dynamic_runtime_symbols(source))
    return symbols


def expanded_dynamic_runtime_symbols(source: str) -> set[str]:
    """Concrete C symbols reached via ``getattr(runtime_lib, f"...")`` templates.

    The attributed-string module resolves its opaque reference-type setup
    functions dynamically -- ``getattr(runtime_lib, f"Foundation_{type_name}_setup")``
    iterating the keys of its ``_opaque_runtime_references`` table -- so no
    string literal ever names those setups. Expand each template against the
    table's keys so the forward check covers them too. A template this expansion
    cannot resolve is an error: failing loudly when the pattern is renamed beats
    silently dropping coverage.
    """
    templates = re.findall(r'getattr\(runtime_lib,\s*f"([^"]+)"\)', source)
    if not templates:
        return set()
    table = re.search(r"_opaque_runtime_references\s*=\s*\{(.*?)\}", source, flags=re.DOTALL)
    keys = re.findall(r'"([A-Za-z_][A-Za-z0-9_]*)"\s*:', table.group(1)) if table else []
    symbols: set[str] = set()
    for template in templates:
        if set(re.findall(r"\{([^{}]*)\}", template)) != {"type_name"} or not keys:
            raise AssertionError(
                f"Cannot expand dynamic runtime symbol template {template!r}; "
                "update expanded_dynamic_runtime_symbols() to cover the new pattern"
            )
        symbols.update(template.replace("{type_name}", key) for key in keys)
    return symbols


def declared_function_names(header: Path) -> set[str]:
    """Function names declared as plain C prototypes in a cffi header.

    The headers are the cffi cdef bodies: simple typedefs, callback function
    typedefs, and function prototypes, with no preprocessor directives. Callback
    typedefs (``typedef ret (*Name)(...)``) are declarations of function-pointer
    types, not exported functions, so they are excluded; only the real
    prototypes name symbols the dynamic linker must resolve. Prototypes may span
    multiple lines and always end in ``;``. Both comment styles are stripped so
    a commented-out prototype can never register as a declaration.
    """
    text = re.sub(r"/\*.*?\*/", "", header.read_text(encoding="utf-8"), flags=re.DOTALL)
    text = re.sub(r"//[^\n]*", "", text)
    names: set[str] = set()
    for statement in text.split(";"):
        statement = statement.strip()
        if not statement or statement.startswith("typedef"):
            continue
        match = re.search(r"([A-Za-z_][A-Za-z0-9_]*)\s*\(", statement)
        if match is not None:
            names.add(match.group(1))
    return names


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
        for header in [RUNTIME_DECLARATIONS, GENERATED_DECLARATIONS]:
            declarations = header.read_text(encoding="utf-8")

            self.assertIn("calling-convention: cdecl", declarations)
            self.assertIn("nullability:", declarations)
            self.assertIn("ownership:", declarations)

            self.assertIn("foreignObject return values are created unless explicitly documented", declarations)
            self.assertIn("foreignObject parameters are borrowed unless explicitly documented", declarations)
            self.assertIn("foreignOutExn is nonnull and receives an optional created error object", declarations)

    def test_utf8_string_callbacks_use_pointer_width_lengths(self) -> None:
        declarations = RUNTIME_DECLARATIONS.read_text(encoding="utf-8")
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
            RUNTIME_DECLARATIONS.read_text(encoding="utf-8")
            + "\n"
            + GENERATED_DECLARATIONS.read_text(encoding="utf-8")
        )
        libraries = native.diagnostics("testapi")["libraries"]
        iota_exports = exported_symbols(Path(libraries["TestAPI-iota"]))

        bound_symbols: set[str] = set()
        for path in GENERATED_PACKAGE.glob("*.py"):
            if path.name == "_native.py":
                continue
            bound_symbols.update(re.findall(r'_native\.bind\("([^"]+)"\)', path.read_text(encoding="utf-8")))

        self.assertGreater(len(bound_symbols), 0)
        for symbol in sorted(bound_symbols):
            self.assertIn(symbol, declarations)
            self.assertIn(symbol, iota_exports)

        runtime_exports = exported_symbols(Path(libraries["FishyJoesIotaRuntime"]))
        runtime_symbols = runtime_declared_symbols()
        self.assertGreater(len(runtime_symbols), 0)
        for symbol in sorted(runtime_symbols):
            self.assertIn(
                symbol,
                declarations,
                f"{symbol} is used by the runtime package but not declared in the cffi headers",
            )
            self.assertIn(
                symbol,
                runtime_exports,
                f"{symbol} is used by the runtime package but not exported by FishyJoesIotaRuntime",
            )

    def test_declared_symbols_exist_in_their_exporting_library(self) -> None:
        native = importlib.import_module("testapi._native")
        libraries = native.diagnostics("testapi")["libraries"]

        # Every function declared in the shared runtime header must be exported by
        # the FishyJoesIotaRuntime library; every function declared in the
        # generated per-module header must be exported by the module's iota
        # library (which also carries FishyJoes_TestAPI_registerTypes). This is the
        # reverse of the forward check: it catches declarations that no longer
        # match a real export, such as a stale or misspelled prototype.
        runtime_declared = declared_function_names(RUNTIME_DECLARATIONS)
        generated_declared = declared_function_names(GENERATED_DECLARATIONS)
        self.assertGreater(len(runtime_declared), 0)
        self.assertGreater(len(generated_declared), 0)

        runtime_exports = exported_symbols(Path(libraries["FishyJoesIotaRuntime"]))
        for symbol in sorted(runtime_declared):
            self.assertIn(
                symbol,
                runtime_exports,
                f"{symbol} is declared in _declarations.h but not exported by FishyJoesIotaRuntime",
            )

        iota_exports = exported_symbols(Path(libraries["TestAPI-iota"]))
        for symbol in sorted(generated_declared):
            self.assertIn(
                symbol,
                iota_exports,
                f"{symbol} is declared in _generated_declarations.h but not exported by TestAPI-iota",
            )


if __name__ == "__main__":
    unittest.main()
