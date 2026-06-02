import importlib
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
sys.path.insert(0, str(GENERATED_SRC))


class PythonNamingTests(unittest.TestCase):
    def test_generated_names_are_safe_and_origin_tracked(self) -> None:
        testapi = importlib.import_module("testapi")

        self.assertEqual(testapi.PythonNamingCollisions.class_, 7)
        self.assertEqual(testapi.PythonNamingCollisions.list, 11)
        self.assertEqual(testapi.PythonNamingCollisions.leading_underscore, 13)
        self.assertEqual(testapi.PythonNamingCollisions.dunder, 17)
        self.assertEqual(testapi.PythonNamingCollisions.url, "upper")
        self.assertEqual(testapi.PythonNamingCollisions.url_2, "title")
        self.assertTrue(testapi.PythonNamingCollisions.is_nan)
        self.assertEqual(testapi.PythonNamingCollisions.from_(), "from")
        self.assertEqual(testapi.PythonNamingCollisions.keyword_args(class_=3, list=4), 7)

        origins = testapi.PythonNamingCollisions.__fishyjoes_origin__
        self.assertEqual(origins["class_"], "TestAPI.PythonNamingCollisions.class")
        self.assertEqual(origins["list"], "TestAPI.PythonNamingCollisions.list")
        self.assertEqual(origins["leading_underscore"], "TestAPI.PythonNamingCollisions._leadingUnderscore")
        self.assertEqual(origins["dunder"], "TestAPI.PythonNamingCollisions.__dunder__")
        self.assertEqual(origins["url"], "TestAPI.PythonNamingCollisions.URL")
        self.assertEqual(origins["url_2"], "TestAPI.PythonNamingCollisions.Url")
        self.assertEqual(origins["is_nan"], "TestAPI.PythonNamingCollisions.isNaN")
        self.assertEqual(origins["from_"], "TestAPI.PythonNamingCollisions.from")


if __name__ == "__main__":
    unittest.main()
