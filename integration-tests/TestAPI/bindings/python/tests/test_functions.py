import importlib
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
sys.path.insert(0, str(GENERATED_SRC))


class FunctionTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_sync_functions_round_trip(self) -> None:
        functions = self.testapi.Functions

        self.assertEqual(functions.const42(), 42)
        self.assertEqual(functions.abs(-8), 8)

        self.assertEqual(functions.exercise0(lambda: 123), "123")
        self.assertEqual(functions.exercise1(lambda value: value * 2), "-6")

    def test_nested_and_higher_arity_sync_functions(self) -> None:
        functions = self.testapi.Functions

        self.assertEqual(functions.make_list("a", "b", "c", "d"), ["a", "b", "c", "d"])
        self.assertEqual(functions.int_compose(lambda value: value + 1, lambda value: value * 3)(8), 25)
        self.assertEqual(functions.fifth_thing("hi", 6, 4.2, "bye", lambda: 83)(), 83)
        self.assertEqual(functions.sixth_thing("hi", 6, 4.2, "bye", lambda: 83, 42), 42)

        self.assertEqual(functions.exercise2(lambda f, g: lambda value: f(g(value)) + 10), "35")
        self.assertEqual(functions.exercise4(lambda a, b, c, d: [d, c, b, a]), '["d", "c", "b", "a"]')
        self.assertEqual(functions.exercise5(lambda _a, _b, _c, _d, thunk: lambda: thunk() + 1), "84")
        self.assertEqual(functions.exercise6(lambda _a, _b, _c, _d, thunk, value: thunk() + value), "125")

    def test_sync_function_exceptions_propagate(self) -> None:
        functions = self.testapi.Functions

        with self.assertRaises(Exception):
            functions.will_throw()

        def throw_from_python() -> int:
            raise ValueError("python callback failed")

        with self.assertRaisesRegex(ValueError, "python callback failed"):
            functions.exercise0(throw_from_python)

    def test_void_sync_functions_round_trip(self) -> None:
        functions = self.testapi.Functions
        calls: list[str] = []

        thunk = functions.thunk_twice_maker(lambda: calls.append("called"))

        self.assertIsNone(thunk())
        self.assertEqual(calls, ["called", "called"])


if __name__ == "__main__":
    unittest.main()
