import importlib
import unittest
from urllib.parse import urlparse



class URLTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_url_values_and_echo(self) -> None:
        self.assertEqual(self.testapi.URLs.simple, "https://www.google.com")
        self.assertEqual(
            self.testapi.URLs.remote_file,
            "https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png",
        )
        self.assertEqual(self.testapi.URLs.local_file, "file:///Users/someuser/Desktop/a.png")
        self.assertEqual(urlparse(self.testapi.URLs.data_image).scheme, "data")
        self.assertEqual(self.testapi.URLs.echo(self.testapi.URLs.simple), self.testapi.URLs.simple)


if __name__ == "__main__":
    unittest.main()
