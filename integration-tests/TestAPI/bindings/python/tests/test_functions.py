import unittest

from testapi import functions


class FunctionTests(unittest.TestCase):
    def test_sync_functions_round_trip(self) -> None:
        self.assertEqual(functions.get_const42()(), 42)
        self.assertEqual(functions.get_abs()(-8), 8)

        self.assertEqual(functions.exercise0(lambda: 123), "123")
        self.assertEqual(functions.exercise1(lambda value: value * 2), "-6")

    def test_nested_and_higher_arity_sync_functions(self) -> None:
        self.assertEqual(functions.get_make_list()("a", "b", "c", "d"), ["a", "b", "c", "d"])
        self.assertEqual(functions.get_int_compose()(lambda value: value + 1, lambda value: value * 3)(8), 25)
        self.assertEqual(functions.get_fifth_thing()("hi", 6, 4.2, "bye", lambda: 83)(), 83)
        self.assertEqual(functions.get_sixth_thing()("hi", 6, 4.2, "bye", lambda: 83, 42), 42)

        self.assertEqual(functions.exercise2(lambda f, g: lambda value: f(g(value)) + 10), "35")
        self.assertEqual(functions.exercise4(lambda a, b, c, d: [d, c, b, a]), '["d", "c", "b", "a"]')
        self.assertEqual(functions.exercise5(lambda _a, _b, _c, _d, thunk: lambda: thunk() + 1), "84")
        self.assertEqual(functions.exercise6(lambda _a, _b, _c, _d, thunk, value: thunk() + value), "125")

    def test_sync_function_exceptions_propagate(self) -> None:
        with self.assertRaises(Exception):
            functions.will_throw()

        def throw_from_python() -> int:
            raise ValueError("python callback failed")

        with self.assertRaisesRegex(ValueError, "python callback failed"):
            functions.exercise0(throw_from_python)

    def test_void_sync_functions_round_trip(self) -> None:
        calls: list[str] = []

        thunk = functions.thunk_twice_maker(lambda: calls.append("called"))

        self.assertIsNone(thunk())
        self.assertEqual(calls, ["called", "called"])


if __name__ == "__main__":
    unittest.main()
