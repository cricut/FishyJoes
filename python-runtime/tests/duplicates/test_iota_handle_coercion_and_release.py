"""Quarantined duplicates from ``tests/test_iota.py``.

These two tests both exist to pin runtime-side mechanics that the
integration tier already exercises end-to-end against real Swift dylibs:

- ``test_handle_coercion`` rebuilds ``IotaRuntime`` with deliberately
  missing dylib paths and asserts that ``make_native_reference``,
  ``make_iota_reference``, and ``unwrap_reference`` round-trip integer
  handles.  The integration tests at
  ``integration-tests/TestAPI/bindings/python/tests/`` create real
  references via real Swift functions and prove the same coercion holds
  for genuine handles, with no need for the missing-path runtime
  configuration.
- ``test_reference_release_uses_runtime`` pins that
  ``NativeReference.release`` / ``IotaReference.release`` delegate to
  ``runtime.release_native_reference``.  This was implemented with a
  ``FakeRuntime`` capturing the calls — banned by
  [feedback_no_mocks_real_runtime](../../../../../.claude/projects/-Users-antoniogermano-work-cricut-FishyJoes/memory/feedback_no_mocks_real_runtime.md).
  The integration tier exercises ``release()`` on real references
  produced by real Swift code and asserts retain-count drops in the
  Swift runtime — a strictly stronger guarantee.

See ``README.md`` for the policy.  Quarantined per
[feedback_never_delete_tests](../../../../../.claude/projects/-Users-antoniogermano-work-cricut-FishyJoes/memory/feedback_never_delete_tests.md):
the user weighs in before deletion.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SRC = ROOT / "src"
if str(SRC) not in sys.path:
    sys.path.insert(0, str(SRC))

import fishyjoes_python
from fishyjoes_python.iota import _as_handle


class FakeRuntime:
    """Captures ``release_native_reference`` calls.

    Banned in the live unit suite; preserved here only because
    ``test_reference_release_uses_runtime`` was written against it.
    """

    def __init__(self) -> None:
        self.released: list[int] = []

    def release_native_reference(self, native_ref: int | None) -> None:
        if native_ref is not None:
            self.released.append(native_ref)


class QuarantinedIotaRuntimeTests(unittest.TestCase):
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
        native = fishyjoes_python.NativeReference(
            native_ref=99, native_type="Example", _runtime=fake_runtime,
        )
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


if __name__ == "__main__":
    unittest.main()
