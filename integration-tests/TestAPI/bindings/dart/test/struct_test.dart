import 'package:cricut_testapi/testapi.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  setUp(() {
      // Uncomment to get process id for attaching xcode debugger to to debug on the Swift side
      // print('pid: $pid');
      final _ = ensureLoaded;
  });

  group('StructTests', () {
      test('testEmptyStruct', () {
        final a1 = EmptyStruct.create();
        expect(a1.tutu, equals(35671));
        expect(a1.tatiana, equals("Toodles! ta ta for now..."));
        expect(a1.aap(), equals("The Netherlands"));

        final a2 = EmptyStruct.create();
        expect(a2.tutu, equals(35671));
        expect(a2.tatiana, equals("Toodles! ta ta for now..."));
        expect(a2.aap(), equals("The Netherlands"));

        expect(a1, equals(a2));
        expect(a1.hashCode, equals(a2.hashCode));
        expect(a1.toString(), equals(a2.toString()));
        expect(a1.toString(), equals("TestAPI.EmptyStruct()"));

        final b1 = EmptyStruct2.create();
        expect(b1.tutu, equals(12897));
        expect(b1.tatiana, equals("Arrivederci"));
        expect(b1.aap(), equals("The Netherlands2"));
        expect(b1.zxccxz(), equals("Cambridge University (England)2"));

        expect(a1, isNot(equals(b1)));
        expect(a1.hashCode, isNot(equals(b1)));
        expect(a1.toString(), isNot(equals(b1.toString())));
      });

      test('testConstruction', () {
          final memberwise = Structs_MemberwiseStruct.create();
          expect(memberwise.immutable, equals("Eternal"));
          expect(memberwise.mutable, equals("Fickle"));

          final reference = Structs_ReferenceStruct.create();
          expect(reference.immutable, equals("Eternal"));
          expect(reference.mutable, equals("Fickle"));
      });

      test('testMutablility', () {
          final memberwise = Structs_MemberwiseStruct.create();
          expect(memberwise.immutable, equals("Eternal"));
          // TODO: Ensure this is true!
          // memberwise.immutable = "Should generate a compile Error!";
          expect(memberwise.mutable, equals("Fickle"));
          memberwise.mutable = "Fickle as the wind";
          expect(memberwise.mutable, isNot(equals("Fickle")));

          final reference = Structs_ReferenceStruct.create();
          expect(reference.immutable, equals("Eternal"));
          // TODO: Ensure this is true!
          // reference.immutable = "Should generate a compile Error!";
          expect(reference.mutable, equals("Fickle"));
          memberwise.mutable = "Fickle as the wind";
          expect(memberwise.mutable, isNot(equals("Fickle")));
      });

      test('testEquality', () {
          expect(Structs_MemberwiseStruct.create(), equals(Structs_MemberwiseStruct.create()));
          expect(Structs_ReferenceStruct.create(), equals(Structs_ReferenceStruct.create()));
          expect(Structs_MemberwiseStruct.create(), isNot(equals(Structs_ReferenceStruct.create())));
      });

      test('MutatingFunctions', () async {
          final struct = Structs_MutableStruct.create();
          expect(struct.i, equals(0));
          struct.increment();
          expect(struct.i, equals(1));
          await struct.incrementAsync();
          expect(struct.i, equals(2));
      });

      test('AsyncMemberFunctions', () async {
          final memberwise = Structs_MemberwiseStruct.create();
          expect(await memberwise.asyncGetMutable(), equals("Fickle"));
          final reference = Structs_ReferenceStruct.create();
          expect(await reference.asyncGetMutable(), equals("Fickle"));
          final mutable = Structs_MutableStruct.create();
          expect(await mutable.asyncGetI(), equals(0));
      });
  });
}
