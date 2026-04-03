from __future__ import annotations

import sys
import ctypes
from pathlib import Path
import unittest
from types import SimpleNamespace

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"
if str(SRC) not in sys.path:
    sys.path.insert(0, str(SRC))

import cffi
import fishyjoes_python
from fishyjoes_python.iota import _as_handle, _decode_utf16_z, _ffi


class FakeRuntime:
    def __init__(self) -> None:
        self.released: list[int] = []

    def release_native_reference(self, native_ref: int | None) -> None:
        if native_ref is not None:
            self.released.append(native_ref)


class IotaRuntimeTests(unittest.TestCase):
    def test_decode_utf16_z(self) -> None:
        # Build a UTF-16LE buffer via cffi.
        buf = _ffi.new("uint16_t[]", [ord("h"), ord("i"), 0, 0])
        self.assertEqual(_decode_utf16_z(buf), "hi")

    def test_decode_utf16_z_null(self) -> None:
        self.assertEqual(_decode_utf16_z(None), "")
        self.assertEqual(_decode_utf16_z(_ffi.NULL), "")

    def test_handle_coercion(self) -> None:
        runtime = fishyjoes_python.IotaRuntime(
            iota_runtime_path=ROOT / "missing-iota.dylib",
            module_path=ROOT / "missing-module.dylib",
            module_iota_path=ROOT / "missing-module-iota.dylib",
            module_name="TestAPI",
        )

        native = runtime.make_native_reference(123, "Example")
        typed = runtime.make_iota_reference(456, "Example")

        self.assertEqual(runtime.unwrap_reference(native), 123)
        self.assertEqual(runtime.unwrap_reference(typed), 456)
        self.assertEqual(_as_handle(native), 123)
        self.assertEqual(_as_handle(typed), 456)

    def test_reference_release_uses_runtime(self) -> None:
        fake_runtime = FakeRuntime()
        native = fishyjoes_python.NativeReference(native_ref=99, native_type="Example", _runtime=fake_runtime)
        native.release()
        self.assertEqual(fake_runtime.released, [99])
        self.assertIsNone(native.native_ref)

        typed = fishyjoes_python.IotaReference(
            handle=fishyjoes_python.IotaHandle(42),
            native_type="Example",
            _runtime=fake_runtime,
        )
        typed.release()
        self.assertEqual(fake_runtime.released, [99, 42])

    def test_retain_release_roundtrip(self) -> None:
        """_retain stores a handle; _borrow_python_value recovers the object; _release removes it."""
        from fishyjoes_python.iota import _borrow_python_value

        runtime = fishyjoes_python.IotaRuntime(
            iota_runtime_path=ROOT / "missing-iota.dylib",
            module_path=ROOT / "missing-module.dylib",
            module_iota_path=ROOT / "missing-module-iota.dylib",
            module_name="TestAPI",
        )

        obj = {"key": "value"}
        handle = runtime._retain(obj)
        self.assertIsInstance(handle, int)
        self.assertNotEqual(handle, 0)

        recovered = _borrow_python_value(handle)
        self.assertIs(recovered, obj)

        # After release the handle is removed from the registry.
        runtime._release(handle)
        self.assertNotIn(handle, runtime._handles)

    def test_bind_returns_callable_wrapper(self) -> None:
        """bind() now returns a _CffiSymbolWrapper that calls the cffi lib symbol."""
        from fishyjoes_python.iota import _CffiSymbolWrapper

        runtime = fishyjoes_python.IotaRuntime(
            iota_runtime_path=ROOT / "missing-iota.dylib",
            module_path=ROOT / "missing-module.dylib",
            module_iota_path=ROOT / "missing-module-iota.dylib",
            module_name="TestAPI",
        )

        runtime._loaded = True
        runtime.module_iota_lib = SimpleNamespace(add_one=lambda x: x)

        bound = runtime.bind("add_one", restype=ctypes.c_int, argtypes=[ctypes.c_int])
        self.assertIsInstance(bound, _CffiSymbolWrapper)

    def test_describe_native_reference_no_env(self) -> None:
        """describe_native_reference returns '<null>' for None input without loading."""
        runtime = fishyjoes_python.IotaRuntime(
            iota_runtime_path=ROOT / "missing-iota.dylib",
            module_path=ROOT / "missing-module.dylib",
            module_iota_path=ROOT / "missing-module-iota.dylib",
            module_name="TestAPI",
        )
        self.assertEqual(runtime.describe_native_reference(None), "<null>")


if __name__ == "__main__":
    unittest.main()
