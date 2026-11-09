import unittest

import __PYTHON_IMPORT_PACKAGE__


class ExampleTests(unittest.TestCase):
    def test_generated_package_imports(self) -> None:
        print(__PYTHON_IMPORT_PACKAGE__)
        self.assertTrue(True)
