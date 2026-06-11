import gc
import importlib
import shutil
import subprocess
import os
import sys
import tempfile
import unittest
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[5]
PYTHON_RUNTIME = REPO_ROOT / "python-runtime"
RUNTIME_SRC = PYTHON_RUNTIME / "src"
GENERATED = Path(__file__).resolve().parents[1] / "generated"
GENERATED_PACKAGE = GENERATED / "src" / "testapi"
GENERATED_SRC = GENERATED / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


def native_library_name(name: str) -> str:
    if sys.platform == "darwin":
        return f"lib{name}.dylib"
    if sys.platform.startswith("linux"):
        return f"lib{name}.so"
    if sys.platform == "win32":
        return f"{name}.dll"
    raise RuntimeError(f"Unsupported test platform: {sys.platform}")


def built_runtime_library() -> Path:
    bindings_build = REPO_ROOT / "integration-tests" / "TestAPI" / ".build" / "bindings"
    candidates = sorted(bindings_build.glob(f"*/release/{native_library_name('FishyJoesIotaRuntime')}"))
    if not candidates:
        candidates = sorted(bindings_build.glob(f"*/debug/{native_library_name('FishyJoesIotaRuntime')}"))
    if not candidates:
        raise AssertionError("Missing built FishyJoesIotaRuntime library; run FishyJoes Python build first")
    return candidates[0]


def copy_built_runtime_library(native_dir: Path) -> None:
    shutil.copy(built_runtime_library(), native_dir / native_library_name("FishyJoesIotaRuntime"))


