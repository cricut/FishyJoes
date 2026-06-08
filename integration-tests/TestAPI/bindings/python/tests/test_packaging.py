import json
import os
import shutil
import subprocess
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path


PYTHON_BINDINGS = Path(__file__).resolve().parents[1]
REPO_ROOT = Path(__file__).resolve().parents[5]
TEST_API_ROOT = Path(__file__).resolve().parents[3]
PYTHON_RUNTIME = REPO_ROOT / "python-runtime"
GENERATED_PACKAGE = PYTHON_BINDINGS / "generated"
DIST_DIR = PYTHON_BINDINGS / "dist"
MACOS_DEPLOYMENT_TARGET = "13.0"


def native_library_name(name: str) -> str:
    if sys.platform == "darwin":
        return f"lib{name}.dylib"
    if sys.platform.startswith("linux"):
        return f"lib{name}.so"
    if sys.platform == "win32":
        return f"{name}.dll"
    raise RuntimeError(f"Unsupported test platform: {sys.platform}")


def built_runtime_library() -> Path:
    candidates = sorted((TEST_API_ROOT / ".build" / "bindings").glob(
        f"*/release/{native_library_name('FishyJoesIotaRuntime')}"
    ))
    if not candidates:
        raise AssertionError("Missing built FishyJoesIotaRuntime library; run FishyJoes Python build first")
    return candidates[0]


def wheel_build_env() -> dict[str, str]:
    env = os.environ.copy()
    if sys.platform == "darwin":
        env["MACOSX_DEPLOYMENT_TARGET"] = MACOS_DEPLOYMENT_TARGET
    return env


def assert_honest_macos_wheel_tag(
    testcase: unittest.TestCase,
    wheel_path: Path,
    wheel_text: str,
    wheel_metadata: str | None = None,
) -> None:
    if sys.platform != "darwin":
        return

    expected = f"macosx_{MACOS_DEPLOYMENT_TARGET.replace('.', '_')}"
    testcase.assertIn(expected, wheel_path.name)
    testcase.assertIn(expected, wheel_text)
    if wheel_metadata is not None:
        testcase.assertIn(expected, json.loads(wheel_metadata)["platform_tag"])


