import asyncio
import importlib
import os
import subprocess
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
sys.path.insert(0, str(GENERATED_SRC))


class AsyncFunctionTests(unittest.IsolatedAsyncioTestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    async def test_swift_async_functions_are_awaitable(self) -> None:
        functions = self.testapi.AsyncFunctions

        self.assertEqual(await functions.const42(), 42)
        self.assertEqual(await functions.abs(-3), 3)
        self.assertEqual(await functions.add3_things(3.0, 4.5, 1), 8.5)
        self.assertEqual(await functions.make_list("a", "b", "c", "d"), ["a", "b", "c", "d"])
        self.assertEqual(await (await functions.fifth_thing("hi", 1, 1.0, "...", lambda: 84))(), 84)
        self.assertEqual(await functions.sixth_thing("hi", 1, 1.0, "...", lambda: 84, 17), 17)

    async def test_nested_async_functions_round_trip(self) -> None:
        functions = self.testapi.AsyncFunctions

        composed = functions.int_compose(lambda value: value + 1, lambda value: value * 3)

        self.assertEqual(await composed(3), 10)
        self.assertEqual(await composed(2), 7)

    async def test_python_callbacks_passed_to_swift_async_methods(self) -> None:
        functions = self.testapi.AsyncFunctions

        def compose(f, g):
            async def composed(value):
                return await f(await g(value))

            return composed

        self.assertEqual(await functions.exercise0(lambda: 8), "8")
        self.assertEqual(await functions.exercise1(lambda value: abs(value)), "3")
        self.assertEqual(await functions.exercise2(compose), "25")
        self.assertEqual(await functions.exercise3(lambda a, b, c: a + b + c), "7.4")
        self.assertEqual(await functions.exercise4(lambda a, b, c, d: [a, b, c, d]), '["a", "b", "c", "d"]')
        self.assertEqual(await functions.exercise5(lambda _a, _b, _c, _d, thunk: thunk), "83")
        self.assertEqual(await functions.exercise6(lambda _a, _b, _c, _d, _thunk, value: value), "42")

    async def test_swift_async_errors_propagate(self) -> None:
        functions = self.testapi.AsyncFunctions

        with self.assertRaises(Exception):
            await functions.will_throw()

    async def test_python_cancellation_ignores_late_swift_completion(self) -> None:
        functions = self.testapi.AsyncFunctions
        loop = asyncio.get_running_loop()
        loop_errors = []

        def capture_loop_error(_loop, context):
            loop_errors.append(context)

        previous_handler = loop.get_exception_handler()
        loop.set_exception_handler(capture_loop_error)
        try:
            future = functions.delayed_const(nanoseconds=50_000_000)
            await asyncio.sleep(0)

            future.cancel()

            with self.assertRaises(asyncio.CancelledError):
                await future

            await asyncio.sleep(0.1)
        finally:
            loop.set_exception_handler(previous_handler)

        self.assertEqual([], loop_errors)

    def test_runtime_shutdown_rejects_unresolved_swift_futures(self) -> None:
        env = os.environ.copy()
        env["PYTHONPATH"] = os.pathsep.join([str(GENERATED_SRC), env.get("PYTHONPATH", "")])
        script = """
import asyncio
import importlib

import testapi


async def main():
    native = importlib.import_module("testapi._native")
    future = testapi.AsyncFunctions.delayed_const(nanoseconds=50_000_000)
    await asyncio.sleep(0)

    native.shutdown()

    try:
        await future
    except RuntimeError as error:
        assert "FishyJoes runtime shut down" in str(error), error
    else:
        raise AssertionError("shutdown did not reject unresolved Swift future")

    await asyncio.sleep(0.1)


asyncio.run(main())
"""
        result = subprocess.run(
            [sys.executable, "-c", script],
            env=env,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            check=False,
        )

        self.assertEqual(0, result.returncode, result.stdout + result.stderr)

    def test_runtime_shutdown_refuses_newly_constructed_swift_futures(self) -> None:
        # Guards the shutdown gate: a Swift future constructed after shutdown must fail
        # fast rather than slip past the rejection snapshot and hang its awaiter forever
        # (the TOCTOU the gate+registration locking closes).
        env = os.environ.copy()
        env["PYTHONPATH"] = os.pathsep.join([str(GENERATED_SRC), env.get("PYTHONPATH", "")])
        script = """
import asyncio
import importlib

import testapi


async def main():
    native = importlib.import_module("testapi._native")
    native.shutdown()
    try:
        await testapi.AsyncFunctions.delayed_const(nanoseconds=10_000_000)
    except RuntimeError as error:
        assert "shut down" in str(error), error
    else:
        raise AssertionError("shutdown did not refuse a newly constructed Swift future")


asyncio.run(main())
"""
        result = subprocess.run(
            [sys.executable, "-c", script],
            env=env,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            check=False,
        )

        self.assertEqual(0, result.returncode, result.stdout + result.stderr)

    async def test_python_async_callback_errors_propagate(self) -> None:
        functions = self.testapi.AsyncFunctions

        async def throw_from_python() -> int:
            raise ValueError("python async callback failed")

        with self.assertRaisesRegex(ValueError, "python async callback failed"):
            await functions.exercise0(throw_from_python)


if __name__ == "__main__":
    unittest.main()
