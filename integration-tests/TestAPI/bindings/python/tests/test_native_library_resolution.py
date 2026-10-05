"""Regression tests for deterministic native-library resolution.

`fishyjoes_runtime.native.library_path` searches several candidate roots (the
installed package's own ``native/`` and the local-development build output). In
normal operation exactly one root is populated; if the same library exists as
distinct files in more than one root the load is ambiguous and must fail loudly
rather than silently take the first match (which could be a stale copy).
"""

import os
import tempfile
import unittest
from pathlib import Path

from fishyjoes_runtime import native


class NativeLibraryResolutionTests(unittest.TestCase):
    def _lib_filename(self) -> str:
        return native.library_name("Demo")

    def test_linux_native_libraries_load_with_global_symbol_visibility(self) -> None:
        class FakeFFI:
            RTLD_NOW = 2
            RTLD_GLOBAL = 256

        original_system = native.platform.system
        native.platform.system = lambda: "Linux"
        try:
            self.assertEqual(native.library_load_flags(FakeFFI), FakeFFI.RTLD_NOW | FakeFFI.RTLD_GLOBAL)
        finally:
            native.platform.system = original_system

    def test_single_populated_root_resolves(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp) / "native"
            root.mkdir()
            (root / self._lib_filename()).write_bytes(b"")

            self.assertEqual(
                native.library_path("Demo", [root], "build first"),
                (root / self._lib_filename()).resolve(),
            )

    def test_missing_library_raises_with_hint(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            with self.assertRaises(RuntimeError) as caught:
                native.library_path("Demo", [Path(temp) / "native"], "run the build phase")

            message = str(caught.exception)
            self.assertIn("Missing native library", message)
            self.assertIn("run the build phase", message)

    def test_distinct_copies_in_multiple_roots_fail_loudly(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            root_a = Path(temp) / "a" / "native"
            root_b = Path(temp) / "b" / "native"
            root_a.mkdir(parents=True)
            root_b.mkdir(parents=True)
            (root_a / self._lib_filename()).write_bytes(b"stale")
            (root_b / self._lib_filename()).write_bytes(b"fresh")

            with self.assertRaises(RuntimeError) as caught:
                native.library_path("Demo", [root_a, root_b], "build first")

            self.assertIn("Ambiguous native library", str(caught.exception))

    def test_same_file_reachable_via_two_candidates_is_not_ambiguous(self) -> None:
        # One file reachable through two candidate roots (e.g. a symlinked root)
        # resolves to a single path and must not be flagged as ambiguous.
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp) / "native"
            root.mkdir()
            (root / self._lib_filename()).write_bytes(b"")
            link = Path(temp) / "link"
            os.symlink(root, link)

            self.assertEqual(
                native.library_path("Demo", [root, link], "build first"),
                (root / self._lib_filename()).resolve(),
            )


if __name__ == "__main__":
    unittest.main()
