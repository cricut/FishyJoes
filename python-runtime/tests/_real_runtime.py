"""Real-runtime fixture for unit tests.

Per the project rule
([feedback_no_mocks_real_runtime](~/.claude/projects/-Users-antoniogermano-work-cricut-FishyJoes/memory/feedback_no_mocks_real_runtime.md)),
every test that touches FFI loads the **real** Swift dylibs and calls
into them for real.  No fakes, no mocks of runtime methods.

This module locates the dylibs that the integration build produces and
constructs an ``IotaRuntime`` pointed at them.  It deliberately fails
loudly if the dylibs are missing — silent skipping is also banned.

Required setup (run once before any test that uses ``build_real_runtime``):

    swift build
    cd integration-tests/TestAPI
    FISHYJOES=1 ../../.build/debug/fishy-joes code-gen --python build

After that the integration build's ``lib/`` directory carries:
- ``libFishyJoesIotaRuntime.dylib``
- ``libTestAPI.dylib``
- ``libTestAPI-iota.dylib``

That is the canonical "real runtime" used by every unit test.
"""

from __future__ import annotations

from pathlib import Path

from fishyjoes_python import IotaRuntime

_REPO_ROOT = Path(__file__).resolve().parents[2]
_TESTAPI_LIB_DIR = (
    _REPO_ROOT
    / "integration-tests" / "TestAPI" / "bindings" / "python"
    / "generated" / "src" / "cricut_testapi" / "lib"
)


def _platform_dylib(name: str) -> str:
    """Return the platform-correct dylib filename for ``name``.

    Examples:
        ``FishyJoesIotaRuntime`` -> ``libFishyJoesIotaRuntime.dylib`` on macOS,
        ``libFishyJoesIotaRuntime.so`` on Linux.
    """
    import sys
    if sys.platform == "darwin":
        return f"lib{name}.dylib"
    if sys.platform == "win32":
        return f"{name}.dll"
    return f"lib{name}.so"


class RealDylibsMissingError(RuntimeError):
    """Raised when ``build_real_runtime`` cannot find the integration
    build's dylibs.  Tests must NOT catch this and skip — that is the
    silent-skip antipattern (see ``feedback_skipping_is_yellow``)."""


def real_dylib_paths() -> tuple[Path, Path, Path]:
    """Return ``(iota_runtime_path, module_path, module_iota_path)``,
    raising ``RealDylibsMissingError`` if any are absent."""
    iota_runtime = _TESTAPI_LIB_DIR / _platform_dylib("FishyJoesIotaRuntime")
    module = _TESTAPI_LIB_DIR / _platform_dylib("TestAPI")
    module_iota = _TESTAPI_LIB_DIR / _platform_dylib("TestAPI-iota")
    missing = [p for p in (iota_runtime, module, module_iota) if not p.exists()]
    if missing:
        raise RealDylibsMissingError(
            "Real Swift dylibs not found at expected paths:\n  "
            + "\n  ".join(f"MISSING: {p}" for p in missing)
            + "\n\nRun the integration build first:\n"
            + "  swift build\n"
            + "  cd integration-tests/TestAPI\n"
            + "  FISHYJOES=1 ../../.build/debug/fishy-joes code-gen --python build\n",
        )
    return iota_runtime, module, module_iota


def build_real_runtime(*, strict_thread_scheduling: bool = False) -> IotaRuntime:
    """Construct an ``IotaRuntime`` against the real integration dylibs.

    Does not call ``ensure_loaded()``; callers do that themselves so
    tests can also exercise pre-load state if they want.
    """
    iota_runtime, module, module_iota = real_dylib_paths()
    return IotaRuntime(
        iota_runtime_path=iota_runtime,
        module_path=module,
        module_iota_path=module_iota,
        module_name="TestAPI",
        strict_thread_scheduling=strict_thread_scheduling,
    )


def build_generated_runtime() -> IotaRuntime:
    """Return the real IotaRuntime after generated Python type setup.

    Runtime-wrapper tests for generic Foundation types need the generated
    TestAPI setup callbacks too: ranges, functions, and other generic
    converters are registered from ``cricut_testapi.runtime``.
    """
    try:
        from cricut_testapi import ensure_loaded
        from cricut_testapi.runtime import get_runtime
    except ModuleNotFoundError as error:
        raise RealDylibsMissingError(
            "Generated TestAPI Python bindings are not importable. "
            "Run code-gen --python generate/build and include "
            "integration-tests/TestAPI/bindings/python/generated/src in PYTHONPATH.",
        ) from error

    ensure_loaded()
    generated_runtime = get_runtime()
    runtime = generated_runtime._runtime
    if runtime is None:
        raise RuntimeError("Generated TestAPI runtime did not initialise IotaRuntime")
    return runtime
