import importlib
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class ByteTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_data_values_and_echo(self) -> None:
        self.assertEqual(self.testapi.Bytes.data, bytes([0x0B, 0xAD, 0xF0, 0x0D]))
        payload = bytes([0xDE, 0xAD, 0xBE, 0xEF, 0x42])
        self.assertEqual(self.testapi.Bytes.echo_data(payload), payload)

    def test_uint8_array_values_and_echo(self) -> None:
        self.assertEqual(self.testapi.Bytes.bytes, [0xDE, 0xAD, 0xBE, 0xEF])
        payload = [0xDE, 0xAD, 0xBE, 0xEF, 0x42]
        self.assertEqual(self.testapi.Bytes.echo_bytes(payload), payload)


if __name__ == "__main__":
    unittest.main()
