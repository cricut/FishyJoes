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
STUBTEST_ALLOWLIST = Path(__file__).with_name("stubtest_allowlist.txt")
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class TypingMetadataTests(unittest.TestCase):
    def checker_env(self) -> dict[str, str]:
        env = os.environ.copy()
        if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") == "1":
            env.pop("MYPYPATH", None)
        else:
            env["MYPYPATH"] = os.pathsep.join(
                [str(GENERATED_SRC), str(RUNTIME_SRC), env.get("MYPYPATH", "")]
            )
        env["PYTHONDONTWRITEBYTECODE"] = "1"
        return env

    def run_checker(self, name: str, command: list[str], env: dict[str, str] | None = None) -> subprocess.CompletedProcess[str]:
        result = subprocess.run(
            command,
            cwd=Path(__file__).resolve().parents[1],
            env=env or self.checker_env(),
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
                    f"{name} failed for generated Python bindings.",
                    "Install test dependencies in bindings/python/.venv if the checker is missing.",
                    result.stdout,
                    result.stderr,
                ]
            ),
        )
        return result

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
        # echo carries a docstring body, so the stub ends with `:` not `: ...`.
        self.assertIn("def echo(string: str) -> str:", strings_stub)

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

    def test_range_and_result_types_are_precise(self) -> None:
        # Range/ClosedRange/Result are marshalled correctly by the runtime, but the
        # typing path used to forget the switch (no pythonType(for:) case), degrading
        # every public Range/Result member to `Any`. They must surface the precise,
        # bound-parameterised runtime helper types instead.
        ranges_stub = (PACKAGE_DIR / "ranges.pyi").read_text()
        self.assertIn("int_range: ClassVar[SwiftRange[int]]", ranges_stub)
        self.assertIn(
            "def echo_int_range(range: SwiftRange[int]) -> SwiftRange[int]: ...",
            ranges_stub,
        )
        self.assertNotIn("Any", ranges_stub, "a Range member degraded to Any")

        closed_stub = (PACKAGE_DIR / "closed_ranges.pyi").read_text()
        self.assertIn("int_range: ClassVar[SwiftClosedRange[int]]", closed_stub)
        self.assertIn("double_range: ClassVar[SwiftClosedRange[float]]", closed_stub)
        self.assertIn("string_range: ClassVar[SwiftClosedRange[str]]", closed_stub)
        self.assertIn(
            "def echo_string_range(range: SwiftClosedRange[str]) -> SwiftClosedRange[str]: ...",
            closed_stub,
        )
        self.assertNotIn("Any", closed_stub, "a ClosedRange member degraded to Any")

        results_stub = (PACKAGE_DIR / "results.pyi").read_text()
        self.assertIn(
            "a_success: ClassVar[ResultSuccess[int] | ResultFailure[Results_Error]]",
            results_stub,
        )
        self.assertIn(
            "def process_result(result: ResultSuccess[str] | ResultFailure[Results_Error]) -> str: ...",
            results_stub,
        )

        # The bound need not be a primitive: a Range over an opaque runtime index
        # type must parameterise the helper with that type, not collapse to Any.
        attributed_stub = (PACKAGE_DIR / "attributed_strings.pyi").read_text()
        self.assertIn(
            "def full_range(string: Runtime_AttributedString) -> SwiftRange[Runtime_AttributedString_Index]: ...",
            attributed_stub,
        )

    def test_generated_package_type_checks_with_mypy(self) -> None:
        with tempfile.TemporaryDirectory(prefix="fishyjoes-mypy-") as cache_dir:
            self.run_checker(
                "mypy",
                [
                    sys.executable,
                    "-m",
                    "mypy",
                    "--strict",
                    "--python-version",
                    "3.11",
                    "--show-error-codes",
                    "--no-error-summary",
                    "--cache-dir",
                    cache_dir,
                    str(TYPECHECK_FIXTURE),
                ],
            )

    def test_generated_package_type_checks_with_pyright(self) -> None:
        self.run_checker(
            "pyright",
            [
                sys.executable,
                "-m",
                "pyright",
                "--pythonversion",
                "3.11",
                "--pythonpath",
                sys.executable,
                str(TYPECHECK_FIXTURE),
            ],
        )

    def test_public_packages_match_runtime_with_stubtest(self) -> None:
        self.run_checker(
            "mypy.stubtest",
            [
                sys.executable,
                "-m",
                "mypy.stubtest",
                "fishyjoes_runtime",
                "testapi",
                "--concise",
                "--allowlist",
                str(STUBTEST_ALLOWLIST),
                # Some allowlist entries are Python-version-specific (e.g. the
                # 3.13+ dataclass __replace__ on RuntimeConfig/RuntimeDependency);
                # tolerate them being unused on 3.11/3.12 rather than failing.
                "--ignore-unused-allowlist",
            ],
        )

    def test_generated_package_reports_complete_pyright_types(self) -> None:
        command = [
            sys.executable,
            "-m",
            "pyright",
            "--pythonversion",
            "3.11",
            "--pythonpath",
            sys.executable,
            "--verifytypes",
            "testapi",
            "--ignoreexternal",
        ]
        result = subprocess.run(
            command,
            cwd=Path(__file__).resolve().parents[1],
            env=self.checker_env(),
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            check=False,
        )
        if result.returncode != 0 and 'Package directory: ""' in result.stdout:
            self.skipTest(
                "pyright --verifytypes cannot resolve py.typed packages through the current pyright wrapper"
            )
        self.assertEqual(
            0,
            result.returncode,
            "\n".join(
                [
                    "pyright --verifytypes failed for generated Python bindings.",
                    result.stdout,
                    result.stderr,
                ]
            ),
        )
        self.assertIn(
            "Type completeness score: 100%",
            result.stdout,
            "\n".join(
                [
                    "pyright --verifytypes did not report full type completeness.",
                    result.stdout,
                    result.stderr,
                ]
            ),
        )


if __name__ == "__main__":
    unittest.main()
