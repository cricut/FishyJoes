"""Method integration tests."""

import asyncio
import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.Methods import Methods


class TestStaticMethods(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_static_get(self) -> None:
        self.assertEqual(Methods.staticGet(), 123)

    def test_static_get_method(self) -> None:
        self.assertEqual(Methods.get_staticGetMethod(), 234)

    def test_static_modifiable(self) -> None:
        # Reset to known value first then test get/set round-trip
        Methods.set_staticModifiable(345)
        self.assertEqual(Methods.staticModifiable(), 345)
        Methods.set_staticModifiable(987)
        self.assertEqual(Methods.staticModifiable(), 987)

    def test_static_stored(self) -> None:
        Methods.set_staticStored(567)
        self.assertEqual(Methods.staticStored(), 567)
        Methods.set_staticStored(765)
        self.assertEqual(Methods.staticStored(), 765)


class TestInstanceMethods(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()
        self.instance = Methods.create()

    def test_instance_get(self) -> None:
        self.assertEqual(self.instance.instanceGet, 1234)

    def test_instance_get_method(self) -> None:
        self.assertEqual(self.instance.get_instanceGetMethod(), 2345)

    def test_instance_modifiable(self) -> None:
        self.assertEqual(self.instance.instanceModifiable, 3456)
        self.instance.instanceModifiable = 9876
        self.assertEqual(self.instance.instanceModifiable, 9876)

    def test_instance_stored(self) -> None:
        self.assertEqual(self.instance.instanceStored, 5678)
        self.instance.instanceStored = 7654
        self.assertEqual(self.instance.instanceStored, 7654)


@unittest.skip("Async/await not supported: FishyJoesCommonRuntime_runScheduledWork missing")
class TestAsyncInstanceMethods(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()
        self.instance = Methods.create()

    def test_async42(self) -> None:
        result = asyncio.run(self.instance.async42())
        self.assertEqual(result, 42)

    def test_async_yield(self) -> None:
        asyncio.run(self.instance.asyncYield())

    def test_async_sleep(self) -> None:
        asyncio.run(self.instance.asyncSleep())

    def test_async_void(self) -> None:
        asyncio.run(self.instance.asyncVoid())

    def test_async_double(self) -> None:
        result = asyncio.run(self.instance.asyncDouble(1.0))
        self.assertEqual(result, 2.0)

    def test_async_multiple_args(self) -> None:
        async def run() -> int:
            return await self.instance.asyncMultipleArgs(1, lambda: asyncio.coroutine(lambda: 2)())

        # Use a simple coroutine that returns 2
        async def two() -> int:
            return 2

        async def main() -> int:
            return await self.instance.asyncMultipleArgs(1, two)

        result = asyncio.run(main())
        self.assertEqual(result, 3)

    def test_async_throwing(self) -> None:
        with self.assertRaises(Exception) as ctx:
            asyncio.run(self.instance.asyncThrowing())
        self.assertIn("TheMethodError", str(ctx.exception))

    def test_async_callback_func0(self) -> None:
        ran = [False]

        async def cb() -> int:
            ran[0] = True
            return 42

        result = asyncio.run(self.instance.asyncCallbackFunc0(cb))
        self.assertEqual(result, 42)
        self.assertTrue(ran[0])

    def test_async_callback_func0_throw(self) -> None:
        the_exception = Exception("asyncErr")

        async def cb() -> int:
            raise the_exception

        with self.assertRaises(Exception) as ctx:
            asyncio.run(self.instance.asyncCallbackFunc0(cb))
        self.assertIs(ctx.exception, the_exception)


@unittest.skip("Async/await not supported: FishyJoesCommonRuntime_runScheduledWork missing")
class TestAsyncStaticMethods(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_static_async42(self) -> None:
        result = asyncio.run(Methods.staticAsync42())
        self.assertEqual(result, 42)

    def test_static_async_yield(self) -> None:
        asyncio.run(Methods.staticAsyncYield())

    def test_static_async_sleep(self) -> None:
        asyncio.run(Methods.staticAsyncSleep())

    def test_static_async_void(self) -> None:
        asyncio.run(Methods.staticAsyncVoid())

    def test_static_async_double(self) -> None:
        result = asyncio.run(Methods.staticAsyncDouble(1.0))
        self.assertEqual(result, 2.0)

    def test_static_async_multiple_args(self) -> None:
        async def two() -> int:
            return 2

        async def main() -> int:
            return await Methods.staticAsyncMultipleArgs(1, two)

        result = asyncio.run(main())
        self.assertEqual(result, 3)

    def test_static_async_throwing(self) -> None:
        with self.assertRaises(Exception) as ctx:
            asyncio.run(Methods.staticAsyncThrowing())
        self.assertIn("TheMethodError", str(ctx.exception))

    def test_static_async_callback_func0(self) -> None:
        ran = [False]

        async def cb() -> int:
            ran[0] = True
            return 42

        result = asyncio.run(Methods.staticAsyncCallbackFunc0(cb))
        self.assertEqual(result, 42)
        self.assertTrue(ran[0])

    def test_static_async_callback_func0_throw(self) -> None:
        the_exception = Exception("asyncErr")

        async def cb() -> int:
            raise the_exception

        with self.assertRaises(Exception) as ctx:
            asyncio.run(Methods.staticAsyncCallbackFunc0(cb))
        self.assertIs(ctx.exception, the_exception)


if __name__ == "__main__":
    unittest.main()
