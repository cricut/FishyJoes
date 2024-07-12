import 'dart:typed_data';
import 'package:cricut_testapi/testapi.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('ByteTests', () {
      test('testBytesValues', () {
          expect(Bytes.bytes, equals([0xDE, 0xAD, 0xBE, 0xEF]));
          expect(Bytes.data, equals([0x0B, 0xAD, 0xF0, 0x0D]));
      });

      test('testEchoBytes', () {
          final bytes = [0xDE, 0xAD, 0xBE, 0xEF, 0x42];
          final data = Uint8List.fromList(bytes);
          expect(Bytes.echoBytes(bytes), equals(bytes));
          expect(Bytes.echoData(data), equals(data));
      });
  });
}
