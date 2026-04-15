"""Bytes integration tests."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.Bytes import Bytes


class TestBytes(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_bytes_values(self) -> None:
        self.assertEqual(Bytes.bytes(), [0xDE, 0xAD, 0xBE, 0xEF])
        self.assertEqual(Bytes.data(), bytes([0x0B, 0xAD, 0xF0, 0x0D]))

    def test_echo_bytes(self) -> None:
        b = Bytes.bytes()
        self.assertEqual(Bytes.echoBytes(b), b)

    def test_echo_data(self) -> None:
        d = Bytes.data()
        self.assertEqual(Bytes.echoData(d), d)


if __name__ == "__main__":
    unittest.main()
