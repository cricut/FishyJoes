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

import fishyjoes_python
from fishyjoes_python.iota import _as_handle, _decode_utf16_z


class FakeRuntime:
    def __init__(self) -> None:
        self.released: list[int] = []

    def release_native_reference(self, native_ref: int | None) -> None:
        if native_ref is not None:
            self.released.append(native_ref)


class IotaRuntimeTests(unittest.TestCase):
    def test_decode_utf16_z(self) -> None:
        units = (ctypes.c_uint16 * 4)(ord("h"), ord("i"), 0, 0)
        self.assertEqual(_decode_utf16_z(units), "hi")

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

    def test_bind_and_invoke_helpers(self) -> None:
        runtime = fishyjoes_python.IotaRuntime(
            iota_runtime_path=ROOT / "missing-iota.dylib",
            module_path=ROOT / "missing-module.dylib",
            module_iota_path=ROOT / "missing-module-iota.dylib",
            module_name="TestAPI",
        )

        def echo(value: int) -> int:
            return value + 1

        runtime._loaded = True
        runtime.module_iota_lib = SimpleNamespace(add_one=echo)

        bound = runtime.bind("add_one", restype=ctypes.c_int, argtypes=[ctypes.c_int])
        self.assertIs(bound, echo)
        self.assertEqual(bound.restype, ctypes.c_int)
        self.assertEqual(bound.argtypes, [ctypes.c_int])
        self.assertEqual(runtime.invoke("add_one", 41), 42)

    def test_describe_native_reference_consumes_foreign_string(self) -> None:
        runtime = fishyjoes_python.IotaRuntime(
            iota_runtime_path=ROOT / "missing-iota.dylib",
            module_path=ROOT / "missing-module.dylib",
            module_iota_path=ROOT / "missing-module-iota.dylib",
            module_name="TestAPI",
        )

        runtime._loaded = True
        runtime.iota_runtime_lib = SimpleNamespace()
        retained: list[str] = []

        def fake_bind(_library: object, symbol: str, *, restype: object, argtypes: object) -> object:
            self.assertEqual(symbol, "FishyJoesCommonRuntime_AnyBox_toString")
            self.assertIs(restype, fishyjoes_python.iota.ForeignObject)
            self.assertEqual(list(argtypes), [ctypes.c_void_p, fishyjoes_python.iota.ForeignObjectPtr])

            def describe(env: object, native_ref: object, exn: object) -> ctypes.c_void_p:
                del env, native_ref, exn
                retained.append("called")
                return ctypes.c_void_p(runtime._retain("hello"))

            return describe

        runtime._bind = fake_bind  # type: ignore[method-assign]
        self.assertEqual(runtime.describe_native_reference(123), "hello")
        self.assertEqual(retained, ["called"])


if __name__ == "__main__":
    unittest.main()
