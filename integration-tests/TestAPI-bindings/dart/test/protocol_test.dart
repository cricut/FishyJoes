import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';
import 'package:fishyjoes_dart/runtime.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('RangeTests', () {
      test('testProtocols', () {
        final testProtocolEnum = TestProtocolEnum.qux();
        expect(testProtocolEnum.xyzzy(42, [1.234, 45.235890198, 892.80]), equals("thud: 42; grault: [1.234, 45.235890198, 892.8]"));
        expect(testProtocolEnum.garply("Navigate a nostril!"), equals("garply Navigate a nostril! garpity garp"));
      });
  });
}