class PackagingTests(unittest.TestCase):
    def test_generated_python_workflow_declares_release_compatibility_matrix(self) -> None:
        workflow = TEST_API_ROOT / ".github" / "workflows" / "GENERATED-python.yaml"
        self.assertTrue(workflow.is_file(), f"missing generated Python workflow at {workflow}")

        contents = workflow.read_text()
        for python_version in ["3.11"]:
            self.assertIn(f"- '{python_version}'", contents)
        self.assertIn("runs-on: macos-26", contents)
        self.assertIn("runs-on: ubuntu-22.04", contents)
        self.assertIn("runs-on: windows-2025", contents)
        self.assertEqual(contents.count('version_args=(--version "$version")'), 3)
        self.assertIn("install-system-dependencies for-generation", contents)
        self.assertIn('swift run -- fishy-joes --python --fat "${version_args[@]}" generate build test pack', contents)
        self.assertIn('swift run -- fishy-joes --python "${version_args[@]}" generate build test pack', contents)
        self.assertIn('"$SWIFT_WINDOWS_BASH" run -- fishy-joes --python "${version_args[@]}" build test pack', contents)
        self.assertEqual(contents.count("Build FishyJoes Python runtime wheel"), 3)
        self.assertEqual(contents.count("--native-library \"$runtime_native_library\""), 3)
        self.assertEqual(contents.count('--distribution-name "fishyjoes-runtime"'), 3)
        self.assertEqual(contents.count('"$venv_python" -m pip install -r bindings/python/requirements-dev.txt'), 6)
        self.assertEqual(contents.count('"$venv_python" "$runtime_dir/_build_wheel.py"'), 3)
        self.assertEqual(contents.count('runtime_version_args=(--version-override "$version")'), 3)
        self.assertEqual(contents.count('"${runtime_version_args[@]}"'), 3)
        self.assertEqual(contents.count("Verify clean wheel install"), 3)
        self.assertEqual(contents.count("FISHYJOES_TEST_INSTALLED_WHEEL=1"), 6)
        self.assertIn("pip install --no-index --find-links bindings/python/dist bindings/python/dist/*.whl", contents)
        self.assertIn("import testapi as package; assert package.SUPPORTED", contents)
        self.assertEqual(
            contents.count('FISHYJOES_TEST_INSTALLED_WHEEL=1 PYTHONPATH= "$venv_python" -m unittest discover -v -s bindings/python/tests'),
            3,
        )
        self.assertEqual(contents.count("Verify native wheel repair"), 3)
        self.assertIn("native-repair-report-darwin.txt", contents)
        self.assertIn("native-repair-report-linux.txt", contents)
        self.assertIn("native-repair-report-windows.txt", contents)
        self.assertEqual(contents.count("Upload native repair report"), 3)

    def test_root_python_workflow_runs_release_compatibility_matrix(self) -> None:
        workflow = REPO_ROOT / ".github" / "workflows" / "python-bindings.yaml"
        self.assertTrue(workflow.is_file(), f"missing root Python workflow at {workflow}")

        contents = workflow.read_text()
        for python_version in ["3.11"]:
            self.assertIn(f'- "{python_version}"', contents)
        self.assertIn("runs-on: macos-26", contents)
        self.assertIn("runs-on: ubuntu-22.04", contents)
        self.assertIn("runs-on: windows-2025", contents)
        self.assertIn("cd integration-tests/TestAPI", contents)
        self.assertIn("swift run -- fishy-joes --python --fat generate build test pack", contents)
        self.assertIn("install-system-dependencies for-generation", contents)
        self.assertIn("swift run -- fishy-joes --python generate build test pack", contents)
        self.assertIn('"$SWIFT_WINDOWS_BASH" run -- fishy-joes --python build test pack', contents)
        self.assertEqual(contents.count("Verify clean wheel install"), 3)
        self.assertEqual(contents.count("FISHYJOES_TEST_INSTALLED_WHEEL=1"), 6)
        self.assertEqual(
            contents.count('FISHYJOES_TEST_INSTALLED_WHEEL=1 PYTHONPATH= "$venv_python" -m unittest discover -v -s bindings/python/tests'),
            3,
        )
        self.assertEqual(contents.count("--native-library \"$runtime_native_library\""), 3)
        self.assertEqual(contents.count('"$venv_python" python-runtime/_build_wheel.py'), 3)
        self.assertEqual(contents.count('"$venv_python" -m pip install -r integration-tests/TestAPI/bindings/python/requirements-dev.txt'), 3)
        self.assertEqual(contents.count("Verify native wheel repair"), 3)

    def test_pack_builds_installable_platform_wheel(self) -> None:
        shutil.rmtree(DIST_DIR, ignore_errors=True)

        result = subprocess.run(
            [sys.executable, str(GENERATED_PACKAGE / "_build_wheel.py"), "--outdir", str(DIST_DIR)],
            cwd=GENERATED_PACKAGE,
            env=wheel_build_env(),
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        self.assertEqual(result.returncode, 0, result.stdout)

        wheels = sorted(DIST_DIR.glob("testapi-0.0.1-py3-none-*.whl"))
        self.assertEqual(len(wheels), 1, [path.name for path in DIST_DIR.glob("*.whl")])

        with zipfile.ZipFile(wheels[0]) as archive:
            metadata = archive.read("testapi-0.0.1.dist-info/METADATA").decode("utf-8")
            wheel = archive.read("testapi-0.0.1.dist-info/WHEEL").decode("utf-8")
            wheel_metadata = archive.read("testapi/__fishyjoes_wheel.json").decode("utf-8")
        self.assertIn("Requires-Python: >=3.11", metadata)
        self.assertIn("Requires-Dist: fishyjoes-runtime>=0.0.1", metadata)
        self.assertIn("Root-Is-Purelib: false", wheel)
        self.assertIn("Tag: py3-none-", wheel)
        self.assertIn('"python_requirement": ">=3.11"', wheel_metadata)
        self.assertIn('"platform_tag":', wheel_metadata)
        assert_honest_macos_wheel_tag(self, wheels[0], wheel, wheel_metadata)
        self.assertTrue(list(DIST_DIR.glob("native-repair-report-*.txt")))

        with tempfile.TemporaryDirectory() as target:
            install = subprocess.run(
                [sys.executable, "-m", "pip", "install", "--no-deps", "--target", target, str(wheels[0])],
                text=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                check=False,
            )
            self.assertEqual(install.returncode, 0, install.stdout)
            self.assertTrue((Path(target) / "testapi" / "__init__.py").is_file())

    def test_generated_wheel_installs_with_shared_runtime_wheel(self) -> None:
        shutil.rmtree(DIST_DIR, ignore_errors=True)

        generated = subprocess.run(
            [sys.executable, str(GENERATED_PACKAGE / "_build_wheel.py"), "--outdir", str(DIST_DIR)],
            cwd=GENERATED_PACKAGE,
            env=wheel_build_env(),
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        self.assertEqual(generated.returncode, 0, generated.stdout)

        runtime = subprocess.run(
            [
                sys.executable,
                str(PYTHON_RUNTIME / "_build_wheel.py"),
                "--outdir",
                str(DIST_DIR),
                "--native-library",
                str(built_runtime_library()),
                "--version-override",
                "1.2.3",
            ],
            cwd=PYTHON_RUNTIME,
            env=wheel_build_env(),
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        self.assertEqual(runtime.returncode, 0, runtime.stdout)

        wheels = sorted(DIST_DIR.glob("testapi-0.0.1-py3-none-*.whl"))
        self.assertEqual(len(wheels), 1, [path.name for path in DIST_DIR.glob("*.whl")])
        runtime_wheels = sorted(DIST_DIR.glob("fishyjoes_runtime-1.2.3-py3-none-*.whl"))
        self.assertEqual(len(runtime_wheels), 1, [path.name for path in DIST_DIR.glob("*.whl")])

        with zipfile.ZipFile(runtime_wheels[0]) as archive:
            runtime_metadata = archive.read("fishyjoes_runtime-1.2.3.dist-info/METADATA").decode("utf-8")
            runtime_wheel = archive.read("fishyjoes_runtime-1.2.3.dist-info/WHEEL").decode("utf-8")
            runtime_config = archive.read("fishyjoes_runtime/config.py").decode("utf-8")
            self.assertIn("fishyjoes_runtime/py.typed", archive.namelist())
            self.assertIn(f"fishyjoes_runtime/native/{native_library_name('FishyJoesIotaRuntime')}", archive.namelist())
        self.assertIn("Name: fishyjoes-runtime", runtime_metadata)
        self.assertIn("Version: 1.2.3", runtime_metadata)
        self.assertIn("Summary: Python-side FishyJoes binding layer for the shared Iota ABI", runtime_metadata)
        self.assertIn("Requires-Python: >=3.11", runtime_metadata)
        self.assertIn("Requires-Dist: cffi", runtime_metadata)
        self.assertIn("Requires-Dist: packaging", runtime_metadata)
        self.assertIn("Root-Is-Purelib: false", runtime_wheel)
        self.assertIn("Tag: py3-none-", runtime_wheel)
        assert_honest_macos_wheel_tag(self, runtime_wheels[0], runtime_wheel)
        self.assertIn('FISHYJOES_RUNTIME_VERSION = "1.2.3"', runtime_config)

        with tempfile.TemporaryDirectory() as target:
            install = subprocess.run(
                [
                    sys.executable,
                    "-m",
                    "pip",
                    "install",
                    "--no-deps",
                    "--target",
                    target,
                    str(runtime_wheels[0]),
                    str(wheels[0]),
                ],
                text=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                check=False,
            )
            self.assertEqual(install.returncode, 0, install.stdout)

            imported = subprocess.run(
                [
                    sys.executable,
                    "-c",
                    (
                        "import fishyjoes_runtime, testapi; "
                        "assert fishyjoes_runtime.__version__ == '1.2.3'; "
                        "assert testapi.diagnostics()['runtime']['version'] == '1.2.3'; "
                        "assert testapi.SUPPORTED; "
                        "assert testapi.Strings.simple == 'Hello'"
                    ),
                ],
                env={"PYTHONPATH": target},
                text=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                check=False,
            )
            self.assertEqual(imported.returncode, 0, imported.stdout)


if __name__ == "__main__":
    unittest.main()
