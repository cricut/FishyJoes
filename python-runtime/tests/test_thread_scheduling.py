"""IotaRuntime does not implement true off-main-thread scheduling.

Per documented non-goals (ADR-0010), the runtime currently runs
scheduled work inline on the calling thread.  The user-facing
contract has two halves:

1. Default mode: emit a one-time WARNING log and run inline.
2. ``strict_thread_scheduling=True``: raise
   ``NotImplementedInNativeError`` instead of running inline.

Per the no-mocks rule (``feedback_no_mocks_real_runtime``): tests run
against the real Swift dylibs.  The default-mode tests drive real
generated async work so Swift supplies a valid scheduled-work context;
calling ``_schedule_thread_work`` directly with a synthetic NULL
context is unsafe and has previously SIGSEGV'd inside
``Env_runScheduledWork``.

The strict-mode test is *not* skipped: the strict path raises before
any FFI call, so the assertion stands purely on the wrapper-side
guard with no risk of crashing Swift.
"""

from __future__ import annotations

import asyncio
import logging
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"
if str(SRC) not in sys.path:
    sys.path.insert(0, str(SRC))
TESTS = ROOT / "tests"
if str(TESTS) not in sys.path:
    sys.path.insert(0, str(TESTS))

import fishyjoes_python
from _real_runtime import build_generated_runtime, build_real_runtime
from fishyjoes_python.iota import _ffi


def _null() -> object:
    return _ffi.cast("void*", 0)


async def _exercise_real_scheduled_work() -> None:
    from cricut_testapi.AsyncFunctions import AsyncFunctions

    async def eight() -> int:
        return 8

    result = await AsyncFunctions.exercise0(eight)
    if result != "8":
        raise AssertionError(f"unexpected async result: {result!r}")


class StrictThreadSchedulingTests(unittest.TestCase):
    """Strict mode raises *before* any FFI call.  Safe to drive from
    Python alone with a NULL context — Swift never sees it."""

    def test_strict_mode_refuses_to_schedule(self) -> None:
        runtime = build_real_runtime(strict_thread_scheduling=True)
        runtime.ensure_loaded()
        with self.assertRaises(fishyjoes_python.NotImplementedInNativeError) as ctx:
            runtime._schedule_thread_work(_null(), _null())
        self.assertIn("schedule", str(ctx.exception).lower())


class PermissiveThreadSchedulingTests(unittest.TestCase):
    """Default-mode warning-emission contract, driven by real generated
    async work so Swift supplies a valid scheduled-work context."""

    def test_default_schedule_emits_warning(self) -> None:
        """In permissive mode the schedule callback emits a one-time
        WARNING log so the threading limitation is audible."""
        runtime = build_generated_runtime()
        runtime._thread_schedule_warning_emitted = False
        with self.assertLogs("fishyjoes", level="WARNING") as captured:
            asyncio.run(_exercise_real_scheduled_work())
        joined = "\n".join(captured.output)
        self.assertIn("schedule", joined.lower())
        self.assertTrue(
            "thread" in joined.lower() or "inline" in joined.lower(),
            f"warning should mention threading limitation, got: {joined!r}",
        )

    def test_warning_is_emitted_only_once_per_runtime(self) -> None:
        """The audible warning would drown out other logs if it fired
        on every callback.  Emit once per runtime instance and
        downgrade subsequent invocations to DEBUG."""
        runtime = build_generated_runtime()
        runtime._thread_schedule_warning_emitted = False
        warnings: list[logging.LogRecord] = []
        handler = logging.Handler(level=logging.WARNING)
        handler.emit = warnings.append  # type: ignore[method-assign]
        logger = logging.getLogger("fishyjoes")
        logger.addHandler(handler)
        try:
            asyncio.run(_exercise_real_scheduled_work())
            asyncio.run(_exercise_real_scheduled_work())
        finally:
            logger.removeHandler(handler)
        self.assertEqual(
            len(warnings), 1,
            f"expected exactly one WARNING, got {len(warnings)}",
        )


if __name__ == "__main__":
    unittest.main()
