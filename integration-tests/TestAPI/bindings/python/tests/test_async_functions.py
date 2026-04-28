"""Async function integration tests."""

import asyncio
import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.AsyncFunctions import AsyncFunctions


class TestAsyncFunctions(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_async_const42(self) -> None:
        result = asyncio.run(AsyncFunctions.const42()())
        self.assertEqual(result, 42)

    def test_async_abs(self) -> None:
        result = asyncio.run(AsyncFunctions.abs()(-3))
        self.assertEqual(result, 3)

    def test_async_int_compose(self) -> None:
        async def inc(x: int) -> int:
            return x + 1

        async def triple(x: int) -> int:
            return x * 3

        composed = AsyncFunctions.intCompose()(inc, triple)

        async def run() -> None:
            self.assertEqual(await composed(3), 10)
            self.assertEqual(await composed(2), 7)

        asyncio.run(run())

    def test_async_compose_exception(self) -> None:
        class ComposeError(Exception):
            pass

        async def boom(x: int) -> int:
            raise ComposeError()

        async def identity(x: int) -> int:
            return x

        composed = AsyncFunctions.intCompose()(boom, identity)

        with self.assertRaises(ComposeError):
            asyncio.run(composed(3))

    def test_async_rest_of_functions(self) -> None:
        async def run() -> None:
            self.assertAlmostEqual(await AsyncFunctions.add3Things()(3.0, 4.5, 1), 8.5, places=5)
            self.assertEqual(await AsyncFunctions.makeList()("a", "b", "c", "d"), ["a", "b", "c", "d"])

            async def eighty_four() -> int:
                return 84

            fifth = await AsyncFunctions.fifthThing()("hi", 1, 1.0, "...", eighty_four)
            self.assertEqual(await fifth(), 84)

            result = await AsyncFunctions.sixthThing()("hi", 1, 1.0, "...", eighty_four, 17)
            self.assertEqual(result, 17)

        asyncio.run(run())

    def test_async_passing_functions_to_swift(self) -> None:
        async def run() -> None:
            result = await AsyncFunctions.exercise0(lambda: asyncio.coroutine(lambda: 8)())
            self.assertEqual(result, "8")

        async def main() -> None:
            async def eight() -> int:
                return 8

            async def neg(x: int) -> int:
                return -x

            self.assertEqual(await AsyncFunctions.exercise0(eight), "8")
            self.assertEqual(await AsyncFunctions.exercise1(neg), "3")

            def compose(f, g):
                async def composed(x: int) -> int:
                    return await f(await g(x))

                return composed

            self.assertEqual(await AsyncFunctions.exercise2(compose), "25")

            async def sum3(a: float, b: float, c: int) -> float:
                return a + b + c

            self.assertEqual(await AsyncFunctions.exercise3(sum3), "7.4")

            async def reverse4(a: str, b: str, c: str, d: str) -> list:
                return [a, b, c, d]

            self.assertEqual(await AsyncFunctions.exercise4(reverse4), '["a", "b", "c", "d"]')

            async def fifth_thunk(a, b, c, d, f):
                return f

            self.assertEqual(await AsyncFunctions.exercise5(fifth_thunk), "83")

            async def sixth_int(a, b, c, d, e, i: int) -> int:
                return i

            self.assertEqual(await AsyncFunctions.exercise6(sixth_int), "42")

        asyncio.run(main())

    def test_async_swift_throws(self) -> None:
        with self.assertRaises(Exception):
            asyncio.run(AsyncFunctions.willThrow()())

    def test_thunk_maker(self) -> None:
        times_called = [0]

        async def thunk() -> None:
            times_called[0] += 1

        thunk_twice = AsyncFunctions.thunkTwiceMaker(thunk)
        asyncio.run(thunk_twice())
        self.assertEqual(times_called[0], 2)


if __name__ == "__main__":
    unittest.main()
