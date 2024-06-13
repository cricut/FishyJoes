import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';
import 'package:fishyjoes_dart/runtime.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('ResultTests', () {
    test('testResultValues', () {
      expect(Results.aSuccess.getOrNull(), equals(42));
      expect(Results.aFailure.exceptionOrNull()?.message, equals("reboot needed"));

      expect(Results.processResult(ResultSuccess("yay")), equals("YAY"));
      var failResult = ResultFailure<String, Results_Error>(Results_Error(message: "reasons"));
      expect(Results.processResult(failResult), equals("fail: reasons"));
    });
  });
}
