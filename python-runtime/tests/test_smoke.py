from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"
if str(SRC) not in sys.path:
    sys.path.insert(0, str(SRC))

import fishyjoes_python


class SmokeTests(unittest.TestCase):
    def test_import_and_runtime_metadata(self) -> None:
        state = fishyjoes_python.RuntimeState.detect()
        self.assertEqual(state.implementation, "cpython")
        self.assertGreaterEqual(state.version, (3, 11, 0))
        self.assertTrue(state.supports_abi3)

    def test_callback_registry(self) -> None:
        registry = fishyjoes_python.CallbackRegistry()
        callback_id = registry.register(lambda value: value + 1)
        self.assertEqual(registry.resolve(callback_id)(41), 42)
        registry.unregister(callback_id)

    def test_native_extension(self) -> None:
        version = fishyjoes_python.native_runtime_version()
        self.assertTrue(
            version.startswith("fishyjoes_python-native-"),
            f"unexpected version string: {version!r}",
        )

    def test_cpython_guard(self) -> None:
        if sys.implementation.name != "cpython":
            with self.assertRaises(RuntimeError):
                fishyjoes_python.ensure_cpython()


if __name__ == "__main__":
    unittest.main()
