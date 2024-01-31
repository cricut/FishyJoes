import 'dart:ffi';

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
        testProtocolEnum.foo();
        expect(testProtocolEnum.bar(), equals(true));
        testProtocolEnum.baz(true);
        expect(testProtocolEnum.garply("Navigate a nostril!"), equals("garply Navigate a nostril! garpity garp"));
        expect(testProtocolEnum.xyzzy(42, [1.234, 45.235890198, 892.80]), equals("thud: 42; grault: [1.234, 45.235890198, 892.8]"));
        
        final testProtocolStruct = TestProtocolStruct(corge: "Raft a river of lava-ah!");
        expect(testProtocolStruct.corge, equals("Raft a river of lava-ah!"));
        testProtocolStruct.corge = "Spank a plankton too! (take that)";
        expect(testProtocolStruct.corge, equals("Spank a plankton too! (take that)"));

        testProtocolStruct.foo();
        expect(testProtocolStruct.bar(), equals(false));
        testProtocolStruct.baz(true);
        expect(testProtocolStruct.garply("An octopus in your neighborhood?"), equals("garp garpity An octopus in your neighborhood? garpee"));
        expect(testProtocolStruct.xyzzy(42, [1.234, 45.235890198, 892.80]), equals("thud: 42 | grault: [1.234, 45.235890198, 892.8]"));

        final testProtocolClass = TestProtocolClass.init("Step inside it's a wilder ride!");
        expect(testProtocolClass.corge, equals("Step inside it's a wilder ride!"));
        testProtocolClass.foo();
        expect(testProtocolClass.bar(), equals(true));
        testProtocolClass.baz(false);
        expect(testProtocolClass.garply("Surfin' on a sine wave"), "garplify Surfin' on a sine wave parguino");
        expect(testProtocolClass.xyzzy(42, [1.234, 45.235890198, 892.80]), equals("thud: 42 \\|/ grault: [1.234, 45.235890198, 892.8]"));
      });
  });
}
