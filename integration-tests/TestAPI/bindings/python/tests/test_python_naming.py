import importlib
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class PythonNamingTests(unittest.TestCase):
    def test_generated_names_are_safe_and_origin_tracked(self) -> None:
        testapi = importlib.import_module("testapi")

        self.assertEqual(testapi.PythonNamingCollisions.class_, 7)
        self.assertEqual(testapi.PythonNamingCollisions.list, 11)
        self.assertEqual(testapi.PythonNamingCollisions.leading_underscore, 13)
        self.assertEqual(testapi.PythonNamingCollisions.dunder, 17)
        self.assertEqual(testapi.PythonNamingCollisions.url, "upper")
        # Sibling collisions are a generation error, not a silent `_2` suffix;
        # `Url` carries an explicit `python: title_url` name, used verbatim.
        self.assertEqual(testapi.PythonNamingCollisions.title_url, "title")
        self.assertFalse(hasattr(testapi.PythonNamingCollisions, "url_2"))
        self.assertTrue(testapi.PythonNamingCollisions.is_nan)
        self.assertEqual(testapi.PythonNamingCollisions.from_(), "from")
        self.assertEqual(testapi.PythonNamingCollisions.keyword_args(class_=3, list=4), 7)

        origins = testapi.PythonNamingCollisions.__fishyjoes_origin__
        self.assertEqual(origins["class_"], "TestAPI.PythonNamingCollisions.class")
        self.assertEqual(origins["list"], "TestAPI.PythonNamingCollisions.list")
        self.assertEqual(origins["leading_underscore"], "TestAPI.PythonNamingCollisions._leadingUnderscore")
        self.assertEqual(origins["dunder"], "TestAPI.PythonNamingCollisions.__dunder__")
        self.assertEqual(origins["url"], "TestAPI.PythonNamingCollisions.URL")
        self.assertEqual(origins["title_url"], "TestAPI.PythonNamingCollisions.Url")
        self.assertEqual(origins["is_nan"], "TestAPI.PythonNamingCollisions.isNaN")
        self.assertEqual(origins["from_"], "TestAPI.PythonNamingCollisions.from")

    def test_case_type_attribute_shadowing_keeps_annotations_valid(self) -> None:
        # ShadowBox's case-type attribute `Shade` shadows the imported `Shade`
        # type inside the class body; the stub resolves annotations through a
        # module-level `_Shade` alias (verified for real by the typing gate),
        # and the runtime behavior is unaffected.
        testapi = importlib.import_module("testapi")

        shade = testapi.Shade(darkness=0.8)
        box = testapi.ShadowBox.shade(shade)
        self.assertEqual(box.all_shades, [shade])
        self.assertEqual(testapi.ShadowBox.empty().all_shades, [])
        self.assertEqual(
            testapi.ShadowBox.darkest([testapi.Shade(darkness=0.2), shade]),
            shade,
        )
        # The case-type attribute and the top-level type are distinct classes.
        self.assertIsNot(testapi.ShadowBox.Shade, testapi.Shade)


if __name__ == "__main__":
    unittest.main()
