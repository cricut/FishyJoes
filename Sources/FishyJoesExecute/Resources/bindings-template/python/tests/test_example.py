import unittest

import __PYTHON_IMPORT_PACKAGE__ as bindings


class ExampleTests(unittest.TestCase):
    def test_generated_package_imports(self) -> None:
        self.assertTrue(bindings.SUPPORTED)

