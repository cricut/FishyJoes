import asyncio
import unittest

import testapi


class AsyncFunctionTests(unittest.IsolatedAsyncioTestCase):
    async def test_swift_async_functions_are_awaitable(self) -> None:
        functions = testapi.AsyncFunctions

        self.assertEqual(await functions.const42(), 42)
        self.assertEqual(await functions.abs(-3), 3)
        self.assertEqual(await functions.add3_things(3.0, 4.5, 1), 8.5)
        self.assertEqual(await functions.make_list("a", "b", "c", "d"), ["a", "b", "c", "d"])
        self.assertEqual(await (await functions.fifth_thing("hi", 1, 1.0, "...", lambda: 84))(), 84)
        self.assertEqual(await functions.sixth_thing("hi", 1, 1.0, "...", lambda: 84, 17), 17)

    async def test_nested_async_functions_round_trip(self) -> None:
        functions = testapi.AsyncFunctions

        composed = functions.int_compose(lambda value: value + 1, lambda value: value * 3)

        self.assertEqual(await composed(3), 10)
        self.assertEqual(await composed(2), 7)

    async def test_python_callbacks_passed_to_swift_async_methods(self) -> None:
        functions = testapi.AsyncFunctions

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

    async def test_async_protocol_witness_round_trips_python_callbacks(self) -> None:
        def compose(f, g):
            async def composed(value):
                return await f(await g(value))

            return composed

        async def exercise0(fn):
            return f"proto {await fn()}"

        async def exercise1(fn):
            return f"proto {await fn(-8)}"

        async def exercise2(fn):
            composed = fn(lambda value: value + 2, lambda value: value * 5)
            return f"proto {await composed(3)}"

        async def exercise3(fn):
            return f"proto {await fn(1.5, 2.25, 3)}"

        async def exercise4(fn):
            return "|".join(await fn("a", "b", "c", "d"))

        async def exercise5(fn):
            thunk = await fn("a", 1, 2.0, "b", lambda: 77)
            return f"proto {await thunk()}"

        async def exercise6(fn):
            return f"proto {await fn('a', 1, 2.0, 'b', lambda: 77, 11)}"

        def thunk_twice_maker(thunk):
            async def twice():
                await thunk()
                await thunk()

            return twice

        value = testapi.TestAsyncForeignSideFunctionsStruct(
            const42=lambda: 42,
            iabs=lambda value: abs(value),
            int_compose=compose,
            add3_things=lambda a, b, c: a + b + c,
            make_list=lambda a, b, c, d: [a, b, c, d],
            fifth_thing=lambda _a, _b, _c, _d, thunk: thunk,
            six=lambda _a, _b, _c, _d, _thunk, value: value,
            will_throw=lambda: (_ for _ in ()).throw(ValueError("protocol async failure")),
            exercise0_fun=exercise0,
            exercise1_fun=exercise1,
            exercise2_fun=exercise2,
            exercise3_fun=exercise3,
            exercise4_fun=exercise4,
            exercise5_fun=exercise5,
            exercise6_fun=exercise6,
            thunk_twice_maker_fun=thunk_twice_maker,
        )

        witness = value.witness()
        self.assertEqual(await witness.const42(), 42)
        self.assertEqual(await witness.iabs(-9), 9)
        self.assertEqual(await witness.exercise0(lambda: 5), "proto 5")
        self.assertEqual(await witness.exercise2(compose), "proto 17")
        self.assertEqual(await witness.default_exercise6(lambda _a, _b, _c, _d, _thunk, value: value), "89")
        with self.assertRaisesRegex(ValueError, "protocol async failure"):
            await witness.will_throw()

    async def test_swift_async_errors_propagate(self) -> None:
        functions = testapi.AsyncFunctions

        with self.assertRaises(Exception):
            await functions.will_throw()

    async def test_python_cancellation_ignores_late_swift_completion(self) -> None:
        functions = testapi.AsyncFunctions
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

    async def test_python_async_callback_errors_propagate(self) -> None:
        functions = testapi.AsyncFunctions

        async def throw_from_python() -> int:
            raise ValueError("python async callback failed")

        with self.assertRaisesRegex(ValueError, "python async callback failed"):
            await functions.exercise0(throw_from_python)

    async def test_async_method_returning_uint(self) -> None:
        # asyncSleep is exercised in every other language binding but was missing here;
        # it also covers awaiting a Swift async method that returns the UInt width.
        result = await testapi.Methods.create().async_sleep()
        self.assertIsInstance(result, int)
        self.assertGreaterEqual(result, 0)


if __name__ == "__main__":
    unittest.main()
