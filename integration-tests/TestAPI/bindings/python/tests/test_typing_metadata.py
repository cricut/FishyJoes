import os
import subprocess
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
PACKAGE_DIR = GENERATED_SRC / "testapi"
RUNTIME_SRC = Path(__file__).resolve().parents[5] / "python-runtime" / "src"
TYPECHECK_FIXTURE = Path(__file__).with_name("typecheck_generated_usage.py")
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class TypingMetadataTests(unittest.TestCase):
    def test_generated_package_includes_typing_metadata(self) -> None:
        self.assertTrue((PACKAGE_DIR / "py.typed").is_file())
        self.assertTrue((PACKAGE_DIR / "__init__.pyi").is_file())
        self.assertTrue((PACKAGE_DIR / "_exports.pyi").is_file())
        self.assertTrue((PACKAGE_DIR / "functions.pyi").is_file())
        self.assertTrue((PACKAGE_DIR / "reference_only_types__marker.pyi").is_file())
        self.assertTrue((PACKAGE_DIR / "simple_enum.pyi").is_file())

        init_stub = (PACKAGE_DIR / "__init__.pyi").read_text()
        self.assertIn("from .functions import Functions as Functions", init_stub)
        self.assertIn("from .reference_only_types__marker import ReferenceOnlyTypes_Marker as ReferenceOnlyTypes_Marker", init_stub)
        self.assertIn("from .simple_enum import SimpleEnum as SimpleEnum", init_stub)
        self.assertIn("ResultSuccess", init_stub)

        functions_stub = (PACKAGE_DIR / "functions.pyi").read_text()
        self.assertIn("class Functions", functions_stub)
        self.assertIn("def exercise0", functions_stub)

        enum_stub = (PACKAGE_DIR / "simple_enum.pyi").read_text()
        self.assertIn("class SimpleEnum", enum_stub)
        self.assertIn("green", enum_stub)

    def test_built_wheel_includes_typing_metadata(self) -> None:
        if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
            self.skipTest("wheel metadata is verified in installed-wheel CI runs")
        wheels = sorted((Path(__file__).resolve().parents[1] / "dist").glob("testapi-*.whl"))
        self.assertEqual(1, len(wheels), f"expected one generated testapi wheel, found {wheels}")
        with zipfile.ZipFile(wheels[0]) as archive:
            names = set(archive.namelist())
        self.assertIn("testapi/py.typed", names)
        self.assertIn("testapi/__init__.pyi", names)
        self.assertIn("testapi/_exports.pyi", names)
        self.assertIn("testapi/functions.pyi", names)

    def test_generated_stubs_use_metadata_driven_types(self) -> None:
        strings_stub = (PACKAGE_DIR / "strings.pyi").read_text()
        self.assertIn("simple: ClassVar[str]", strings_stub)
        self.assertIn("def echo(string: str) -> str: ...", strings_stub)

        bytes_stub = (PACKAGE_DIR / "bytes.pyi").read_text()
        self.assertIn("bytes: ClassVar[list[int]]", bytes_stub)
        self.assertIn("data: ClassVar[builtins.bytes]", bytes_stub)
        self.assertIn("def echo_data(data: builtins.bytes) -> builtins.bytes: ...", bytes_stub)

        collections_stub = (PACKAGE_DIR / "collections.pyi").read_text()
        self.assertIn("array_of_int: ClassVar[list[int]]", collections_stub)
        self.assertIn("maybe_array_of_maybe_int: ClassVar[list[int | None] | None]", collections_stub)
        self.assertIn(
            "def echo_dictionary_of_int_to_int(dictionary_of_int_to_int: dict[int, int]) -> dict[int, int]: ...",
            collections_stub,
        )

        async_stub = (PACKAGE_DIR / "async_functions.pyi").read_text()
        self.assertIn("const42: ClassVar[Callable[[], Awaitable[int]]]", async_stub)
        self.assertIn("def delayed_const(nanoseconds: int) -> Awaitable[int]: ...", async_stub)

    def test_all_integer_widths_have_precise_stub_types(self) -> None:
        # Every fixed-width integer must annotate as `int` in the stubs. A regression
        # that wires up a width's runtime conversion but forgets pythonType(for:) would
        # degrade it to `Any` here (silently, since `Any` still type-checks).
        primitives_stub = (PACKAGE_DIR / "primitives.pyi").read_text()
        for width in ("int8", "int16", "int64", "uint", "uint16", "uint32", "uint64"):
            self.assertIn(
                "def echo_%s(value: int) -> int: ..." % width,
                primitives_stub,
                "echo_%s is not typed as int (degraded to Any?)" % width,
            )

    def test_generated_package_type_checks_with_mypy(self) -> None:
        env = os.environ.copy()
        if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") == "1":
            env.pop("MYPYPATH", None)
        else:
            env["MYPYPATH"] = os.pathsep.join(
                [str(GENERATED_SRC), str(RUNTIME_SRC), env.get("MYPYPATH", "")]
            )
        env["PYTHONDONTWRITEBYTECODE"] = "1"
        with tempfile.TemporaryDirectory(prefix="fishyjoes-mypy-") as cache_dir:
            result = subprocess.run(
                [
                    sys.executable,
                    "-m",
                    "mypy",
                    "--strict",
                    "--show-error-codes",
                    "--no-error-summary",
                    "--cache-dir",
                    cache_dir,
                    str(TYPECHECK_FIXTURE),
                ],
                cwd=Path(__file__).resolve().parents[1],
                env=env,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                check=False,
            )

        self.assertEqual(
            0,
            result.returncode,
            "\n".join(
                [
                    "mypy failed for generated Python bindings.",
                    "Install test dependencies in bindings/python/.venv if mypy is missing.",
                    result.stdout,
                    result.stderr,
                ]
            ),
        )


if __name__ == "__main__":
    unittest.main()
