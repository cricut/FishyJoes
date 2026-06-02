import importlib
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
sys.path.insert(0, str(GENERATED_SRC))


class TupleTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_tuple2_value(self) -> None:
        tuples = self.testapi.Tuples

        self.assertEqual(tuples.tuple2, (1, "two"))

    def test_tuple3_value(self) -> None:
        tuples = self.testapi.Tuples

        self.assertEqual(tuples.tuple3, ("one", 2.1, "three"))

    def test_tuple4_value(self) -> None:
        tuples = self.testapi.Tuples

        self.assertEqual(tuples.tuple4, ((1, "two"), ("one", 2.1, "three"), "IV", True))

    def test_tuple5_and_tuple6_values_and_echo(self) -> None:
        tuples = self.testapi.Tuples

        tuple2 = (1, "two")
        tuple3 = ("one", 2.1, "three")
        tuple4 = (tuple2, tuple3, "IV", True)
        tuple5 = ("I", 2, tuple4, tuple3, tuple2)
        tuple6 = ("one", 2, 3.14, tuple4, tuple5, False)

        self.assertEqual(tuples.tuple5, tuple5)
        self.assertEqual(tuples.tuple6, tuple6)
        self.assertTrue(tuples.check_tuples(tuple2, tuple3, tuple4, tuple5, tuple6))
        self.assertFalse(tuples.check_tuples(tuple2, tuple3, tuple4, tuple5, ("wrong", 2, 3.14, tuple4, tuple5, False)))


if __name__ == "__main__":
    unittest.main()
