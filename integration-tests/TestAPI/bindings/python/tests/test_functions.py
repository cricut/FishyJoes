"""Function integration tests."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.Functions import Functions


class TestFunctions(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_const42(self) -> None:
        self.assertEqual(Functions.const42()(), 42)

    def test_abs_positive(self) -> None:
        self.assertEqual(Functions.abs()(5), 5)

    def test_abs_negative(self) -> None:
        self.assertEqual(Functions.abs()(-7), 7)

    def test_int_compose(self) -> None:
        composed = Functions.intCompose()(lambda x: x + 1, lambda x: x * 3)
        self.assertEqual(composed(3), 10)
        self.assertEqual(composed(2), 7)

    def test_int_compose_exception(self) -> None:
        def boom(x: int) -> int:
            raise ValueError("boom")
        with self.assertRaises(Exception):
            Functions.intCompose()(boom, lambda x: x)(1)

    def test_add3_things(self) -> None:
        self.assertAlmostEqual(Functions.add3Things()(1.0, 2.0, 3), 6.0, places=5)

    def test_make_list(self) -> None:
        self.assertEqual(Functions.makeList()("a", "b", "c", "d"), ["a", "b", "c", "d"])

    def test_fifth_thing(self) -> None:
        result = Functions.fifthThing()("x", 1, 2.0, "y", Functions.const42())
        self.assertEqual(result(), 42)

    def test_sixth_thing(self) -> None:
        self.assertIsInstance(
            Functions.sixthThing()("x", 1, 2.0, "y", Functions.const42(), 10),
            int,
        )

    # --- exercise0–6: passing Python callables to Swift ---
    def test_exercise0(self) -> None:
        self.assertIsInstance(Functions.exercise0(lambda: 42), str)

    def test_exercise1(self) -> None:
        self.assertIsInstance(Functions.exercise1(lambda x: x + 1), str)

    def test_exercise2(self) -> None:
        self.assertIsInstance(
            Functions.exercise2(lambda f, g: lambda x: g(f(x))), str
        )

    def test_exercise3(self) -> None:
        self.assertIsInstance(Functions.exercise3(lambda a, b, c: a + b + c), str)

    def test_exercise4(self) -> None:
        self.assertIsInstance(
            Functions.exercise4(lambda a, b, c, d: [a, b, c, d]), str
        )

    def test_exercise5(self) -> None:
        self.assertIsInstance(
            Functions.exercise5(lambda s, i, f, s2, thunk: thunk), str
        )

    def test_exercise6(self) -> None:
        self.assertIsInstance(
            Functions.exercise6(lambda s, i, f, s2, thunk, n: n), str
        )

    def test_will_throw(self) -> None:
        with self.assertRaises(Exception):
            Functions.willThrow()

    def test_thunk_twice_maker(self) -> None:
        count = [0]

        def thunk() -> None:
            count[0] += 1

        Functions.thunkTwiceMaker(thunk)()
        self.assertEqual(count[0], 2)


if __name__ == "__main__":
    unittest.main()
