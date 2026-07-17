import unittest

import testapi


class ByteTests(unittest.TestCase):
    def test_data_values_and_echo(self) -> None:
        self.assertEqual(testapi.Bytes.data, bytes([0x0B, 0xAD, 0xF0, 0x0D]))
        payload = bytes([0xDE, 0xAD, 0xBE, 0xEF, 0x42])
        self.assertEqual(testapi.Bytes.echo_data(payload), payload)

    def test_uint8_array_values_and_echo(self) -> None:
        self.assertEqual(testapi.Bytes.bytes, [0xDE, 0xAD, 0xBE, 0xEF])
        payload = [0xDE, 0xAD, 0xBE, 0xEF, 0x42]
        self.assertEqual(testapi.Bytes.echo_bytes(payload), payload)


if __name__ == "__main__":
    unittest.main()