class SharedRuntimeBoundaryTests(unittest.TestCase):
    def test_reusable_runtime_lives_in_shared_package_not_generated_native_module(self) -> None:
        runtime_package = PYTHON_RUNTIME / "src" / "fishyjoes_runtime"
        native_module = GENERATED_PACKAGE / "_native.py"

        self.assertTrue(runtime_package.is_dir(), "shared runtime package fishyjoes_runtime is missing")
        self.assertTrue((runtime_package / "iota.py").is_file(), "shared Iota runtime implementation is missing")
        self.assertTrue(native_module.is_file(), "generated _native.py is missing")

        native_source = native_module.read_text(encoding="utf-8")
        self.assertIn("fishyjoes_runtime", native_source)
        self.assertLess(
            len(native_source.splitlines()),
            180,
            "generated _native.py should stay a thin module-specific adapter",
        )

        forbidden_runtime_ownership = [
            "class TypeDescriptor",
            "class Function",
            "class Future",
            "class SwiftReference",
            "def setup_value_type",
            "def setup_protocol_type",
            "def _new_handle",
        ]
        offenders = [needle for needle in forbidden_runtime_ownership if needle in native_source]
        self.assertEqual([], offenders)

    def test_shared_runtime_contains_no_testapi_specific_branches(self) -> None:
        runtime_source = (PYTHON_RUNTIME / "src" / "fishyjoes_runtime" / "iota.py").read_text(encoding="utf-8")

        self.assertNotIn("TestAPI", runtime_source)
        self.assertNotIn("integration-tests/TestAPI", runtime_source)

    def test_shared_runtime_has_separate_config_dependency_and_native_modules(self) -> None:
        runtime_package = PYTHON_RUNTIME / "src" / "fishyjoes_runtime"
        iota_source = (runtime_package / "iota.py").read_text(encoding="utf-8")

        for module_name in ["config.py", "dependencies.py", "diagnostics.py", "native.py"]:
            self.assertTrue((runtime_package / module_name).is_file(), f"missing runtime module {module_name}")

        self.assertNotIn("class RuntimeConfig", iota_source)
        self.assertNotIn("class RuntimeDependency", iota_source)
        # Soft bloat guard: configuration, dependency loading, and native discovery must
        # live in their own modules (asserted above), not inline here. The cap has slack
        # for legitimate marshalling growth such as the full set of fixed-width integers.
        self.assertLess(
            len(iota_source.splitlines()),
            2500,
            "iota.py should not keep configuration, dependency loading, and native discovery inline",
        )

    def test_generated_native_module_does_not_export_private_runtime_internals(self) -> None:
        native = importlib.import_module("testapi._native")

        private_names = [
            "_callbacks",
            "_delete_ref",
            "_handle_refcounts",
            "_new_ref",
            "iota_lib",
            "runtime_lib",
        ]
        self.assertEqual([], [name for name in private_names if hasattr(native, name)])

    def test_runtime_callbacks_survive_garbage_collection(self) -> None:
        testapi = importlib.import_module("testapi")

        gc.collect()

        self.assertEqual(testapi.AttributedStrings.simple.string, "Hello")

    def test_reference_finalizers_release_on_garbage_collection(self) -> None:
        # ADR 0005: reference lifetime is driven by finalizers. Create a batch of Swift
        # reference objects, drop all strong refs, and confirm they are collected (their
        # weakref-driven finalizers ran) deterministically after gc.collect(), and that
        # the runtime remains usable afterwards.
        import weakref

        testapi = importlib.import_module("testapi")

        refs = [weakref.ref(testapi.Methods.create()) for _ in range(64)]
        gc.collect()
        alive = [r for r in refs if r() is not None]
        self.assertEqual([], alive, "Swift reference wrappers were not collected/finalized")

        # Runtime still works after a finalize/GC churn.
        self.assertEqual(testapi.Methods.create().instance_get, 1234)

    def test_missing_native_libraries_fail_loudly(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            temp_src = Path(temp) / "src"
            shutil.copytree(GENERATED_PACKAGE, temp_src / "testapi")

            result = subprocess.run(
                [sys.executable, "-c", "import testapi"],
                env={"PYTHONPATH": f"{temp_src}:{RUNTIME_SRC}"},
                text=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                check=False,
            )

        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertIn("Missing native library", result.stdout)
        self.assertIn("FishyJoes Python build phase", result.stdout)

    def test_runtime_version_mismatch_fails_loudly(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            temp_generated = Path(temp) / "generated"
            shutil.copytree(GENERATED, temp_generated)
            native = temp_generated / "src" / "testapi" / "_native.py"
            native.write_text(
                native.read_text(encoding="utf-8").replace(
                    'package_version="0.0.1",',
                    'package_version="0.0.1",\n        runtime_requirement=">=999.0.0",',
                ),
                encoding="utf-8",
            )

            result = subprocess.run(
                [sys.executable, "-c", "import testapi"],
                env={"PYTHONPATH": f"{temp_generated / 'src'}:{RUNTIME_SRC}"},
                text=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                check=False,
            )

        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertIn("fishyjoes-runtime 0.0.1 does not satisfy required >=999.0.0", result.stdout)

    def test_runtime_accepts_pep440_version_ranges(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            temp_generated = Path(temp) / "generated"
            shutil.copytree(GENERATED, temp_generated)
            native = temp_generated / "src" / "testapi" / "_native.py"
            native.write_text(
                native.read_text(encoding="utf-8").replace(
                    'package_version="0.0.1",',
                    'package_version="0.0.1",\n        runtime_requirement=">=0.0.1,<1.0.0",',
                ),
                encoding="utf-8",
            )
            copy_built_runtime_library(temp_generated / "native")

            result = subprocess.run(
                [sys.executable, "-c", "import testapi; assert testapi.SUPPORTED"],
                env={"PYTHONPATH": f"{temp_generated / 'src'}:{RUNTIME_SRC}"},
                text=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                check=False,
            )

        self.assertEqual(result.returncode, 0, result.stdout)

    def test_iota_abi_version_mismatch_fails_loudly(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            temp_generated = Path(temp) / "generated"
            shutil.copytree(GENERATED, temp_generated)
            native = temp_generated / "src" / "testapi" / "_native.py"
            native.write_text(
                native.read_text(encoding="utf-8").replace(
                    'package_version="0.0.1",',
                    'package_version="0.0.1",\n        iota_abi_version="999",',
                ),
                encoding="utf-8",
            )

            result = subprocess.run(
                [sys.executable, "-c", "import testapi"],
                env={"PYTHONPATH": f"{temp_generated / 'src'}:{RUNTIME_SRC}"},
                text=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                check=False,
            )

        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertIn("Iota ABI version mismatch", result.stdout)

    def test_python_version_mismatch_fails_loudly(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            temp_generated = Path(temp) / "generated"
            shutil.copytree(GENERATED, temp_generated)
            native = temp_generated / "src" / "testapi" / "_native.py"
            native.write_text(
                native.read_text(encoding="utf-8").replace(
                    'python_requirement=">=3.11",',
                    'python_requirement=">=999.0",',
                ),
                encoding="utf-8",
            )

            result = subprocess.run(
                [sys.executable, "-c", "import testapi"],
                env={"PYTHONPATH": f"{temp_generated / 'src'}:{RUNTIME_SRC}"},
                text=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                check=False,
            )

        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertIn("Python version mismatch", result.stdout)

    def test_platform_mismatch_fails_before_native_load(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            temp_generated = Path(temp) / "generated"
            shutil.copytree(GENERATED, temp_generated)
            native = temp_generated / "src" / "testapi" / "_native.py"
            native.write_text(
                native.read_text(encoding="utf-8").replace(
                    'package_version="0.0.1",',
                    'package_version="0.0.1",\n        supported_platforms=("NeverOS",),',
                ),
                encoding="utf-8",
            )

            result = subprocess.run(
                [sys.executable, "-c", "import testapi"],
                env={"PYTHONPATH": f"{temp_generated / 'src'}:{RUNTIME_SRC}"},
                text=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                check=False,
            )

        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertIn("Unsupported Python binding platform", result.stdout)

    def test_architecture_mismatch_fails_before_native_load(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            temp_generated = Path(temp) / "generated"
            shutil.copytree(GENERATED, temp_generated)
            native = temp_generated / "src" / "testapi" / "_native.py"
            native.write_text(
                native.read_text(encoding="utf-8").replace(
                    'package_version="0.0.1",',
                    'package_version="0.0.1",\n        supported_architectures=("neverarch",),',
                ),
                encoding="utf-8",
            )

            result = subprocess.run(
                [sys.executable, "-c", "import testapi"],
                env={"PYTHONPATH": f"{temp_generated / 'src'}:{RUNTIME_SRC}"},
                text=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                check=False,
            )

        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertIn("Python binding architecture mismatch", result.stdout)

    def test_generated_project_declares_shared_runtime_dependency(self) -> None:
        pyproject = (GENERATED / "pyproject.toml").read_text(encoding="utf-8")
        self.assertIn('"fishyjoes-runtime', pyproject)

    def test_generated_native_module_declares_dependency_metadata(self) -> None:
        native_source = (GENERATED_PACKAGE / "_native.py").read_text(encoding="utf-8")

        self.assertIn("RuntimeDependency", native_source)
        self.assertIn("dependencies=", native_source)

    def test_native_library_registry_reuses_shared_iota_runtime_and_rejects_conflicting_modules(self) -> None:
        from fishyjoes_runtime.native import NativeLibraryRegistry

        with tempfile.TemporaryDirectory() as temp:
            first_native = Path(temp) / "first"
            second_native = Path(temp) / "second"
            first_native.mkdir()
            second_native.mkdir()
            shutil.copytree(GENERATED / "native", first_native, dirs_exist_ok=True)
            shutil.copytree(GENERATED / "native", second_native, dirs_exist_ok=True)
            copy_built_runtime_library(first_native)
            copy_built_runtime_library(second_native)

            registry = NativeLibraryRegistry()
            first = registry.resolve("FishyJoesIotaRuntime", [first_native], "build first", reusable=True)
            second = registry.resolve("FishyJoesIotaRuntime", [second_native], "build first", reusable=True)

            self.assertEqual(first.path, second.path)
            self.assertFalse(first.reused)
            self.assertTrue(second.reused)

            registry.resolve("TestAPI", [first_native], "build first")
            with self.assertRaisesRegex(RuntimeError, "Native library load conflict for TestAPI"):
                registry.resolve("TestAPI", [second_native], "build first")

    def test_reusable_iota_runtime_does_not_require_dependent_package_copy(self) -> None:
        from fishyjoes_runtime.native import NativeLibraryRegistry, library_name

        with tempfile.TemporaryDirectory() as temp:
            dependency_native = Path(temp) / "dependency"
            dependent_native = Path(temp) / "dependent"
            dependency_native.mkdir()
            dependent_native.mkdir()
            runtime_library = library_name("FishyJoesIotaRuntime")
            shutil.copy(built_runtime_library(), dependency_native / runtime_library)

            registry = NativeLibraryRegistry()
            first = registry.resolve("FishyJoesIotaRuntime", [dependency_native], "build first", reusable=True)
            second = registry.resolve("FishyJoesIotaRuntime", [dependent_native], "build first", reusable=True)

            self.assertEqual(first.path, second.path)
            self.assertTrue(second.reused)

    def test_python_test_dependencies_are_declared(self) -> None:
        requirements = Path(__file__).resolve().parents[1] / "requirements-dev.txt"

        self.assertTrue(requirements.is_file(), "Python binding test dependencies must be explicit")
        contents = requirements.read_text(encoding="utf-8")
        for requirement in ["cffi", "hatchling", "mypy", "packaging"]:
            self.assertIn(requirement, contents)


if __name__ == "__main__":
    unittest.main()
