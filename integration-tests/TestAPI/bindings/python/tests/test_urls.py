import unittest
from urllib.parse import urlparse

import testapi


class URLTests(unittest.TestCase):
    def test_url_values_and_echo(self) -> None:
        self.assertEqual(testapi.URLs.simple, "https://www.google.com")
        self.assertEqual(
            testapi.URLs.remote_file,
            "https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png",
        )
        self.assertEqual(testapi.URLs.local_file, "file:///Users/someuser/Desktop/a.png")
        self.assertEqual(urlparse(testapi.URLs.data_image).scheme, "data")
        self.assertEqual(testapi.URLs.echo(testapi.URLs.simple), testapi.URLs.simple)


if __name__ == "__main__":
    unittest.main()
