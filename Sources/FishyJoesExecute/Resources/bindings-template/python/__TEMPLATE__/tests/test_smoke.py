import unittest

from cricut___LOWERCASE_MODULE_NAME__ import ensure_loaded


class SmokeTests(unittest.TestCase):
    def test_import_and_load(self) -> None:
        ensure_loaded()
        self.assertEqual(2 + 2, 4)
