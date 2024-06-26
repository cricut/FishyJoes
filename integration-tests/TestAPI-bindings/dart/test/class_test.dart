import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  setUp(() {
      // Uncomment to get process id for attaching xcode debugger to to debug on the Swift side
      // print('pid: $pid');
      final _ = ensureLoaded;
  });

  group('ClassTests', () {
      test('testEmptyClass', () {
        final a1 = EmptyClass1.create();
        final a2 = EmptyClass1.create();
        expect(a1.blarg, equals("Blarg!"));
        expect(a1.wibbledyWobbledyTimeyWhimey, equals("<wibble>*Wobble*"));
        expect(a1.shme(), equals("Shme! Hand me my hook."));
        expect(a1.Gorpers(), equals("Go Gorp!"));

        expect(a1, equals(a2));
        expect(a1.hashCode, equals(a2.hashCode));
        expect(a1.toString(), equals(a2.toString()));

        final b1 = EmptyClass2.make();
        expect(b1.blorg, equals("Gralb!"));
        expect(b1.wibble, equals("<timey>*Whimey*"));
        expect(b1.shmee(), equals("Shme? What's that ticking sound?"));
        expect(b1.gorp(), equals("Stop Sreprog!"));

        expect(a1, isNot(equals(b1)));
        expect(a1.hashCode, isNot(equals(b1.hashCode)));
        expect(a1.toString(), isNot(equals(b1.toString())));

        expect(a1.toString(), equals("TestAPI.EmptyClass"));
        expect(b1.toString(), equals("TestAPI.EmptyClass2"));
      });
  });
}
