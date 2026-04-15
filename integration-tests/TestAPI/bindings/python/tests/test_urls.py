"""URL integration tests.

Mirrors C# URLTests in Cricut.TestAPI.Tests/URLTests.cs.
URLs are represented as plain Python strings on the Python side.
"""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.URLs import URLs


class TestURLValues(unittest.TestCase):
    """URL value tests (mirrors testURLValues)."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_simple(self) -> None:
        self.assertEqual(URLs.simple(), "https://www.google.com")

    def test_remote_file(self) -> None:
        self.assertEqual(
            URLs.remoteFile(),
            "https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png",
        )

    def test_local_file(self) -> None:
        self.assertEqual(URLs.localFile(), "file:///Users/someuser/Desktop/a.png")

    def test_data_image_scheme(self) -> None:
        url = URLs.dataImage()
        self.assertIsInstance(url, str)
        self.assertTrue(url.startswith("data:"), f"Expected data: URL, got: {url[:40]!r}")


class TestURLEcho(unittest.TestCase):
    """URL round-trip echo tests (mirrors testURLEcho)."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_echo_simple(self) -> None:
        url = URLs.simple()
        self.assertEqual(URLs.echo(url), url)

    def test_echo_remote_file(self) -> None:
        url = URLs.remoteFile()
        self.assertEqual(URLs.echo(url), url)

    def test_echo_local_file(self) -> None:
        url = URLs.localFile()
        self.assertEqual(URLs.echo(url), url)

    def test_echo_data_image(self) -> None:
        url = URLs.dataImage()
        self.assertEqual(URLs.echo(url), url)


if __name__ == "__main__":
    unittest.main()
