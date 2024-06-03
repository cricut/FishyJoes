import 'package:cricut_test_api/cricut_test_api.dart';
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
        final emptyStruct1 = EmptyStruct.create();
        expect(emptyStruct1.tutu, equals(35671));
        expect(emptyStruct1.tatiana, equals("Toodles! ta ta for now..."));
        expect(emptyStruct1.aap(), equals("The Netherlands"));

        final emptyStruct2 = EmptyStruct.create();
        expect(emptyStruct2.tutu, equals(35671));
        expect(emptyStruct2.tatiana, equals("Toodles! ta ta for now..."));
        expect(emptyStruct2.aap(), equals("The Netherlands"));

        expect(emptyStruct1, equals(emptyStruct2));
        expect(emptyStruct1.hashCode, equals(emptyStruct2.hashCode));
        expect(emptyStruct1.toString(), equals(emptyStruct2.toString()));
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
